package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.ProjectVo;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface ProjectDao {

    /**
     * 根据客户id查找客户项目
     * @return
     */
    List<ProjectVo> findProjectByCustomer(String customerId);


    List<ProjectVo> findProjectWithoutVisio();

    List<ProjectVo> findAllProject();

    ProjectVo findByProjectId(Integer projectId);

    /**
     * 根据project_paf 表来获取对应paf的所有项目projectId的信息
     * @param pafId
     * @return
     */
    List<ProjectVo> selectProjectByPafId(String pafId);
}
