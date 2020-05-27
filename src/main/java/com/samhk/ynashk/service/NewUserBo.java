package com.samhk.ynashk.service;


import com.samhk.ynashk.vo.SystemUserVo;

import java.util.List;
import java.util.Map;

public interface NewUserBo {

    List<SystemUserVo> searchUserList(SystemUserVo systemUserVo);

    Map<String, Object> save(SystemUserVo systemUserVo, String chgPwd) throws Exception;

    SystemUserVo searchUser(SystemUserVo systemUserVo);

    String getAutoCode();

    /**
     * 检查用戶賬號重复
     *
     * @param ID
     * @return
     */
    String checkUserID(String ID);

    /**
     * 检查员工编号是否创建有用户
     */
    String checkUser(String staffCode);


}
