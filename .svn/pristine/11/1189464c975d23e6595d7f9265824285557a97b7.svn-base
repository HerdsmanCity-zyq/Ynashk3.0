package com.samhk.ynashk.controller.register_paf;

import com.samhk.ynashk.service.impl.register_paf.SearchProjectPafImpl;
import com.samhk.ynashk.vo.FrameworkProjectPafVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class SearchProjectPAFListAction {

    @Resource(name = "SearchProjectPafImpl")
    SearchProjectPafImpl searchProjectPafImpl;

    @RequestMapping("searchProjectPAFList.do")
    @ResponseBody
    public ModelAndView goSearchFRAPaf(HttpServletRequest request) {
        ModelAndView mv=new ModelAndView();
        List<FrameworkProjectPafVo> list = searchProjectPafImpl.getAllProjectPaf();
        mv.addObject("pafItemList",list);
        mv.setViewName("register_paf/searchProjectPAFList");
        return mv;
    }
}
