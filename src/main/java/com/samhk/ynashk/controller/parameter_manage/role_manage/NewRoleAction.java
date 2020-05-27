package com.samhk.ynashk.controller.parameter_manage.role_manage;



import com.samhk.ynashk.service.SystemRoleBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.SysProcessVo;
import com.samhk.ynashk.vo.SystemRoleProcessVo;
import com.samhk.ynashk.vo.SystemUserRoleVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class NewRoleAction {

    @Resource(name="systemRoleImpl")
    public SystemRoleBo systemRoleBo;


    //进入新增角色的页面
    @RequestMapping(value="newRole.do")
    public String execut(HttpServletRequest request, SystemUserRoleVo vo){
        String treeData = systemRoleBo.jsonTree(vo);
        Constants.getRequest().setAttribute("treeData", treeData);
        return "parameter_manage/newRole";
    }

    //新增角色进行保存
    @RequestMapping(value="newRole.do",params={"action=SaveNewRole"},produces = {"application/text;charset=UTF-8"})
    @ResponseBody
    public String SaveNewRole(String jsonTree){

        String result=systemRoleBo.SaveNewRole(jsonTree);
        return result;
    }

    //进入检视角色页面
    @RequestMapping(value="searchRole.do")
    public String searchRoleList(Model model, SystemUserRoleVo systemUserRoleVo){
        List<SystemUserRoleVo> systemUserRoleList =  systemRoleBo.getAllUserRoleList(systemUserRoleVo);
        model.addAttribute("systemUserRoleList", systemUserRoleList);
        return "parameter_manage/userRoleList";
    }

    //检视一个角色
    @RequestMapping(value="searchOneRole.do",params={"action=checkOneRole"},produces={"applocation/text;charset=UTF-8"})
    public String searchOneRole(HttpServletRequest request,SystemUserRoleVo rolevo){
        String treeData=systemRoleBo.jsonTree(rolevo);
        Constants.getRequest().setAttribute("treeData", treeData);
        String code = request.getParameter("roleCode");
        SystemUserRoleVo vo = systemRoleBo.getOneRole(code);
        request.setAttribute("roleVo", vo);
        return "parameter_manage/newRole";
    }
}
