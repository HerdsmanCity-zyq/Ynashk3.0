package com.samhk.ynashk.controller.home_management.user_main;

import com.google.gson.Gson;
import com.samhk.ynashk.mapper.StaffDepartmentDao;
import com.samhk.ynashk.mapper.StaffPositionDao;
import com.samhk.ynashk.service.NewStaffBo;
import com.samhk.ynashk.service.NewUserBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.StaffVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class NewUserAction {

    @Resource(name = "newUserImpl")
    NewUserBo newUserImpl;
    @Resource(name = "newStaffImpl")
    public NewStaffBo newStaffBo;
    @Resource(name = "staffDepartmentDao")
    public StaffDepartmentDao staffDepartmentDao;
    @Resource(name = "staffPositionDao")
    public StaffPositionDao staffPositionDao;

    @RequestMapping(value = "newUser.do", params = {"action=saveUser"})
    @ResponseBody
    public String save(SystemUserVo systemUserVo, String reqChangepwdInd) throws Exception {
        return new Gson().toJson(newUserImpl.save(systemUserVo, reqChangepwdInd));
    }

    @RequestMapping(value = "getAutoCode.do", params = {"action=getAutoCode"})
    @ResponseBody
    public String getAutoCode() {
        return newUserImpl.getAutoCode();
    }

    @RequestMapping("newUser.do")
    public String execute(SystemUserVo systemUserVo) {
        SystemUserVo vo = newUserImpl.searchUser(systemUserVo);
//        三个状态，用户更改跳转，新增用户跳转，员工跳转
        if (vo == null && systemUserVo.getStaffCode() != null) {
            StaffVo staffVo = newStaffBo.getStaffByCode(systemUserVo.getStaffCode());
//            字段名称命名不同，如果直接传回前端，会求不到值
            vo = new SystemUserVo();
            vo.setEmail(staffVo.getEmail());
            vo.setStaffCode(staffVo.getStaffCode());
            vo.setYzLastUpDate(staffVo.getYz_last_up_date());
            vo.setDepartment(staffDepartmentDao.getStaffDepartment(staffVo.getDepartment()));
            vo.setEnglishName(staffVo.getEngName());
            vo.setChineseName(staffVo.getChiName());
            vo.setNickName(staffVo.getNickname());
            vo.setWechat(staffVo.getWechat());
            vo.setTelephoneNo(staffVo.getTelephoneNo());
            vo.setSkype(staffVo.getSkype());
            vo.setPosition(staffPositionDao.getStaffPosition(staffVo.getPosition()));
        }
        Constants.getRequest().setAttribute("systemUser", vo);

        return "Home_Management/user_main/newUser";
    }

    @RequestMapping(value = "newUser.do", params = {"action=CheckUserId"})
    @ResponseBody
    public String saveCheckRepeate(HttpServletRequest request) {
        //检查是否存在重复的
        String type = request.getParameter("type");
        String result = null;
        switch (type) {
            case "USER_ID":
                result = newUserImpl.checkUserID(request.getParameter("USER_ID"));
                break;
            case "USER":
                result = newUserImpl.checkUser(request.getParameter("staffCode"));
                break;
            default:
                System.out.println(type);
                break;
        }
        return result;
    }


}
