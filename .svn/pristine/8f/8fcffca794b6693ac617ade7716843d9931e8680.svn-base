package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.ProjectPafVo;
import com.samhk.ynashk.vo.ProjectVo;

import java.util.List;

public interface ProjectPafDao {

    /**
     * 插入新project_paf
     * @param projectPafVo
     * @return
     */
    int insertProjectPaf(ProjectPafVo projectPafVo);

    /**
     * 更新project_paf
     * @param projectPafVo
     * @return
     */
    Boolean updateProjectPaf(ProjectPafVo projectPafVo);

    /**
     * project_paf表數據根據projectId 和PafId
     * @param projectPafVo
     * @return
     */
    List<ProjectPafVo> selectByProjectAndPaf(ProjectPafVo projectPafVo);

    /**
     * 獲取所有的ProjectPaf 的數據
     * @return
     */
    List<ProjectPafVo> getProjectPaf();

    ProjectPafVo findByPafAndProject(String pafId,String projectId);

    /**
     * 刪除Project_Paf
     * @param projectPafVo
     * @return
     */
    Boolean deleteProjectPaf(ProjectPafVo projectPafVo);

}
