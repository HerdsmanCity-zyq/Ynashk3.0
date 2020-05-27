package com.samhk.ynashk.service;

import com.samhk.ynashk.vo.SystemUserRoleVo;

import java.util.List;

public interface SystemRoleBo {
    String jsonTree(SystemUserRoleVo vo);

    String SaveNewRole(String jsonTree);

    SystemUserRoleVo getOneRole(String code);

    List<SystemUserRoleVo> getAllUserRoleList(SystemUserRoleVo systemUserRoleVo);

}
