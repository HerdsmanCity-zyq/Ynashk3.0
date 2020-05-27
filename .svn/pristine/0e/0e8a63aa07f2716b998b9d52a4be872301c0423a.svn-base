package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.PafAssignVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PafAssignDao {

    /**
     * 查询所有数据(只有状态为 已分派 和 已确认 )
     * @return
     */
    List<PafAssignVo> selectAllPafAssign();

    /**
     * 通过主键查找数据
     * @param pafAssignVo
     * @return
     */
    PafAssignVo selectPafAssignByKey(PafAssignVo pafAssignVo);

    /**
     * 通過主鍵查詢PafAssignVo
     * @param frameworkId
     * @param versionsId
     * @param pafId
     * @return
     */
    PafAssignVo selectPafAssign(@Param("frameworkId") String frameworkId, @Param("versionsId") int versionsId, @Param("pafId") String pafId);

    /**
     * 更新数据
     * @param pafAssignVo
     * @return
     */
    Integer updatePafAssign(PafAssignVo pafAssignVo);


    /**
     * 添加数据
     * @param pafAssignVo
     * @return
     */
    int insertPafAssign(PafAssignVo pafAssignVo);


}
