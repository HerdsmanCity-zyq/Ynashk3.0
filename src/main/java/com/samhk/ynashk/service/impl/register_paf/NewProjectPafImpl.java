package com.samhk.ynashk.service.impl.register_paf;


import com.mysql.jdbc.StringUtils;
import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.NewProjectPafBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.util.DateTimeUtils;
import com.samhk.ynashk.vo.*;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("newProjectImpl")
public class NewProjectPafImpl implements NewProjectPafBo {

    private static Logger log = LoggerFactory.getLogger(NewProjectPafImpl.class);
    @Resource
    private ProjectPafDao projectPafDao;
    @Resource
    private ProjectPafDocumentDao projectPafDocumentDao;
    @Resource
    private PafVisioVersionDao pafVisioVersionDao;


    @Override
    public Boolean saveNewProjectPaf(ProjectPafVo projectPafVo) {
        List<ProjectPafVo> list = projectPafDao.selectByProjectAndPaf(projectPafVo);
        int i = 0;
        Boolean flag = false;
        //更新操作
        if (list.size() > 0) {
            flag = projectPafDao.updateProjectPaf(projectPafVo);
        } else {
            i = projectPafDao.insertProjectPaf(projectPafVo);
        }
        if (i == 1) {
            return true;
        }
        return flag;

    }

    @Override
    public Object insertProjectPafDoc(FrameworkVersionPafVO frameworkVersionPafVO, ProjectPafVo projectPafVo) {
        List<ProjectPafVo> pList = projectPafDao.selectByProjectAndPaf(projectPafVo);
        //确认project_Paf表中是否已有对应的数据信息（要保存文件，先确认此表数据存在）
        if (pList.size() > 0) {
            //update
            return saveNewProjectPafDoc(frameworkVersionPafVO, projectPafVo);
        } else {
            return ResultVO.getFailed(Constants.getText("newProjectPaf.notExistRecord"));
        }
    }

    @Override
    public void downloadProjectPafDocFile(HttpServletResponse response, HttpServletRequest request, ProjectPafDocumentVo vo) {
        //查找projectPafDoc文件
        vo = projectPafDocumentDao.checkPafDocUnique(vo);
        if (vo != null) {
            com.samhk.ynashk.util.FileUtils.downloadFile(response, request, vo.getPafDocumentPath(), vo.getPafDocumentName());
        }
    }

    @Override
    public Object deleteProjectPaf(ProjectPafVo vo) {
        //查找PAF Visio版本記錄和上載文件
        List<ProjectPafDocumentVo> docList = projectPafDocumentDao.findDocByPafIdAndProjectId(vo);
        List<PafVisioVersionVo> pafVisioList = pafVisioVersionDao.findAllByProjectIdAndPafId(vo.getProjectId(), vo.getPafId());

        if (docList.size() == 0 && pafVisioList.size() == 0) {
            Boolean flag = projectPafDao.deleteProjectPaf(vo);
            if (flag) {
                return ResultVO.getSuccess("文件删除成功");
            } else {
                return ResultVO.getFailed("文件删除失败");
            }
        } else {
            //只要被引用就不能删除
            return ResultVO.getFailed("該文件不可刪除");
        }
    }

