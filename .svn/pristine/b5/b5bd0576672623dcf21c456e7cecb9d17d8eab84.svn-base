package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.FrameworkPafDocumentVO;
import com.samhk.ynashk.vo.FrameworkVersionPafVO;
import com.samhk.ynashk.vo.ProjectPafDocumentVo;
import com.samhk.ynashk.vo.ProjectPafVo;

import java.util.List;

public interface ProjectPafDocumentDao {

    public List<ProjectPafDocumentVo> findDocByPafIdAndProjectId(ProjectPafVo projectPafVo);
    public List<ProjectPafDocumentVo> findPafDocByPafId(String pafId);
    public ProjectPafDocumentVo checkPafDocUnique(ProjectPafDocumentVo vo);
    public Integer insertNewPafDocItem(ProjectPafDocumentVo vo);
    public Integer updatePafDocItem(ProjectPafDocumentVo vo);

}
