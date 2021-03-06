package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("loginDao")
public interface LoginDao {

	 SystemUserVo login(SystemUserVo vo);

	 SystemUserVo checkUserIsExist(SystemUserVo vo);
	
	 SystemUserVo checkExistUser(SystemUserVo vo);

	 void setUserFailedCount(SystemUserVo vo);

	 void deleteLoginTicket(SystemUserVo vo);

	 void insertLoginTicket(SystemUserVo vo);
	
	 SystemUserVo getPrivileges(SystemUserVo vo);
	
	 SystemUserVo userInterceptorCheck(SystemUserVo vo);
	
	 int logout(SystemUserVo systemUserVo);
	
	 int updateLoginTicket(SystemUserVo vo);

	 /**
	 * 查找paf所有的開發人員名字
	 * @return
	 */
	List<String> findAllDeveloper();
}
