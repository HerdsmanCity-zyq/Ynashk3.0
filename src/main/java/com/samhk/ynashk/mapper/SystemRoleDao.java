package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.SeqNoVo;
import com.samhk.ynashk.vo.SystemRoleProcessVo;
import com.samhk.ynashk.vo.SystemUserRoleVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("systemRoleDao")
public interface SystemRoleDao {
    public List<String> getSeqNo(SeqNoVo wvo);
    public List<SystemUserRoleVo> getAllUserRoleList(SystemUserRoleVo systemUserRoleVo);
    public void newRole(SystemUserRoleVo systemUserRoleVo);
    public void updateRole(SystemUserRoleVo systemUserRoleVo);

    public SystemUserRoleVo getOneRole(String code);

    public void delRole(String code);
    public void delRolePrivilege(String code);

    public void addRoleProcess(@Param("roleCode") String roleCode, @Param("processCode") String processCode);

    public void delRoleProcess(String roleCode);

    public List<SystemRoleProcessVo> getRoleProcess(String roleCode);
}
