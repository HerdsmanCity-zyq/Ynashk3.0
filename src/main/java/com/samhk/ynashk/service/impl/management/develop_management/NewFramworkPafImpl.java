package com.samhk.ynashk.service.impl.management.develop_management;

import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.NewFrameworkPafBo;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.regex.Pattern;

@Slf4j
@Service("NewFramworkPafImpl")
public class NewFramworkPafImpl implements NewFrameworkPafBo {

    @Resource
    SeqNoDao seqNoDao;
    @Resource
    FrameworkVersionPafDao frameworkVersionPafDao;
    @Resource
    FrameworkDao frameworkDao;
    @Resource
    VersionsDao versionsDao;
    @Resource
    PafRemarksDao pafRemarksDao;
    @Resource
    SysUserDao sysUserDao;
    @Resource
    FrameworkVisioUploadLogDao frameworkVisioUploadLogDao;
    @Resource
    FrameworkPafDocumentDao frameworkPafDocumentDao;
    @Resource
    ProjectDao projectDao;

    @Override
    public FrameworkVersionPafVO goNewFRAPaf() {
        FrameworkVersionPafVO fraPaf = new FrameworkVersionPafVO();
        fraPaf.setFrameworkId("FR00001");
        //framework
        fraPaf.setFrameworkVo(frameworkDao.findAllFramework());
        //versions
        fraPaf.setVersionsVo(versionsDao.findByFrameworkId(null));
        //user
        SystemUserVo uservo = new SystemUserVo();
        uservo.setGroupCode("SA");
        fraPaf.setSystemUserVo(sysUserDao.getuserBygroupCode(uservo));
        //sa
        uservo = (SystemUserVo) Constants.getSession().getAttribute("currUser");
        fraPaf.setSa(uservo.getUserId());
        //remarks
        fraPaf.setPafRemarksVo(pafRemarksDao.findAllPafRemarksVo());
        return fraPaf;
    }

    @Override
    public FrameworkVersionPafVO viewFRAPAF(FrameworkVersionPafVO vo) {
        FrameworkVersionPafVO fraPaf = frameworkVersionPafDao.findFRAPafBypafId(vo);
        fraPaf.setFrameworkVo(frameworkDao.findAllFramework());

        //sa
        SystemUserVo uservo = new SystemUserVo();
        uservo.setGroupCode("SA");
        fraPaf.setVersionsVo(versionsDao.findByFrameworkId(fraPaf.getFrameworkId()));
        fraPaf.setSystemUserVo(sysUserDao.getuserBygroupCode(uservo));
        //remarks
        fraPaf.setPafRemarksVo(pafRemarksDao.findAllPafRemarksVo());

        //document
        fraPaf.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
        //project
        fraPaf.setProjectVo(projectDao.findAllProject());
        return fraPaf;
    }

    @Override
    public Object uploadPafFile(FrameworkVersionPafVO vo) {
        FrameworkVersionPafVO originalvo = frameworkVersionPafDao.findFRAPafBypafId(vo);
        if (originalvo == null) {
            return ResultVO.getFailed(Constants.getText("newFRAPAF.notExistRecord"));
        }
        try {
            int i;
            i = saveFRAPafVisio(vo);
            if (i == 1) {
                return ResultVO.getSuccess(Constants.getText("newFRAPAF.uploadSucc"), Constants.getFileName(vo.getVisioFile()));
            }
        } catch (IOException e) {
            log.info(e.getMessage());
            return ResultVO.getFailed(Constants.getText("newFRAPAF.uploadException"));
        }
        return ResultVO.getFailed(Constants.getText("newFRAPAF.uploadFailed"));
    }

