package com.samhk.ynashk.controller.register_paf;


import com.google.gson.Gson;
import com.samhk.ynashk.mapper.FrameworkPafDocumentDao;
import com.samhk.ynashk.mapper.FrameworkVersionPafDao;
import com.samhk.ynashk.mapper.ProjectDao;
import com.samhk.ynashk.mapper.ProjectPafDao;
import com.samhk.ynashk.service.NewProjectPafBo;
import com.samhk.ynashk.service.impl.management.develop_management.NewFramworkPafImpl;
import com.samhk.ynashk.service.impl.register_paf.NewProjectPafImpl;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class NewProjectPafAction {

    @Resource
    private NewProjectPafBo newProjectPafBo;
    @Resource
    private NewFramworkPafImpl newFramworkPafImpl;
    @Resource
    private NewProjectPafImpl newProjectPafImpl;
    @Resource
    private ProjectPafDao projectPafDao;
    @Resource
    private FrameworkVersionPafDao frameworkVersionPafDao;
    @Resource
    private ProjectDao projectDao;
    @Resource
    private FrameworkPafDocumentDao frameworkPafDocumentDao;

    /**
     *
     * 进入创建project_paf页面
     * @return
     */
    @RequestMapping("newProjectPAF.do")
    public ModelAndView goNewPaf() {
        ModelAndView mav = new ModelAndView();
        Gson gson = new Gson();
        List bankList = new ArrayList();
        List<ProjectVo> projectVos = projectDao.findAllProject();
        FrameworkVersionPafVO list=newFramworkPafImpl.goNewFRAPaf();
        List<FrameworkVersionPafVO> allPaf = frameworkVersionPafDao.getAllFRAPaf();
        for(FrameworkVersionPafVO vo : allPaf){
            vo.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
        }
        mav.addObject("pafItem",list);
        mav.addObject("allProject",gson.toJson(projectVos));
        mav.addObject("pafList",gson.toJson(allPaf));
        mav.addObject("document",new ArrayList());
        mav.addObject("pafDocument",bankList);
        mav.addObject("pageType","1");
        mav.setViewName("register_paf/newProjectPAF");
        return mav;
    }

    /**
     * 进入project_paf详情页面
     * @param
     * @param
     * @return
     */
    @RequestMapping(value = "newProjectPAF.do", params = {"action=viewFRAPAF"})
    public ModelAndView viewFRAPAF(FrameworkVersionPafVO frameworkVersionPafVO) {
        ModelAndView mv = new ModelAndView();
        Gson gson = new Gson();
        List bankList = new ArrayList();
        List<ProjectVo> projectVos = projectDao.findAllProject();
        FrameworkVersionPafVO list = newFramworkPafImpl.viewFRAPAF(frameworkVersionPafVO);
        List<FrameworkVersionPafVO> allPaf = frameworkVersionPafDao.getAllFRAPaf();
        for(FrameworkVersionPafVO vo : allPaf){
            vo.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
        }
        mv.addObject("pafItem",list);
        mv.addObject("pafList",gson.toJson(allPaf));
        mv.addObject("allProject",gson.toJson(projectVos));
        mv.addObject("document",gson.toJson(list.getFileList()));
        mv.addObject("pafDocument",bankList);
        mv.addObject("pageType","2");
        mv.setViewName("register_paf/newProjectPAF");
        return mv;
    }

    /**
     * 创建跟更新project_paf 由这里进入
     * @param request
     * @return
     */
    @RequestMapping(value = "newProjectPAF.do", params = {"action=saveNewPafProject"})
    @ResponseBody
    public Object saveNewPafItem(HttpServletRequest request, FrameworkVersionPafVO fpvo,ProjectPafVo ppvo) {
        SystemUserVo user = (SystemUserVo) request.getSession().getAttribute(Constants.LOGUSER);
        ProjectPafVo projectPafVo = new ProjectPafVo();
        projectPafVo.setProjectId(ppvo.getProjectId());
        projectPafVo.setPafId(fpvo.getPafId());
        projectPafVo.setRemarkId(ppvo.getRemarkId());
        projectPafVo.setStatus(fpvo.getStatus());
        projectPafVo.setCru(fpvo.getCru());
        projectPafVo.setCrd(new Date());
        projectPafVo.setLuu(user.getUserCode());
        projectPafVo.setLud(new Date());
        //保存数据至paf_Project表
        Boolean flag = false;
        List<ProjectPafVo> currentPaf = projectPafDao.selectByProjectAndPaf(ppvo);
        if(currentPaf.size()>0){
            flag = projectPafDao.updateProjectPaf(projectPafVo);
        }else{
            flag = newProjectPafBo.saveNewProjectPaf(projectPafVo);
        }
        //保存上傳的Project Paf
        if(flag){
            return newProjectPafImpl.insertProjectPafDoc(fpvo,projectPafVo);
        }
        return ResultVO.getFailed(Constants.getText("newProjectPaf.saveFailed"));
    }

    /**
     * 下载ProjectPafDocument文件
     * @param request
     * @param response
     * @param vo
     * @return
     */
    @GetMapping(value = "newProjectPAF.do", params = {"action=downloadProjectPafDocFile"})
    public void downloadAttachFile(HttpServletRequest request, HttpServletResponse response, ProjectPafDocumentVo vo) {
        newProjectPafImpl.downloadProjectPafDocFile(response,request,vo);
    }

}

