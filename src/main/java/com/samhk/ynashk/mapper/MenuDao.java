package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.FunctionControlVo;
import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("menuDao")
public interface MenuDao {

	 List<MenuVo> getMenu(SystemUserVo svo);
	
	 List<MenuVo> selectSecondMenu();
	
	 List<MenuVo> selectThreeMenu(String menuCode);
	
	 List<FunctionControlVo> getFunctionControlByMenuCode(String menuCode);
	
	 List<MenuVo> selectSonMenu(MenuVo vo);
}
