package com.samhk.ynashk.controller.register_paf;

import com.google.gson.Gson;
import com.samhk.ynashk.service.NewOnePafEditionBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.PafVisioVersionVo;
import com.samhk.ynashk.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @author youquan zhong
 * @date 2020/1/3 9:47
 */

@Slf4j
@Controller
@RequestMapping("/")
public class SearchOnePafEditionAction {

    @Resource
    private NewOnePafEditionBo newOnePafEditionBo;

    @RequestMapping(value = "searchOnePAFEdition.do")
    public ModelAndView goSearchOnePafEdition(PafVisioVersionVo vo,String visioVersion){
        ModelAndView mav = new ModelAndView();
        Gson gson = new Gson();
        //查询这条数据，进行数据回显
        PafVisioVersionVo pvo = newOnePafEditionBo.queryPafVisioVersionIsExist(vo.getProjectId(),vo.getPafId(),visioVersion);
        mav.addObject("fvp",pvo);
        //检视
        mav.addObject("pageType","2");
        mav.addObject("pfList",gson.toJson(newOnePafEditionBo.getAllFramework()));

        mav.setViewName("register_paf/newOnePafEdition");
        return mav;
    }

    @RequestMapping(value = "searchOnePAFEdition.do",params = {"action=deleteOnePAFEdition"})
    @ResponseBody
    public Object deleteOnePAFEdition(PafVisioVersionVo vo){
        //当页面数据（三个主键修改了其中一个时），会删除失败
        Boolean  boo = newOnePafEditionBo.deleteOnePAFEdition(vo.getProjectId(),vo.getPafId(),vo.getPafVisioVersion());
        if (boo){
            return ResultVO.getSuccess(Constants.getText("paf.searchOnePafEdition.01"));

        }else {
            return ResultVO.getFailed(Constants.getText("paf.searchOnePafEdition.02"));
        }
    }


}