    @Override
    public Object insertnewFRAPAFItem(FrameworkVersionPafVO vo) {

        if (!StringUtils.isEmpty(vo.getPafId())) {
            FrameworkVersionPafVO originalvo = frameworkVersionPafDao.findFRAPafBypafId(vo);
            if (originalvo != null) {
                //update
                return updateFRAPaf(vo);
            } else {
                return ResultVO.getFailed(Constants.getText("newFRAPAF.saveFailed"));
            }
        } else {
            if (frameworkVersionPafDao.checkDataUnique(vo) > 0) {
                return ResultVO.getFailed(Constants.getText("newFRAPAF.FRAVersionBpwinNotUnique"));
            } else {
                //save
                return saveFRAPaf(vo);
            }
        }
    }


    @Transactional(rollbackFor = Exception.class)
    public Object saveFRAPaf(FrameworkVersionPafVO vo) {
        try {
            vo.setPafId(getPafNoSeq());
            int i = frameworkVersionPafDao.insertnewFRAPAFItem(vo);
            if (i == 1) {
                //保存visio文檔
                if (vo.getVisioFile() != null && vo.getVisioFile().getSize() != 0) {
                    saveFRAPafVisio(vo);
                }

                //保存document文件
                if (vo.getFileList() != null && vo.getFileList().size() > 0) {
                    for (FrameworkPafDocumentVO v : vo.getFileList()) {
                        if (v.getFiles() != null) {

                            //save
                            v.setPafId(vo.getPafId());
                            v.setPafDocumentName(Constants.getFileName(v.getFiles()));
                            saveFRAPafDocument(v);
                            v.setLuu(vo.getLuu());
                            v.setCru(vo.getCru());
                            frameworkPafDocumentDao.insertNewDocItem(v);
                        }
                    }
                }

                Map<String, Object> map = new HashMap<>();
                map.put("fileList", frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
                map.put("pafId", vo.getPafId());
                return ResultVO.getSuccess(Constants.getText("newFRAPAF.saveSucc"), map);
            }
        } catch (IOException e) {
            log.info(e.getMessage());
            e.printStackTrace();
            throw new RuntimeException(Constants.getText("newFRAPAF.uploadFailed"));
        } catch (Exception e) {
            log.info(e.getMessage());
            e.printStackTrace();
            throw new RuntimeException(Constants.getText("newFRAPAF.saveFailed"));
        }
        return null;
    }

    /**
     * 更新paf
     *
     * @param vo
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public Object updateFRAPaf(FrameworkVersionPafVO vo) {
        try {
            //更新paf
            int i = frameworkVersionPafDao.updateFRAversion(vo);
            if (i > 0) {
                //保存visio文檔
                if (vo.getVisioFile() != null && vo.getVisioFile().getSize() > 0) {
                    saveFRAPafVisio(vo);
                } else {
                }
                //保存document文件
                if (vo.getFileList() != null) {

                    //delete document not in vo.filelist
                    frameworkPafDocumentDao.deleteDocByPafIdAndDocName(vo);

                    for (FrameworkPafDocumentVO v : vo.getFileList()) {
                        if (v.getFiles() != null) {

                            v.setPafId(vo.getPafId());
                            v.setLuu(vo.getLuu());
                            FrameworkPafDocumentVO tempvo = frameworkPafDocumentDao.checkDocUnique(v);
                            if (tempvo != null) {
                                //update
                                frameworkPafDocumentDao.updateDocItem(v);
                            } else {
                                //save
                                v.setCru(vo.getCru());
                                v.setPafDocumentName(Constants.getFileName(v.getFiles()));
                                saveFRAPafDocument(v);
                                frameworkPafDocumentDao.insertNewDocItem(v);
                            }
                        }
                    }
                }else{
                    //delete all document
                    frameworkPafDocumentDao.deleteDocByPafId(vo.getPafId());
                }
            }
            Map<String, Object> map = new HashMap<>();
            map.put("fileList", frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
            map.put("pafId", vo.getPafId());
            return ResultVO.getSuccess(Constants.getText("newFRAPAF.saveSucc"), map);
        } catch (IOException e) {
            log.info(e.getMessage());
            e.printStackTrace();
            throw new RuntimeException(Constants.getText("newFRAPAF.uploadFailed"));
        } catch (Exception e) {
            log.info(e.getMessage());
            e.printStackTrace();
            throw new RuntimeException(Constants.getText("newFRAPAF.saveFailed"));
        }
    }

    /**
     * 保存pafVisio
     *
     * @param vo
     * @return
     * @throws IOException
     */
    private Integer saveFRAPafVisio(FrameworkVersionPafVO vo) throws IOException {
        String path = Constants.getApplicationValue("paf.vsb.file.path");
        String fileName = Constants.getFileName(vo.getVisioFile());
        if ("".equals(fileName.trim())) {
            return 0;
        }
        vo.setVisioName(fileName);
        int result = 0;

        String visioPath = path + vo.getPafId() + File.separator +"FRAPafVisio"+File.separator + fileName;
        String curpath = path + vo.getPafId()+ File.separator +"FRAPafVisio";
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
            visioPath = path + vo.getPafId() + File.separator + newFileName;
            File newFile = new File(visioPath);
            FileUtils.copyInputStreamToFile(vo.getVisioFile().getInputStream(), newFile);
        }
        vo.setVisioPath(visioPath);
        vo.setVisioName(fileName);

        FrameworkVisioUploadLogVO visioupload = new FrameworkVisioUploadLogVO();
        visioupload.setPafId(vo.getPafId());
        visioupload.setVisioName(fileName);
        visioupload.setUploadBy(vo.getLuu());

        int temp1 = frameworkVersionPafDao.updateFRAversion(vo);
        int temp2 = frameworkVisioUploadLogDao.insertVisioUploadLog(visioupload);
        if (temp1 == 1 && temp2 == 1) {
            result = 1;
        }
        return result;
    }

