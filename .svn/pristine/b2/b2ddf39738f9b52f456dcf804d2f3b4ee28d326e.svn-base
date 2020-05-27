package com.samhk.ynashk.controller.management.develop_management;

import com.google.gson.Gson;
import com.samhk.ynashk.service.NewFrameworkPafBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/")
public class NewFRAPAFAction {

    private static Logger log = LoggerFactory.getLogger(NewFRAPAFAction.class);

    @Resource(name="NewFramworkPafImpl")
    NewFrameworkPafBo newFramworkPafImpl;

    @RequestMapping(value = "newFRAPAF.do")
    @ResponseBody
    public ModelAndView goNewFRAPaf() {
        Gson gson = new Gson();
        ModelAndView mv=new ModelAndView();
        FrameworkVersionPafVO list=newFramworkPafImpl.goNewFRAPaf();
        mv.addObject("pafItem",list);
        mv.addObject("document",gson.toJson(null));
        mv.addObject("pageType","1");
        mv.setViewName("management/develop_management/newFrameworkPAF");
        return mv;
    }

    @RequestMapping(value = "newFRAPAF.do",params = {"action=viewFRAPAF"})
    @ResponseBody
    public ModelAndView viewFRAPAF(FrameworkVersionPafVO frameworkVersionPafVO) {
        Gson gson = new Gson();
        ModelAndView mv=new ModelAndView();
        FrameworkVersionPafVO list=newFramworkPafImpl.viewFRAPAF(frameworkVersionPafVO);
        mv.addObject("pafItem",list);
        mv.addObject("document",gson.toJson(list.getFileList()));
        mv.addObject("pageType","2");
        mv.setViewName("management/develop_management/newFrameworkPAF");
        return mv;
    }
    @RequestMapping(value = "newFRAPAF.do",params = {"action=saveNewFRAPafItem"})
    @ResponseBody
    public Object saveNewFRAPafItem(FrameworkVersionPafVO vo,HttpServletRequest request){
        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute(Constants.LOGUSER);
        Gson gson = new Gson();
        log.info(gson.toJson(vo));
        vo.setData4Value(user.getUserCode());
        return newFramworkPafImpl.insertnewFRAPAFItem(vo);
    }

    @RequestMapping(value = "newFRAPAF.do",params = {"action=uploadFRAPafVsb"})
    @ResponseBody
    public Object uploadFRAPafVsb(FrameworkVersionPafVO vo,HttpServletRequest request){

        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute(Constants.LOGUSER);
        Gson gson = new Gson();
        log.info(gson.toJson(vo));

        if (vo.getVisioFile() == null) {
            return ResultVO.getFailed("請選擇文件");
        }
        String last = vo.getVisioFile().getOriginalFilename().substring(vo.getVisioFile().getOriginalFilename().lastIndexOf(".")+1);
        if (!(last.toLowerCase().equals("vsdx") || last.toLowerCase().equals("vsd"))){
            return ResultVO.getFailed("請上傳vsd文件");

        }

        vo.setData4Value(user.getUserCode());
        return newFramworkPafImpl.uploadPafFile(vo);
    }
    /**
     * 下载pafvsd
     * @param request
     * @param response
     * @param vo
     * @return
     */
    @GetMapping(value = "newFRAPAF.do", params = {"action=downloadVisioFile"})
    public void downloadVisioFile(HttpServletRequest request, HttpServletResponse response,FrameworkVersionPafVO vo){
        newFramworkPafImpl.downloadFile(response,request,vo);
    }

    @RequestMapping(value = "newFRAPAF.do", params = {"action=checkDownload"})
    @ResponseBody
    public Object checkVisioDownload(FrameworkVersionPafVO vo) {
        return newFramworkPafImpl.checkDownload(vo);
    }

    /**
     * 下载document文件
     * @param request
     * @param response
     * @param vo
     * @return
     */
    @GetMapping(value = "newFRAPAF.do", params = {"action=downloadDocFile"})
    public String downloadAttachFile(HttpServletRequest request, HttpServletResponse response,FrameworkPafDocumentVO vo) {

        newFramworkPafImpl.downloadDocFile(response,request,vo);
        return null;
    }

    @RequestMapping(value = "newFRAPAF.do", params = {"action=getMaxVersionByFraId"})
    @ResponseBody
    public Object getMaxVersionByFraId(VersionsVo vo){
        return newFramworkPafImpl.getMaxVersionByFraId(vo);
    }

    @RequestMapping(value = "newFRAPAF.do", params = {"action=inserNewVersion"})
    @ResponseBody
    public Object inserNewVersion(VersionsVo vo,HttpServletRequest request){

        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute(Constants.LOGUSER);
        vo.setData4Value(user.getUserCode());
        return newFramworkPafImpl.inserNewVersion(vo);
    }

}
