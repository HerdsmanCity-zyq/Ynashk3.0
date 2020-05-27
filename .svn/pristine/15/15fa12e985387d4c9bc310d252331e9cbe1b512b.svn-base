package com.samhk.ynashk.controller.register_paf;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.samhk.ynashk.service.impl.register_paf.SearchPAFEditionListImpl;
import com.samhk.ynashk.vo.SearchPAFEditionListVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/")
public class SearchPAFEditionListAction {

    @Resource
    private SearchPAFEditionListImpl searchPAFEditionListImpl;

    @RequestMapping("searchPAFEditionList.do")
    public String goNewPaf(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "20") int pageSize, HttpServletRequest request) {
        PageHelper.startPage(pageNo,pageSize);
        PageInfo<SearchPAFEditionListVo> pageInfo = new PageInfo<>(searchPAFEditionListImpl.searchPAFEditionList());
        request.setAttribute("PAFEditionList",pageInfo);
        request.setAttribute("pageSize",pageSize);
        request.setAttribute("total",pageInfo.getTotal());
        request.setAttribute("pageNo",pageNo);
        return "register_paf/searchPAFEditionList";
    }
}
