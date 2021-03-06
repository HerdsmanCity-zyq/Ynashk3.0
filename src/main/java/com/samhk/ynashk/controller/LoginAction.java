package com.samhk.ynashk.controller;


import com.google.gson.Gson;
import com.samhk.ynashk.service.LoginBo;
import com.samhk.ynashk.service.MenuBo;
import com.samhk.ynashk.shiro.RoleNotStartException;
import com.samhk.ynashk.shiro.RoleStopException;
import com.samhk.ynashk.shiro.UserStopException;
import com.samhk.ynashk.shiro.realm.MyAuthToken;
import com.samhk.ynashk.util.AESUtil;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.util.MessageHandle;
import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.support.RequestContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.UnknownHostException;
import java.util.*;

@Controller
@RequestMapping("/")
public class LoginAction {

    private static Logger logger = LoggerFactory.getLogger(LoginAction.class);
    @Autowired
    private MessageHandle messageHandle;
    @Resource(name = "menuImpl")
    public MenuBo menuBo;
    public enum LoginFlag {
        CHANGEPASSWORD, PASSWORD_ERROR, IS_INACTIVE, IS_LOCK, IS_NOTEXIST, LOGIN_SUCCESS, OPERATINGPOST, UNEFFECTIVE,ROLESTOP,ROLENOTSTART,
        USER_STOP
    }

    @Resource(name = "loginImpl")
    public LoginBo loginBo;

    @RequestMapping("welcome.do")
    public String welcome(HttpServletRequest request) {
        Constants.setObject(Constants.REQUESTCONTEXT, new RequestContext(request));
        if (request.getParameter("message") != null && !"".equals(request.getParameter("message"))) {
            request.setAttribute("message", Constants.getText(request.getParameter("message")));
        }
        return "login";
    }

    @RequestMapping("changeLanguage.do")
    public String changeLanguage(String language, SystemUserVo systemUserVo, HttpServletRequest request, HttpServletResponse response) {
        if ("TC".equals(language)) {
            //代码中即可通过以下方法进行语言设置
            request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale("zh", "CN"));
        } else if ("EN".equals(language)) {
            //代码中即可通过以下方法进行语言设置
            request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, new Locale("en", "US"));
        }
        request.setAttribute("lang", language);
        request.setAttribute("searchTable", systemUserVo);
        return "login";
    }


    public String login(String language, SystemUserVo systemUserVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
        StringBuffer message = new StringBuffer("");
        Constants.setObject(Constants.REQUEST, request);
        Constants.validate(systemUserVo.getUserId(), false, -1, true, "com.login.username", message);
        Constants.validate(systemUserVo.getLoginPsw(), false, -1, true, "com.login.pwd", message);
        if (message.length() > 1) {
            return message.toString();
        }
        //设置用户登陆成功的ip(本机ip)
        systemUserVo.setIp(Constants.getIpAddr(request));
        LoginAction.LoginFlag loginFlag = loginBo.login(systemUserVo);
        String returnMessage = "Login Failed";
        switch (loginFlag) {
            case CHANGEPASSWORD:
                returnMessage = Constants.getText("error.login.passwordExpiry");
                break;
            case PASSWORD_ERROR:
                returnMessage = Constants.getText("error.login.wrongPassword");
                break;
            case IS_LOCK:
                returnMessage = Constants.getText("error.login.userIsLocked");
                break;
            case IS_NOTEXIST:
                returnMessage = Constants.getText("error.login.userDoesNotExist");
                break;
            case UNEFFECTIVE:
                returnMessage = Constants.getText("error.login.userUnEffective");
                break;
            //登陆成功
            case LOGIN_SUCCESS:
                returnMessage = "successfully";
                break;
            default:
        }
        Objects.requireNonNull(Constants.getSession()).setAttribute("language", language);
        return returnMessage;
    }
    @RequestMapping("login.do")
    @ResponseBody
    public String login2(String language,SystemUserVo systemUserVo,HttpServletRequest request,HttpServletResponse response) throws UnknownHostException {
        StringBuffer message = new StringBuffer("");
        Constants.setObject(Constants.REQUEST, request);
        Constants.validate(systemUserVo.getUserId(),false,-1, true, "com.login.username", message);
        Constants.validate(systemUserVo.getLoginPsw(),false,-1, true, "com.login.pwd", message);
        //Constants.validate(systemUserVo.getNursingHome(),true,-1, true, "com.login.nursingHome.select", message);
        if(message.length()>1){
            return message.toString();
        }

        systemUserVo.setIp(Constants.getIpAddr(request));
        Subject subject = SecurityUtils.getSubject();

        // 此处的密码应该是按照后台的加密规则加密过的，不应该传输明文密码
        MyAuthToken token = new MyAuthToken(systemUserVo.getUserId(), systemUserVo.getLoginPsw().toCharArray(),systemUserVo);
        String returnMessage = "Login Failed" ;

        try {
            subject.login(token);
            returnMessage="successfully";
        } catch (UnknownAccountException e) {
            returnMessage = messageHandle.getMessage("error.login.userDoesNotExist");
            logger.error(returnMessage);
        } catch (IncorrectCredentialsException e) {
            returnMessage = messageHandle.getMessage("error.login.wrongPassword");
            logger.error(returnMessage);
        } catch (LockedAccountException e){
            returnMessage = messageHandle.getMessage("error.login.userIsLocked");
            logger.error(returnMessage);
        } catch(DisabledAccountException e){
            returnMessage = messageHandle.getMessage("error.login.userIsStop");
            logger.error(returnMessage);
        } catch (AccountException e){
            returnMessage = messageHandle.getMessage("error.login.userUnEffective");
            logger.error(returnMessage);
        } catch(RoleStopException e){
            returnMessage = messageHandle.getMessage("error.login.roleStop");
        }catch(RoleNotStartException e){
            returnMessage = messageHandle.getMessage("error.login.roleNotStart");
        }catch (UserStopException e){
            returnMessage = messageHandle.getMessage("error.login.userStop");
            logger.error(returnMessage);
        }catch (AuthenticationException e) {

        }



        Objects.requireNonNull(Constants.getSession()).setAttribute("language", language);
        return returnMessage;
    }

    @RequestMapping(value = "login.do", params = {"action=logout"})
    public String logout(String language, SystemUserVo systemUserVo, HttpServletRequest request, HttpServletResponse response) {
        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute("currUser");
        int flag = loginBo.logout(user);
        if (flag > 0) {
            try{
                Objects.requireNonNull(Constants.getSession()).removeAttribute("currUser");

            }catch (NullPointerException e){

            }
        }
        //SecurityUtils.getSubject().logout();
        return "login";
    }


}
