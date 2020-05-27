package com.samhk.ynashk.service;


import com.samhk.ynashk.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface NewProjectPafBo {

    /**
     * 新增project_paf
     * @param projectPafVo
     * @return
     */
    Boolean saveNewProjectPaf(ProjectPafVo projectPafVo);

    Object insertProjectPafDoc(FrameworkVersionPafVO frameworkVersionPafVO ,ProjectPafVo projectPafVo);

    void downloadProjectPafDocFile(HttpServletResponse response,HttpServletRequest request, ProjectPafDocumentVo vo);

    Object deleteProjectPaf(ProjectPafVo vo);
}