    /**
     * 保存文件
     *
     * @param v
     * @throws IOException
     */
    private void saveFRAPafDocument(FrameworkPafDocumentVO v) throws IOException {
        String filePath = Constants.getApplicationValue("paf.doc.file.path");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Date date = new Date();
        String fileName = Constants.getFileName(v.getFiles());
        String dir = filePath + v.getPafId() + File.separator + DateTimeUtils.getCurrentShortDateStr() + File.separator+"FRAPafDoc";
        String path = dir+ File.separator + fileName;

        File dirpath = new File(dir);
        if (!dirpath.exists()) {
            dirpath.mkdirs();
        }
        File files = new File(path);
        if (!files.exists()) {
            FileUtils.copyInputStreamToFile(v.getFiles().getInputStream(), files);
        } else {
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssSSS");

            String originaFileName = Constants.getFileName(v.getFiles());
            String firStr = originaFileName.substring(0, originaFileName.lastIndexOf("."));
            String lastStr = originaFileName.substring(originaFileName.lastIndexOf("."));
            String newPath = filePath + v.getPafId() + File.separator + sdf.format(date) + File.separator + firStr + "_" + sdf2.format(date) + lastStr;
            File files2 = new File(newPath);
            FileUtils.copyInputStreamToFile(v.getFiles().getInputStream(), files2);
        }
        v.setPafDocumentName(fileName);
        v.setPafDocumentSize(v.getFiles().getSize() / 1024 + "");
        v.setPafDocumentPath(path);
    }

    @Override
    public String downloadFile(HttpServletResponse response, HttpServletRequest request, FrameworkVersionPafVO vo) {
        //查找最新的visio文檔
        vo = frameworkVersionPafDao.findFRAPafBypafId(vo);
        if (vo != null) {
            com.samhk.ynashk.util.FileUtils.downloadFile(response, request, vo.getVisioPath(), vo.getVisioName());
        }
        return "";
    }

    @Override
    public Object checkDownload(FrameworkVersionPafVO vo) {
        vo = frameworkVersionPafDao.findFRAPafBypafId(vo);
        if (vo == null) {
            return ResultVO.getFailed(Constants.getText("newFRAPAF.notExistVisio"));
        }
        return ResultVO.getSuccess(Constants.getText("newFRAPAF.ExistVisio"));
    }

