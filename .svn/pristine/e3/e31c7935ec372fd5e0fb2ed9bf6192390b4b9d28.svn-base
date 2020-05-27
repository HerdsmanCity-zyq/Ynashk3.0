package com.samhk.ynashk.service.impl;


import com.samhk.ynashk.controller.LoginAction;
import com.samhk.ynashk.mapper.LoginDao;
import com.samhk.ynashk.service.LoginBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.FunctionVo;
import com.samhk.ynashk.vo.SystemUserVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
@Slf4j
@Service(value = "loginImpl")
public class LoginImpl implements LoginBo {

    @Resource(name = "loginDao")
    public LoginDao loginDao;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public LoginAction.LoginFlag login(SystemUserVo vo) throws ParseException {
        // session id
        vo.setTicket(Objects.requireNonNull(Constants.getSession()).getId());
        int i = loginDao.updateLoginTicket(vo);
        if (i < 1) {
            loginDao.insertLoginTicket(vo);
        }
        //判断用户名是否存在
        SystemUserVo userNameVo = loginDao.checkUserIsExist(vo);
        if (userNameVo==null){
            loginDao.setUserFailedCount(vo);
            return LoginAction.LoginFlag.IS_NOTEXIST;
        }

        SystemUserVo userVo = loginDao.checkExistUser(vo);
        if (userVo == null) {
            // wrong password
            loginDao.setUserFailedCount(vo);
            return LoginAction.LoginFlag.PASSWORD_ERROR;

        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date roleStopDate = null;
        Date roleStartDate = null;
        try {
            roleStopDate = sdf.parse(userVo.getRoleStopDate() + " 23:59:59");
        } catch (ParseException e) {
            return LoginAction.LoginFlag.ROLESTOP;
        }
        try {
            roleStartDate = sdf.parse(userVo.getRoleEffectDate() + " 23:59:59");
        } catch (ParseException e) {
            return LoginAction.LoginFlag.ROLENOTSTART;
        }
        //判断账户是停用
        if ("N".equals(userVo.getActiveInd())) {
            return LoginAction.LoginFlag.IS_INACTIVE;

        }  else if(roleStartDate.getTime()>System.currentTimeMillis()){
            return LoginAction.LoginFlag.ROLENOTSTART;
        }else if(roleStopDate.getTime()<System.currentTimeMillis()){
            return LoginAction.LoginFlag.ROLESTOP;
        }else if (userVo.getFailedCount() >= 5) {// locked
            return LoginAction.LoginFlag.IS_LOCK;
        } else {
            loginDao.setUserFailedCount(userVo);
            // 用户账号的停止时间
            Date systemDate = new Date(); // 获取系统当前时间


            Date userEffectTime = Constants.getDateFormat(
                    "yyyy-MM-dd HH:mm:ss").parse(
                    userVo.getEffectDate());
            Constants.getSession().setAttribute("loginTime", new Date());
            SystemUserVo systemUserVo = loginDao.getPrivileges(vo);

            Constants.getSession().setAttribute(Constants.LOGUSER, systemUserVo);
            //判断账户是否 未生效
            if (systemDate.getTime() < userEffectTime.getTime()) {
                return LoginAction.LoginFlag.UNEFFECTIVE;
            }
            //判断账户是否过期
            Date userStopTime = Constants.getDateFormat(
                    "yyyy-MM-dd HH:mm:ss").parse(
                    userVo.getStopDate());
            if (systemDate.getTime() > userStopTime.getTime()) {
                return LoginAction.LoginFlag.USER_STOP;
            }




        }
        return LoginAction.LoginFlag.LOGIN_SUCCESS;
    }

    @Override
    public String userInterceptorCheck() {
        SystemUserVo sessionUserVo = (SystemUserVo) Objects.requireNonNull(Constants.getSession())
                .getAttribute(Constants.LOGUSER);
        SystemUserVo dbUserVo = loginDao.userInterceptorCheck(sessionUserVo);
        // 1 是否在其他地方登录 ，2 用户权限是否有修改，3 用户角色是否有修改，4用户信息是否有修改
        if (dbUserVo == null) {
            // 在该养老院已被删除
            return "error.login.userDelete";
        } else if (!sessionUserVo.getTicket().equals(dbUserVo.getTicket())) {
            // 用户在其他地方登录 请重新登录
            return "error.login.userLoginOtherAddress";
        } else if ((sessionUserVo.getLud().compareTo(dbUserVo
                .getLud())) != 0) {
            // 用户信息已经被修改
            return "error.login.userIsUpdate";
        }
        return null;
    }

    @Override
    public int logout(SystemUserVo systemUserVo) {
        return loginDao.logout(systemUserVo);
    }

    @Override
    public Map<String, Object> getPrivileges(SystemUserVo systemUserVo) {
        systemUserVo = loginDao.getPrivileges(systemUserVo);
        Map<String, Object> map = new HashMap<>();

        List<String> funcPrivileges = new ArrayList<>();
        if (systemUserVo != null && systemUserVo.getUserRoleVo().getFunctionList().size() > 0) {
            for (FunctionVo functionVo : systemUserVo.getUserRoleVo().getFunctionList()) {
                funcPrivileges.add(functionVo.getObjectName());
            }
            map.put("role", systemUserVo.getRoleCode());
            map.put("funcs", funcPrivileges);
        }
        return map;

    }
}
