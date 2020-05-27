package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SelectDownDao {

    /**
     * 获取所有客户数据
     * @return
     */
    List<CustomerVo> getAllCustomer();

    /**
     * 獲取所有設計師資料
     * @return
     */
    List<SystemUserVo> getAllSA();

    /**
     * 获取所有项目
     * @return
     */
    List<ProjectVo> getAllProject();

    public List<StaffPositionVo> getStaffPosition();

    List<StaffDepartmentVo> getStaffDepartment();

    List<PersonVo> getPersonCode();


    public List<SystemUserRoleVo> GetAllRoleCode();

    List<SystemUserVo> getStaffCode();

    List<ProjectPafVo> getProjectPafAll();

}
