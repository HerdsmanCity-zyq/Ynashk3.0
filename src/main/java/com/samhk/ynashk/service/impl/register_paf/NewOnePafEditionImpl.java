package com.samhk.ynashk.service.impl.register_paf;

import com.samhk.ynashk.mapper.FrameworkVersionPafDao;
import com.samhk.ynashk.mapper.PafVisioVersionDao;
import com.samhk.ynashk.mapper.ProjectVisioUploadLogDao;
import com.samhk.ynashk.service.NewOnePafEditionBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.util.DateTimeUtils;
import com.samhk.ynashk.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author youquan zhong
 * @Date 2019/12/29 10:42
 */
@Slf4j
@Service
public class NewOnePafEditionImpl implements NewOnePafEditionBo {

    @Resource
    private FrameworkVersionPafDao frameworkVersionPafDao;

    @Resource
    private PafVisioVersionDao pafVisioVersionDao;
    @Resource
    private ProjectVisioUploadLogDao projectVisioUploadLogDao;


    @Override
    public List<FrameworkVersionPafVO> getAllFVPByProject() {
        return pafVisioVersionDao.getAllFVPByProject();
    }

    @Override
    public List<Map> test() {
        return pafVisioVersionDao.test();
    }

    @Override
    public Map<Integer,List<FrameworkVersionPafVO>> getAllFramework() {
        List<ProjectVo> projectVos = frameworkVersionPafDao.getAllFramework();
        Map<Integer,List<FrameworkVersionPafVO>> map = new HashMap<>();
        if (projectVos != null && projectVos.size() != 0){
            for (ProjectVo p:projectVos){
                if (p.getList() != null && p.getList().size() != 0){
                    map.put(p.getProjectId(),p.getList());
                }else{
                    List<FrameworkVersionPafVO> list = new ArrayList<>();
                    map.put(p.getProjectId(),list);
                }

            }
        }
        return map;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Object insertPafVisioVersion(PafVisioVersionVo vo) throws IOException {
        //如果lastUpdate字段为空的话，说明是新增
        if (StringUtils.isEmpty(vo.getLastUpdate())){
            //保存

            vo.getCreated_user();
            vo.getLast_upd_user();
            if (vo.getVisioFile() != null){
                savePafVisio(vo);
            }
            pafVisioVersionDao.insertPafVisioVersion(vo);



        }else{
            //更新
           String lud = getLUDByIds(vo);

           if (!lud.equals(vo.getLastUpdate())){
               return ResultVO.getFailed(Constants.getText("paf.message.01"));
           }else{
               vo.getLast_upd_user();
               if (vo.getVisioFile() != null){
                   savePafVisio(vo);
               }
               pafVisioVersionDao.updatePafVisioVersionBy(vo);

           }
        }
        vo.setVisioFile(null);
        if (StringUtils.isEmpty(vo.getOldPafVisioVersion())||
                !vo.getPafVisioVersion().equals(vo.getOldPafVisioVersion())){

            vo.setOldPafVisioVersion(vo.getPafVisioVersion());
        }
        vo.setLastUpdate(getLUDByIds(vo));
        //把这个时间返回给前端，保存在页面的隐藏域中
        return ResultVO.getSuccess("success",vo);



    }


    @Override
    public PafVisioVersionVo queryPafVisioVersionIsExist(Integer projectId, String pafId, String pafVisioVersion) {
        return pafVisioVersionDao.queryPafVisioVersionIsExist(projectId,pafId,pafVisioVersion);
    }


    @Override
    public FrameworkVersionPafVO findFVP(Integer projectId, String pafId, String frameworkId) {
        return frameworkVersionPafDao.findFVP(projectId,pafId,frameworkId);
    }

    @Override
    public Object uploadPafFile(PafVisioVersionVo vo) {
        //TODo youquan 会出现这种情况
        if (StringUtils.isEmpty(vo.getOldPafVisioVersion())){
            vo.setOldPafVisioVersion(vo.getPafVisioVersion());
        }
        //查询当前记录是否存在
        PafVisioVersionVo originalVo=pafVisioVersionDao.queryPafVisioVersionIsExist(vo.getProjectId(),vo.getPafId(),vo.getOldPafVisioVersion());
        if (originalVo==null) {
            return ResultVO.getFailed(Constants.getText("paf.newOnePafEdition.01"));
        }

        //删除之前上传的文件
        if (originalVo.getVisioPath() != null){
            File file = new File(originalVo.getVisioPath());
            file.delete();
        }


        try {

            int i;
            i = savePafVisioVersion(vo);
            // 在上传文件的时候，先保存了newpafvisioVersion到数据库

            vo.setVisioName(Constants.getFileName(vo.getVisioFile()));
            vo.setVisioFile(null);
            //更新了版本，保存数据后，用的是oldPafVisioVersion去查询的lastUpdate
            if (!vo.getOldPafVisioVersion().equals(vo.getPafVisioVersion())){
                vo.setOldPafVisioVersion(vo.getPafVisioVersion());
            }
            vo.setLastUpdate(getLUDByIds(vo));
            if (i == 1) {
                return ResultVO.getSuccess(Constants.getText("paf.newOnePafEdition.02"), vo);
            }

        } catch (IOException e) {
            log.info(e.getMessage());
            return ResultVO.getFailed(Constants.getText("paf.newOnePafEdition.03"));
        }


        return ResultVO.getFailed(Constants.getText("paf.newOnePafEdition.04"));
    }

    /**
     * 保存pafVisioVersion
     *
     * @return
     * @throws IOException
     */
    @Transactional(rollbackFor = Exception.class)
    public Integer savePafVisioVersion(PafVisioVersionVo vo) throws IOException {

        String path = Constants.getApplicationValue("paf.vsb.file.path");
        String fileName =Constants.getFileName(vo.getVisioFile()) ;
        if ("".equals(fileName.trim())){
            return 0;
        }
        vo.setVisioName(fileName);
        int result = 0;

        String visioPath = path + vo.getPafId()+File.separator+ DateTimeUtils.getCurrentShortDateStr() + File.separator + "NewOnePAFEdition" + File.separator + fileName;
        String curpath =  path + vo.getPafId();
        File curpathDIR = new File(curpath);
        File myfile = new File(visioPath);

        if (!curpathDIR.exists()) {
            curpathDIR.mkdir();
            FileUtils.copyInputStreamToFile(vo.getVisioFile().getInputStream(), myfile);
        } else {
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String firstName = fileName.substring(0, fileName.lastIndexOf("."));
            String lastName = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = firstName + sdf2.format(vo.getLud()) + lastName;
            visioPath = path + vo.getPafId() + File.separator + DateTimeUtils.getCurrentShortDateStr()+ File.separator + "NewOnePAFEdition" + File.separator + newFileName;
            File newFile = new File(visioPath);

            FileUtils.copyInputStreamToFile(vo.getVisioFile().getInputStream(), newFile);

        }
        vo.setVisioPath(visioPath);
        vo.setVisioName(fileName);

        ProjectVisioUploadLogVO visioupload=new ProjectVisioUploadLogVO();
        visioupload.setPafId(vo.getPafId());
        visioupload.setProjectId(vo.getProjectId());

        visioupload.setUploadBy(vo.getLuu());


        //TODO youquan

        if (StringUtils.isEmpty(vo.getOldPafVisioVersion())){
            vo.setOldPafVisioVersion(vo.getPafVisioVersion());
        }
        visioupload.setPafVisioVersion(vo.getPafVisioVersion());



        int temp1=pafVisioVersionDao.updatePafVisioVersionBy(vo);
        int temp2=projectVisioUploadLogDao.insertProjectVisioUploadLog(visioupload);
        if(temp1==1&&temp2==1){
            result=1;
        }

        return result;
    }

    @Override
    public String downloadFile(HttpServletResponse response, HttpServletRequest request, PafVisioVersionVo vo) {
        //查找最新的visio文檔
         vo=pafVisioVersionDao.queryPafVisioVersionIsExist(vo.getProjectId(),vo.getPafId(),vo.getPafVisioVersion());
        if (vo != null) {
            com.samhk.ynashk.util.FileUtils.downloadFile(response,request,vo.getVisioPath(), vo.getVisioName());
        }
        return "";
    }

    @Override
    public String getLUDByIds(PafVisioVersionVo vo) {
       //todo youquan  代码优化
       if (StringUtils.isEmpty(vo.getOldPafVisioVersion())){
           vo.setOldPafVisioVersion(vo.getPafVisioVersion());
       }
       String lud =  pafVisioVersionDao.getLUDByIds(vo);
       if (lud == null){
           lud = "";
       }
        return lud;
    }


    @Override
    public Object checkDownload(PafVisioVersionVo vo) {
        vo=pafVisioVersionDao.queryPafVisioVersionIsExist(vo.getProjectId(),vo.getPafId(),vo.getPafVisioVersion());

        if (vo == null) {
            return ResultVO.getFailed(Constants.getText("paf.newOnePafEdition.05"));
        }
        return ResultVO.getSuccess(Constants.getText("paf.newOnePafEdition.06"));
    }

    /**
     * 保存pafVisio
     *
     * @throws IOException
     */
    private void savePafVisio(PafVisioVersionVo vo) throws IOException {
        String path = Constants.getApplicationValue("paf.vsb.file.path");
        String fileName =Constants.getFileName(vo.getVisioFile()) ;
        if ("".equals(fileName.trim())){
            return;
        }
        vo.setVisioName(Constants.getFileName(vo.getVisioFile()));


        String visioPath = path +vo.getProjectId() + File.separator + fileName;
        String curpath =  path + vo.getProjectId();
        File curpathDIR = new File(curpath);
        File myfile = new File(visioPath);
        if (!curpathDIR.exists()) {
            curpathDIR.mkdir();
            FileUtils.copyInputStreamToFile(vo.getVisioFile().getInputStream(), myfile);
        } else {
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String firstName = fileName.substring(0, fileName.lastIndexOf("."));
            String lastName = fileName.substring(fileName.lastIndexOf("."));
            String newFileName = firstName + sdf2.format(new Date()) + lastName;
            visioPath = path + vo.getProjectId() + File.separator + newFileName;
            File newFile = new File(visioPath);

            FileUtils.copyInputStreamToFile(vo.getVisioFile().getInputStream(), newFile);

        }
        ProjectVisioUploadLogVO uploadLogVO = new ProjectVisioUploadLogVO();
        uploadLogVO.setPafId(vo.getPafId());
        uploadLogVO.setPafVisioVersion(vo.getPafVisioVersion());
        uploadLogVO.setProjectId(vo.getProjectId());
        uploadLogVO.setUploadBy(vo.getLuu());
        projectVisioUploadLogDao.insertProjectVisioUploadLog(uploadLogVO);


        vo.setVisioPath(visioPath);

    }


    @Override
    public String getLatestVisioVersion(Integer projectId, String pafId) {
        return pafVisioVersionDao.getLatestVisioVersion(projectId,pafId);
    }

    @Override
    public Boolean deleteOnePAFEdition(Integer projectId, String pafId, String pafVisioVersion) {
        return pafVisioVersionDao.deleteOnePAFEdition(projectId,pafId,pafVisioVersion);
    }

}
