package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.SeqNoVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("sysUserDao")
public interface SysUserDao {

	public List<SystemUserVo> getAllUserList(SystemUserVo systemUserVo);
	public void insertSysUser(SystemUserVo systemUserVo) throws Exception;
	public SystemUserVo searchUser(SystemUserVo systemUserVo);
	public void changeSysUserPwd(SystemUserVo systemUserVo) throws Exception;
	public void updateSysUser(SystemUserVo systemUserVo);
	public List<String> getAllUserCode(SeqNoVo seqIDVo);
	@Select({"SELECT CONCAT('UI',lpad(count(*)+1,5,0)) FROM sys_user"})
	public String getCountCode();
    public void updateUserStatus(SystemUserVo systemUserVo);
    public int getStaffCodeCount(SystemUserVo systemUserVo);
    public List<SystemUserVo> getuserBygroupCode(SystemUserVo systemUserVo);
    @Select("select * from sys_user where LOCATE(lower(#{id}),lower(user_id))>0 limit 1")
    SystemUserVo chekUserID(@Param("id") String ID);
	@Select("select * from sys_user where staff_code = #{staffCode}  limit 1")
    SystemUserVo chekUser(@Param("staffCode") String staffCode);
}
