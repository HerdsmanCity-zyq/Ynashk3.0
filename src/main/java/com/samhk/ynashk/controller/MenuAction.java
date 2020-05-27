package com.samhk.ynashk.controller;

import com.google.gson.Gson;
import com.samhk.ynashk.service.MenuBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.MenuVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.RequestContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Controller
@RequestMapping("/")
public class MenuAction {

    @Resource(name = "menuImpl")
    public MenuBo menuBo;

    @RequestMapping("getMenu.do")
    public String getMenu(HttpServletRequest request, HttpServletResponse response) {
        Constants.setObject(Constants.REQUESTCONTEXT, new RequestContext(request));
        //獲取登陸的用戶
        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute("currUser");
        //返回的是所有一級二級三級的menu數據
        List<MenuVo> resultList = menuBo.getMenu(user);
        List<MenuVo> oneList = new ArrayList<>();

        Map<MenuVo, Map<MenuVo, Map<MenuVo, List<MenuVo>>>> firstMenu = new TreeMap<>();
        for (MenuVo pvo : resultList) {
            if (pvo.getParentMenuCode() == null || "".equals(pvo.getParentMenuCode())) {
                oneList.add(pvo);
                //1 map
                Map<MenuVo, Map<MenuVo, List<MenuVo>>> secondMenu = new TreeMap<>();
                for (MenuVo cvo : resultList) {
                    if (cvo.getParentMenuCode() != null && !cvo.getParentMenuCode().equals("") && cvo.getParentMenuCode().equals(pvo.getMenuCode())) {
                        //2 list
                        Map<MenuVo, List<MenuVo>> threeMenu = new TreeMap<>();
                        for (MenuVo tvo : resultList) {
                            if (tvo.getParentMenuCode() != null && !tvo.getParentMenuCode().equals("") && tvo.getParentMenuCode().equals(cvo.getMenuCode())) {
                                List<MenuVo> list = new ArrayList<>();
                                //判断是否存在子菜单
                                if (tvo.getObjectName() == null || tvo.getObjectName().equals("")) {
                                    for (MenuVo fvo : resultList) {
                                        if (fvo.getParentMenuCode() != null && !fvo.getParentMenuCode().equals("") && fvo.getParentMenuCode().equals(tvo.getMenuCode())) {
                                            list.add(fvo);
                                        }
                                    }
                                } else {
                                    list.add(tvo);
                                }
                                threeMenu.put(tvo, list);
                            }
                        }
                        secondMenu.put(cvo, threeMenu);
                    }
                }
                firstMenu.put(pvo, secondMenu);
            }
        }

        Gson test = new Gson();
        String str = test.toJson(firstMenu);
        // 使用Gson将对象类转成Json对象时出现\u003d时，替换为=号
        str = str.replaceAll("\u003d", "=");
        //System.out.println(str);
        // 一級menu集合
        request.getSession().setAttribute("oneList", oneList);
        // 所有菜單集合
        request.getSession().setAttribute("resultMenu", str);
        return "success";
    }


}
