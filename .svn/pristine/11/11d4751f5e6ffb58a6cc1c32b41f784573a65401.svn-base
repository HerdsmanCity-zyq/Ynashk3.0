package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.FunctionPrivilegeVo;
import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.SystemUserRoleVo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("functionPrivilegeDao")
public interface FunctionPrivilegeDao {

     public List<MenuVo> getRoleFunctionPrivilege(SystemUserRoleVo vo);
     public void addFunctionPrivilegeVoList(FunctionPrivilegeVo functionPrivilegeVo);
     public void deleteFunctionPrivilegeVoList(String roleCode);
     Map<String,Object> getFunctionPrivilegeByCode(Map<String, Object> map);
}
