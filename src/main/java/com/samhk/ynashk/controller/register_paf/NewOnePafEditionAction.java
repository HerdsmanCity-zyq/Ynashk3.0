package com.samhk.ynashk.controller.register_paf;

import com.google.gson.Gson;
import com.samhk.ynashk.mapper.FrameworkVersionPafDao;
import com.samhk.ynashk.service.NewOnePafEditionBo;
import com.samhk.ynashk.service.SearchFrameworkPafBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import com.samhk.ynashk.vo.PafVisioVersionVo;
import com.samhk.ynashk.vo.ResultVO;
import com.samhk.ynashk.vo.SystemUserVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author youquan zhong
 * @date 2019/12/25 17:54
 */
@Slf4j
@Controller
@RequestMapping("/")
public class NewOnePafEditionAction {

    @Resource
    private NewOnePafEditionBo newOnePafEditionBo;


    @RequestMapping(value = "newOnePAFEdition.do")
    public ModelAndView goNewOnePafEdition(PafVisioVersionVo vo,String pafId,FrameworkVersionPafVO fvpVO){
        ModelAndView mav = new ModelAndView();
        Gson gson = new Gson();
        if (!StringUtils.isEmpty(pafId)){
            //pafId不为空的话，是从检视项目_ PAF_列表跳转
            FrameworkVersionPafVO fvp = newOnePafEditionBo.findFVP(fvpVO.getProjectId(),fvpVO.getPafId(),fvpVO.getFrameworkId());
            mav.addObject("fvp",fvp);

        }
        mav.addObject("pfList",gson.toJson(newOnePafEditionBo.getAllFramework()));
        if (vo != null && vo.getPafId() != null && vo.getPafVisioVersion() != null && vo.getProjectId() != null){
            mav.addObject("lud",newOnePafEditionBo.getLUDByIds(vo));
        }
        //两种情况合并为新增
        mav.addObject("pageType","1");
        mav.setViewName("register_paf/newOnePafEdition");
        return mav;
    }


    @RequestMapping(value = "newOnePAFEdition.do",params = {"action=savePafVisioVersion"})
    @ResponseBody
    public Object savePafVisioVersion(PafVisioVersionVo pafVisioVersionVo) throws IOException {
        SystemUserVo user=(SystemUserVo) Constants.getSession().getAttribute("currUser");
        pafVisioVersionVo.setCru(user.getUserCode());
        pafVisioVersionVo.setLuu(user.getUserCode());
        return newOnePafEditionBo.insertPafVisioVersion(pafVisioVersionVo);
    }

    @RequestMapping(value = "newOnePAFEdition.do",params = {"action=uploadFRAPafVsb"})
    @ResponseBody
    public Object uploadFRAPafVsb(PafVisioVersionVo vo,HttpServletRequest request){
        Gson gson = new Gson();

        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute(Constants.LOGUSER);

        if (vo.getVisioFile() == null) {
            return ResultVO.getFailed(Constants.getText("paf.newOnePafEdition.07"));
        }
        String last = vo.getVisioFile().getOriginalFilename().substring(vo.getVisioFile().getOriginalFilename().lastIndexOf(".")+1);
        if (!(last.toLowerCase().equals("vsdx") || last.toLowerCase().equals("vsd"))){
            return ResultVO.getFailed(Constants.getText("paf.newOnePafEdition.08"));

        }

        vo.setData4Value(user.getUserCode());
        return newOnePafEditionBo.uploadPafFile(vo);
    }
    /**
     * 下载pafvsd
     * @param request
     * @param response
     * @param vo
     * @return
     */
    @GetMapping(value = "newOnePAFEdition.do", params = {"action=downloadVisioFile"})
    public void downloadVisioFile(HttpServletRequest request, HttpServletResponse response, PafVisioVersionVo vo){
        newOnePafEditionBo.downloadFile(response,request,vo);
    }

    @RequestMapping(value = "newOnePAFEdition.do", params = {"action=checkDownload"})
    @ResponseBody
    public Object checkVisioDownload(PafVisioVersionVo vo) {
        return newOnePafEditionBo.checkDownload(vo);
    }


    @RequestMapping(value = "newOnePAFEdition.do", params = {"action=getLatestVisioVersion"})
    @ResponseBody
    public Object getLatestVisioVersion(Integer projectId,String pafId) {
        return newOnePafEditionBo.getLatestVisioVersion(projectId,pafId);
    }


}
