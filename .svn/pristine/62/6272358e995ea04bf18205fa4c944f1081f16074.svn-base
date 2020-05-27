package com.samhk.ynashk.controller.management.develop_management;

import com.samhk.ynashk.mapper.PafRemarksDao;
import com.samhk.ynashk.service.SearchFrameworkPafBo;
import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import com.samhk.ynashk.vo.PafRemarksVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/")
public class SearchFRAPAFAction {

    @Resource(name = "SearchFramworkPafImpl")
    SearchFrameworkPafBo searchFramworkPafImpl;

    @RequestMapping("searchFRAPAF.do")
    @ResponseBody
    public ModelAndView goSearchFRAPaf(HttpServletRequest request) {
        ModelAndView mv=new ModelAndView();

        List<FrameworkVersionPafVO> list=searchFramworkPafImpl.getAllFRAPaf();
        mv.addObject("pafItemList",list);
        mv.setViewName("management/develop_management/searchFrameworkPAF");
        return mv;
    }
}
