package com.samhk.ynashk.html;


import com.google.gson.Gson;
import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.NewPafAssignBo;
import com.samhk.ynashk.service.impl.register_paf.SearchProjectPafImpl;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.*;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Component
public class OptionService {

    @Resource
    private SelectDownDao selectDownDao;
    @Resource
    private PafRemarksDao pafRemarksDao;
    @Resource
    private ProjectPafDao projectPafDao;
    @Resource
    private SysUserDao sysUserDao;

    @Resource
    private NewPafAssignBo newPafAssignBo;

    @Resource
    private FrameworkVersionPafDao frameworkVersionPafDao;

    @Resource
    private PafVisioVersionDao pafVisioVersionDao;

    @Resource
    private ProjectDao projectDao;

    @Resource
    private SearchProjectPafImpl searchProjectPafImpl;

    @Resource
    private FrameworkPafDocumentDao frameworkPafDocumentDao;

    public void getDataSources(String dropdownName, List<String> value, List<String> key, String where) {
        String lang = "";
        if (Constants.getSession() == null
                || Constants.getSession().getAttribute("lang") == null) {
            lang = "zh";
        } else {
            lang = "en";
        }

        Gson json = new Gson();
        switch (dropdownName) {
            case "lang":
                value.add("TC");
                key.add("中文繁體");
                value.add("SC");
                key.add("中文简体");
                value.add("EN");
                key.add("English");
                break;
            case "getPafProject":
                List<ProjectVo> list = selectDownDao.getAllProject();
                if (list.size() > 0) {
                    for (ProjectVo vo : list) {
                        key.add(Constants.getKeyByLang(vo.getProjectNameChi(),
                                vo.getProjectName(), lang));
                        value.add(vo.getProjectId() + "' info='"
                                + (json.toJson(vo)));
                    }
                }
                break;
            case "getFrameworkPaf":
                List<FrameworkVersionPafVO> FKVo = frameworkVersionPafDao.getAllFRAPaf();;
                if (FKVo.size() > 0) {
                    for (FrameworkVersionPafVO vo : FKVo) {
                        vo.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
                        key.add(vo.getPafName()+"/"+vo.getFrameworkName()+"/"+vo.getVersionsNo()+"/"+
                                vo.getBpwinNo());
                        value.add(vo.getFrameworkId() + "' info='"
                                + (json.toJson(vo)));
                    }
                }
                break;
            case "getProjectPaf":
                List<FrameworkProjectPafVo> fVo = searchProjectPafImpl.getAllProjectPaf();
                if (fVo.size() > 0) {
                    for (FrameworkProjectPafVo vo : fVo) {
                        //读取fileList
                        vo.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
                        key.add(vo.getPafName()+"/"+vo.getFrameworkName()+"/"+vo.getVersionsNo()+"/"+
                                vo.getBpwinNo());
                        value.add(vo.getFrameworkId() + "' info='"
                                + (json.toJson(vo)));
                    }
                }
                break;
            case "getPafRemarks":
                List<PafRemarksVo> remarksVos = pafRemarksDao.findAllPafRemarksVo();
                if (remarksVos.size() != 0) {
                    for (PafRemarksVo f : remarksVos) {
                        key.add(f.getPafRemarkDesc());
                        value.add("" + f.getPafRemarksId());
                    }
                }
                break;
            case "GetAllRoleCode":
                List<SystemUserRoleVo> list1 = selectDownDao.GetAllRoleCode();
                for (SystemUserRoleVo vo : list1) {
                    value.add(vo.getRoleCode());
                    key.add(vo.getRoleName());
                }
                break;
            case "GetStaffCode":
                List<SystemUserVo> list2 = selectDownDao.getStaffCode();
                for (SystemUserVo vo : list2) {
                    value.add(vo.getStaffCode() + "' info='" + json.toJson(vo));
                    key.add(vo.getStaffCode());
                }
                break;
            case "getPafSA":
                List<SystemUserVo> SAlist = selectDownDao.getAllSA();
                if (SAlist.size() != 0) {
                    for (SystemUserVo vo : SAlist) {
                        key.add(vo.getUserId());
                        value.add(vo.getUserCode());
                    }
                }
                break;
            case "GetStaffPosition":
                List<StaffPositionVo> StaffPositionVoList = selectDownDao.getStaffPosition();
                for (StaffPositionVo vo : StaffPositionVoList) {
                    value.add(vo.getPositionId());
                    key.add(vo.getPositionChiName());
                }
                break;
            case "GetStaffDepartment":
                List<StaffDepartmentVo> StaffDepartmentVoList = selectDownDao.getStaffDepartment();
                for (StaffDepartmentVo vo : StaffDepartmentVoList) {
                    value.add(vo.getDepartmentId());
                    key.add(vo.getDepartmentChiName());
                }
                break;
            case "getPersonCode":
                List<PersonVo> personVoList = selectDownDao.getPersonCode();
                for (PersonVo vo : personVoList) {
                    key.add(vo.getPersonCode1());
                    value.add(vo.getPersonCode() + "' info='"
                            + (json.toJson(vo)));
                }
                break;
            case "getuserBygroupCode":
                SystemUserVo userVo = new SystemUserVo();
                userVo.setGroupCode(where);
                List<SystemUserVo> systemUserVoList = sysUserDao.getuserBygroupCode(userVo);
                for (SystemUserVo vo : systemUserVoList) {
                    key.add(vo.getEnglishName().length()==0?vo.getChineseName():vo.getEnglishName());
                    value.add(vo.getUserCode());
                }
                break;
            case "getPafVisioVersionVoAllByStatus":
                List<PafVisioVersionVo> pafVisioVersionVoList = newPafAssignBo.getPafVisioVersionVoAllByStatus(where);
                for (PafVisioVersionVo vo : pafVisioVersionVoList) {
                    key.add(vo.getFrameworkVersionPafVO().getPafName());
                    value.add(vo.getPafId() +"'projectId='"+vo.getProjectId());
                }
                break;
            case "GetUserDepartment":
                List<StaffDepartmentVo> StaffDepartmentVoList2 = selectDownDao.getStaffDepartment();
                for (StaffDepartmentVo vo : StaffDepartmentVoList2) {
                    value.add(vo.getDepartmentChiName());
                    key.add(vo.getDepartmentChiName());
                }
                break;//用户列表部门下拉选项

            case "getProjectPafAll":
                List<ProjectPafVo> pafVoList = selectDownDao.getProjectPafAll();
                for (ProjectPafVo vo:pafVoList) {
                     key.add(vo.getProjectVos().getProjectName());
                     value.add(vo.getProjectId().toString()+"'project-id='"+vo.getProjectId());
                }
                break;

            case "GetUserPosition":
                List<StaffPositionVo> StaffPositionVoList2 = selectDownDao.getStaffPosition();
                for (StaffPositionVo vo : StaffPositionVoList2) {
                    value.add(vo.getPositionChiName());
                    key.add(vo.getPositionChiName());
                }
                break;

            case "getProjectWithoutVisio":
                List<ProjectVo> pv = projectDao.findProjectWithoutVisio();
                if (pv.size()>0){
                    for (ProjectVo vo:pv) {
                        value.add(vo.getProjectId().toString());
                        key.add(vo.getProjectName());
                    }

                }
                break;
            case "getPafNameInFvp":
                Gson gson = new Gson();
                List<FrameworkVersionPafVO> fvp = pafVisioVersionDao.getAllFVPByProject();
                if (fvp.size()>0){
                    for (FrameworkVersionPafVO vo:fvp){
                        value.add(vo.getPafId());
                        key.add(vo.getPafName() + "' info='" + gson.toJson(vo) + "' pafId='"+vo.getPafId()  );
                    }
                }

                break;
            default:
                throw new IllegalStateException("Unexpected value: " + dropdownName);
        }
    }

}