package com.samhk.ynashk.service;

import com.samhk.ynashk.vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface NewFrameworkPafBo {
    FrameworkVersionPafVO goNewFRAPaf();

    FrameworkVersionPafVO viewFRAPAF(FrameworkVersionPafVO frameworkVersionPafVO);

    Object uploadPafFile(FrameworkVersionPafVO frameworkVersionPafVO);

    Object insertnewFRAPAFItem(FrameworkVersionPafVO frameworkVersionPafVO);

    String downloadFile(HttpServletResponse response, HttpServletRequest request, FrameworkVersionPafVO vo);

    Object checkDownload(FrameworkVersionPafVO vo);

    String downloadDocFile(HttpServletResponse response, HttpServletRequest request, FrameworkPafDocumentVO vo);

    Object getMaxVersionByFraId(VersionsVo vo);

    Object inserNewVersion(VersionsVo vo);
}
