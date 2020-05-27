package com.samhk.ynashk.shiro.realm;

import com.samhk.ynashk.vo.SystemUserVo;
import org.apache.shiro.authc.UsernamePasswordToken;

import java.io.Serializable;

public class MyAuthToken extends UsernamePasswordToken implements Serializable {


    private SystemUserVo userVo;



    public MyAuthToken(final String userName, final char[] password,SystemUserVo userVo) {
        // TODO Auto-generated constructor stub
        super(userName, password);

        this.userVo = userVo;
    }




    public SystemUserVo getUserVo() {
        return userVo;
    }

    public void setUserVo(SystemUserVo userVo) {
        this.userVo = userVo;
    }
}
