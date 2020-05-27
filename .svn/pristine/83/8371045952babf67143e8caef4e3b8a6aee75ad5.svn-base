package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.StaffDepartmentVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("staffDepartmentDao")
public interface StaffDepartmentDao {
    public List<StaffDepartmentVo> getAllStaffDepartment();
    @Select("select department_chi_name from staff_department where department_id = #{departmentId}")
    public String getStaffDepartment(@Param("departmentId") String departmentId);
}
