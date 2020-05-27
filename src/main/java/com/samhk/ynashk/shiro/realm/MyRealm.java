package com.samhk.ynashk.shiro.realm;

import com.samhk.ynashk.controller.LoginAction;
import com.samhk.ynashk.service.LoginBo;
import com.samhk.ynashk.shiro.RoleNotStartException;
import com.samhk.ynashk.shiro.RoleStopException;
import com.samhk.ynashk.shiro.UserStopException;
import com.samhk.ynashk.vo.SystemUserVo;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

public class MyRealm extends AuthorizingRealm {
    private static final Logger log = LoggerFactory.getLogger(MyRealm.class);

    @Autowired
    @Lazy
    private LoginBo loginBo;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        log.info("授权");
        SystemUserVo vo = (SystemUserVo) principals.getPrimaryPrincipal();
        SimpleAuthorizationInfo authorizationInfo = null;
        try {
            authorizationInfo = new SimpleAuthorizationInfo();
            Map<String,Object> map = loginBo.getPrivileges(vo);
            if (map.get("role") != null){
                authorizationInfo.addRole((String)map.get("role"));

            }
            List<String> list = (List<String>) map.get("funcs") ;
            for(String p:list){
                authorizationInfo.addStringPermission(p);
            }
        } catch (Exception e) {
            log.error("授权错误{}", e.getMessage());
            e.printStackTrace();
        }
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        log.info("登录认证");
        //继承UserNamePasswordToken重写多几个参数
        MyAuthToken myToken = (MyAuthToken) token;

        SystemUserVo userVo = myToken.getUserVo();

        LoginAction.LoginFlag loginFlag = null;

        //密码验证规则
        try {
            loginFlag = loginBo.login(userVo);
        } catch (Exception e) {
            e.printStackTrace();
        }


        switch (loginFlag) {
            //禁用的账号
            case    IS_INACTIVE:  throw new DisabledAccountException();
            case PASSWORD_ERROR:  throw new IncorrectCredentialsException();
            case		IS_LOCK:  throw new LockedAccountException();
            case 	IS_NOTEXIST:  throw new UnknownAccountException();
            case 	UNEFFECTIVE:  throw new AccountException();
            case ROLESTOP:
                throw new RoleStopException();
            case ROLENOTSTART:
                throw new RoleNotStartException();
            case USER_STOP:
                throw new UserStopException();
            default:
        }





        //交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以在此判断或自定义实现
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                userVo, //将用户对象传递到授权
                userVo.getLoginPsw(), //密码
                getName()  //realm name
        );

        return authenticationInfo;
    }

    @Override
    public boolean supports(AuthenticationToken token){
        return  (token instanceof MyAuthToken || token instanceof UsernamePasswordToken);
    }
}
