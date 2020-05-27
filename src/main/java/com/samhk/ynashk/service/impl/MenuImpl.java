package com.samhk.ynashk.service.impl;


import com.samhk.ynashk.mapper.MenuDao;
import com.samhk.ynashk.service.MenuBo;
import com.samhk.ynashk.vo.FunctionControlVo;
import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("menuImpl")
public class MenuImpl implements MenuBo {

    @Resource(name = "menuDao")
    public MenuDao menuDao;

    @Override
    public List<MenuVo> getMenu(SystemUserVo svo) {
        List<MenuVo> list = menuDao.getMenu(svo);
        return list;
    }

    @Override
    public List<FunctionControlVo> getFunctionControlByMenuCode(String menuCode) {
        List<FunctionControlVo> list = menuDao.getFunctionControlByMenuCode(menuCode);
        return list;
    }

}
