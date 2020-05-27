package com.samhk.ynashk.controller.paf_code;


import com.samhk.ynashk.service.SearchPafAssignBo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/")
public class SearchPafAssignAction {

    @Resource
    SearchPafAssignBo searchPafAssign;

    @RequestMapping("searchPAFAssign.do")
    @ResponseBody
    public ModelAndView getAllPafAssign(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.addObject("pafAssignList", searchPafAssign.selectAllPafAssign());
        mv.setViewName("paf_code/searchPAFassign");
        return mv;
    }
}