    /**
     * 保存新的的ProjectPafDoc文件
     *
     * @param vo
     * @param projectPafVo
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Object saveNewProjectPafDoc(FrameworkVersionPafVO vo, ProjectPafVo projectPafVo) {
        try {
            //存文件的地址
            String filePath = Constants.getApplicationValue("paf.doc.file.path");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            Date date = new Date();
            Integer ppdCount = 0;
            ProjectPafDocumentVo ppdVo = new ProjectPafDocumentVo();
            if (vo.getFileList() != null) {
                for (FrameworkPafDocumentVO v : vo.getFileList()) {
                    if (v.getFiles() != null && !"".equals(v.getFiles().getOriginalFilename())) {
                        //加上projectDoc分辨不同的文件
                        String fileName = v.getFiles().getOriginalFilename();
                        String path = filePath + vo.getPafId() + File.separator + sdf.format(date) + File.separator + "projectPaf\\" + fileName;
                        ppdVo.setPafDocumentName(v.getFiles().getOriginalFilename());
                        ppdVo.setPafId(projectPafVo.getPafId());
                        ppdVo.setProjectId(projectPafVo.getProjectId());
                        ppdVo.setPafDocumentSize(v.getFiles().getSize() / 1024 + "");
                        ppdVo.setPafDocumentDesc(v.getPafDocumentDesc());
                        ppdVo.setPafDocumentPath(path);
                        ppdVo.setCrd(new Date());
                        ppdVo.setCru(projectPafVo.getLuu());
                        ppdVo.setLud(new Date());
                        ppdVo.setLuu(projectPafVo.getLuu());

                        //保存projectPaf文件
                        saveProjectPaf(v, path);

                        ProjectPafDocumentVo ppvo = projectPafDocumentDao.checkPafDocUnique(ppdVo);
                        //有就更新
                        if (ppvo != null) {
                            ppdCount = projectPafDocumentDao.updatePafDocItem(ppdVo);
                        } else {//无就插入
                            if (!StringUtils.isEmptyOrWhitespaceOnly(ppdVo.getPafDocumentName())) {
                                ppdCount = projectPafDocumentDao.insertNewPafDocItem(ppdVo);
                            } else {
                                //当重复上传文件时，含下滑线的数据（已上传过）不重复上传
                                ppdCount = 1;
                            }
                        }
                    }

                }
            } else {
                //无文件上传
                return ResultVO.getSuccess(Constants.getText("newProjectPaf.saveSucc"));
            }
            //文件保存完毕，且projectPaf数据也保存完毕
            if (ppdCount > 0) {
                Map<String, Object> map = new HashMap<>();
                getPafProjectDocData(projectPafVo, map);
                return ResultVO.getSuccess(Constants.getText("newProjectPaf.saveSucc"), map);
            }
            return ResultVO.getFailed(Constants.getText("newProjectPaf.saveFailed"));
        } catch (IOException e) {
            log.info(e.getMessage());
            e.printStackTrace();
            return ResultVO.getFailed(Constants.getText("newProjectPaf.uploadException"));
        } catch (Exception e) {
            log.info(e.getMessage());
            e.printStackTrace();
            return ResultVO.getFailed(Constants.getText("newProjectPaf.uploadFailed"));
        }
    }

    /**
     * 获取projectPafDoc的列表
     *
     * @param v
     * @param map
     */
    private void getPafProjectDocData(ProjectPafVo v, Map<String, Object> map) {
        List<ProjectPafDocumentVo> projectPafDocumentVoList = projectPafDocumentDao.findDocByPafIdAndProjectId(v);
        v.setFileList(projectPafDocumentVoList);
        map.put("projectPafDocumentVo", v);
    }

    /**
     * 保存project_paf文件
     *
     * @param v
     * @param path
     * @throws IOException
     */
    private void saveProjectPaf(FrameworkPafDocumentVO v, String path) throws IOException {
        String filePath = Constants.getApplicationValue("paf.doc.file.path");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        File files = new File(path);
        Date date = new Date();
        if (!files.exists()) {
            FileUtils.copyInputStreamToFile(v.getFiles().getInputStream(), files);
        } else {
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            //加上projectDoc分辨不同的文件
            String originaFileName = (v.getFiles().getOriginalFilename());
            //已经保存过的文件不需要再保存（有下划线的文件名对应的列表）
            if (!StringUtils.isEmptyOrWhitespaceOnly(originaFileName)) {
                String firStr = originaFileName.substring(0, originaFileName.lastIndexOf("."));
                String lastStr = originaFileName.substring(originaFileName.lastIndexOf("."));
                String newPath = filePath + v.getPafId() + File.separator + sdf.format(date) + File.separator + firStr + "_" + sdf2.format(date) + "projectPaf\\" + lastStr;
                File files2 = new File(newPath);
                FileUtils.copyInputStreamToFile(v.getFiles().getInputStream(), files2);
            }

        }
    }

}
