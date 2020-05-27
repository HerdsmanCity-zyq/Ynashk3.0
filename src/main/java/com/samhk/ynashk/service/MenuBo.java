package com.samhk.ynashk.service;


import com.samhk.ynashk.vo.FunctionControlVo;
import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.SystemUserVo;

import java.util.List;

public interface MenuBo {

    List<MenuVo> getMenu(SystemUserVo svo);

    List<FunctionControlVo> getFunctionControlByMenuCode(String menuCode);
}
