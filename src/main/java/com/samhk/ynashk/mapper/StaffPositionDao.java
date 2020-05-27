package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.StaffPositionVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("staffPositionDao")
public interface StaffPositionDao {
    public List<StaffPositionVo> getStaffPositionWithDepartment(String departmentId);
    @Select("select position_chi_name from staff_position where position_id = #{positionId}")
    public String getStaffPosition(@Param("positionId") String positionId);
}
