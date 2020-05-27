package com.samhk.ynashk.service;


import com.samhk.ynashk.controller.LoginAction;
import com.samhk.ynashk.vo.SystemUserVo;

import java.util.Map;

public interface LoginBo {

    LoginAction.LoginFlag login(SystemUserVo vo) throws Exception;

    String userInterceptorCheck();

    int logout(SystemUserVo systemUserVo);

    Map<String, Object> getPrivileges(SystemUserVo systemUserVo);
}