    @Override
    public String downloadDocFile(HttpServletResponse response, HttpServletRequest request, FrameworkPafDocumentVO vo) {
        //查找最新的visio文檔
        vo = frameworkPafDocumentDao.checkDocUnique(vo);
        if (vo != null) {
            com.samhk.ynashk.util.FileUtils.downloadFile(response, request, vo.getPafDocumentPath(), vo.getPafDocumentName());
        }
        return "";

    }

    @Override
    public Object getMaxVersionByFraId(VersionsVo vo) {
        vo = versionsDao.getMaxVersionByFraId(vo);
        return ResultVO.getSuccess("", vo);
    }

    @Override
    public Object inserNewVersion(VersionsVo vo) {
        String regex = "^([1-9]\\d|\\d)(.([1-9]\\d|\\d)){2}$";
        //版本号格式正确与否
        if (Pattern.matches(regex, vo.getVersionsNO())) {
            VersionsVo maxVersion = versionsDao.getMaxVersionByFraId(vo);
            if (TransferVersionsNO(vo.getVersionsNO()) > TransferVersionsNO(maxVersion.getVersionsNO())) {
                //save
                int signal = versionsDao.inserNewVersion(vo);
                if (signal > 0) {
                    //success
                    return ResultVO.getSuccess(Constants.getText("newFRAPAF.createVersionSucc"));
                } else {
                    //failed
                    return ResultVO.getFailed(Constants.getText("newFRAPAF.createVersionFailed"));
                }
            } else {
                //failed
                return ResultVO.getFailed(Constants.getText("newFRAPAF.versionCannotLowerThanNewest"));
            }
        } else {
            return ResultVO.getFailed(Constants.getText("newFRAPAF.incorrectVersionPattern"));
        }
    }

    public int TransferVersionsNO(String versionsNO) {
        String[] arr = versionsNO.split("\\.");
        String sb = arr[0] + arr[1] + arr[2];
        return Integer.parseInt(sb);
    }

    public static ConcurrentMap<String, SeqNoVo> concurrentIdsMap = new ConcurrentHashMap<>();

    public synchronized String getPafNoSeq() {
        SeqNoVo wvo = seqNoDao.findByRemember("NEW_PAF");

        if (concurrentIdsMap.get("seq") == null || !concurrentIdsMap.get("seq").getPerfix().equals(wvo.getPerfix())) {

            String number = (wvo.getNumber() + 1) + "";
            wvo.setNumber(Integer.parseInt(number));
            StringBuilder perfix = new StringBuilder(wvo.getPerfix());

            int seq = wvo.getLengthOfWatipersonNo() - perfix.length() - number.length();
            if (seq > 0) {
                for (int i = 0; i < seq; i++) {
                    perfix.append("0");
                }
                perfix.append(number);
            }

            List<String> listWaitNo = frameworkVersionPafDao.getPafNO(wvo);
            if (listWaitNo.contains(perfix.toString())) {
                perfix = new StringBuilder();
                String s = listWaitNo.get(0).replace(wvo.getPerfix(), "");
                String no = (Integer.parseInt(s) + 1) + "";
                seq = wvo.getLengthOfWatipersonNo() - wvo.getPerfix().length() - no.length();
                wvo.setNumber(Integer.parseInt(no));
                perfix = new StringBuilder(wvo.getPerfix());

                for (int i = 0; i < seq; i++) {
                    perfix.append("0");
                }
                perfix.append(no);

            }
            concurrentIdsMap.put("seq", wvo);
            return perfix.toString();

        } else {
            wvo = concurrentIdsMap.get("seq");

            String number = (wvo.getNumber() + 1) + "";
            wvo.setNumber(Integer.parseInt(number));
            concurrentIdsMap.get("seq").setNumber(Integer.parseInt(number));

            StringBuilder perfix = new StringBuilder(wvo.getPerfix());

            int seq = wvo.getLengthOfWatipersonNo() - perfix.length() - number.length();


            for (int i = 0; i < seq; i++) {
                perfix.append("0");
            }
            perfix.append(number);

            return perfix.toString();
        }

    }
}
