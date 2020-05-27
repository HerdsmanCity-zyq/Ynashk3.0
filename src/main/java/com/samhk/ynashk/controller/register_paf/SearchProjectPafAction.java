package com.samhk.ynashk.controller.register_paf;


import com.google.gson.Gson;
import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.NewProjectPafBo;
import com.samhk.ynashk.service.impl.management.develop_management.NewFramworkPafImpl;
import com.samhk.ynashk.service.impl.register_paf.NewProjectPafImpl;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/")
public class SearchProjectPafAction {
    private static Logger log = LoggerFactory.getLogger(SearchProjectPafAction.class);

    public static final String SUCCESS = "success";

    @Resource
    private CustomerDao customerDao;
    @Resource
    private NewFramworkPafImpl newFramworkPafImpl;
    @Resource
    private ProjectDao projectDao;
    @Resource
    private NewProjectPafImpl newProjectPaf;
    @Resource
    private FrameworkProjectPafDao frameworkProjectPafDao;
    @Resource
    private FrameworkPafDocumentDao frameworkPafDocumentDao;
    @Resource
    private ProjectPafDocumentDao projectPafDocumentDao;


    /**
     * 检视项目PAF
     * @param frameworkVersionPafVO
     * @return
     */
    @RequestMapping(value = "searchProjectPAF.do", params = {"action=viewProjectPaf"})
    public ModelAndView viewProjectPaf(FrameworkVersionPafVO frameworkVersionPafVO, ProjectPafVo projectPafVo) {
        ModelAndView model = new ModelAndView();
        Gson gson = new Gson();
        FrameworkVersionPafVO list = newFramworkPafImpl.viewFRAPAF(frameworkVersionPafVO);
        //获取projectId
        list.setProjectId(projectPafVo.getProjectId());
        //和 客户Customer
        ProjectVo pvo = projectDao.findByProjectId(projectPafVo.getProjectId());
        CustomerVo customer = customerDao.findByCustomerId(pvo.getCustomerId());
        List<ProjectPafDocumentVo> projectPafDocumentVo = projectPafDocumentDao.findDocByPafIdAndProjectId(projectPafVo);
        List<ProjectVo> projectVos = projectDao.findAllProject();
        List<FrameworkProjectPafVo> allProjectPaf = frameworkProjectPafDao.getAllProjectPaf();
        //paf对应的项目
        for(FrameworkProjectPafVo vo : allProjectPaf){
            List<ProjectVo> projectVo = projectDao.selectProjectByPafId(vo.getPafId());
            vo.setProjectVos(projectVo);
            vo.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
        }
        model.addObject("pafItem",list);
        model.addObject("customer",customer);
        model.addObject("pafList",gson.toJson(allProjectPaf));
        model.addObject("allProject",gson.toJson(projectVos));
        model.addObject("document",gson.toJson(list.getFileList()));
        model.addObject("pafDocument",gson.toJson(projectPafDocumentVo));
        model.addObject("pageType","4");
        model.setViewName("register_paf/newProjectPAF");
        return model;
    }

    /**
     * 新建项目PAF
     * @return
     */
    @RequestMapping(value = "searchProjectPAF.do")
    public ModelAndView goNewProjectPaf() {
        ModelAndView model = new ModelAndView();
        List bankList = new ArrayList();
        Gson gson = new Gson();
        FrameworkVersionPafVO list=newFramworkPafImpl.goNewFRAPaf();
        List<ProjectVo> projectVos = projectDao.findAllProject();
        List<FrameworkProjectPafVo> allProjectPaf = frameworkProjectPafDao.getAllProjectPaf();
        //paf对应的项目
        for(FrameworkProjectPafVo vo : allProjectPaf){
            List<ProjectVo> projectVo = projectDao.selectProjectByPafId(vo.getPafId());
            vo.setProjectVos(projectVo);
            vo.setFileList(frameworkPafDocumentDao.findDocByPafId(vo.getPafId()));
        }
        model.addObject("document",bankList);
        model.addObject("pafItem",list);
        model.addObject("pafDocument",bankList);
        model.addObject("pafList",gson.toJson(allProjectPaf));
        model.addObject("allProject",gson.toJson(projectVos));
        model.addObject("pageType","3");
        model.setViewName("register_paf/newProjectPAF");
        return model;
    }


    @RequestMapping(value = "searchProjectPAF.do",params = {"action=deleteProjectPaf"})
    @ResponseBody
    public Object deleteProjectPaf(ProjectPafVo projectPafVo) {

         return newProjectPaf.deleteProjectPaf(projectPafVo);
    }

    @RequestMapping(value = "searchProjectPAF.do",params = {"action=searchProjectPafDoc"})
    @ResponseBody
    public Object getProjectPafDoc(ProjectPafVo projectPafVo){

        List<ProjectPafDocumentVo> docList = projectPafDocumentDao.findDocByPafIdAndProjectId(projectPafVo);
        projectPafVo.setFileList(docList);
        HashMap<String,Object> map = new HashMap();
        map.put("projectPafDocumentVo",projectPafVo);
        return map;
    }

}

