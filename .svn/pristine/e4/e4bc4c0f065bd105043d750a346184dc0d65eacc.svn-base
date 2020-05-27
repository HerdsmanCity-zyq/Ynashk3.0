package com.samhk.ynashk.controller.home_management.user_main;

import com.samhk.ynashk.service.NewUserBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/")
public class searchUserAction {
	
	@Resource(name="newUserImpl")
	NewUserBo newUserImpl;
	
	
	@RequestMapping("searchUser.do")
	public String execute(SystemUserVo systemUserVo) {
		List<SystemUserVo> voList=newUserImpl.searchUserList(systemUserVo);
		Constants.getRequest().setAttribute("searchUserList", voList);
		return "Home_Management/user_main/searchUser";
	}
		
}
