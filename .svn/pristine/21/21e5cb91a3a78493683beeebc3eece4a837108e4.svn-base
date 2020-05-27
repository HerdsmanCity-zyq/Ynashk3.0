package com.samhk.ynashk.mapper;


import com.samhk.ynashk.vo.TaskVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface TaskDao {

    /**
     * 查询所有的任务负责人
     * @return
     */
    List<TaskVo> selectOwnerName();

    /**
     * 根據客戶和項目獲取任務
     * @param
     * @return
     */
    List<TaskVo> findByCustomerIdAndProjectId(@Param("customerId")String customerId,@Param("projectId")Integer projectId);

}
