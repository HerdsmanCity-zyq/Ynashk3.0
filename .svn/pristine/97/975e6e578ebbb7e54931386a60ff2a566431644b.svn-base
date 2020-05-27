package com.samhk.ynashk.service;

import com.samhk.ynashk.vo.PersonVo;
import com.samhk.ynashk.vo.StaffVo;
import com.samhk.ynashk.vo.SystemUserVo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface NewStaffBo {
    /**
     * 新增员工
     *
     * @param staffVo
     */
    Map newStaff(StaffVo staffVo) throws SQLException;

    List<Map<String, Object>> getDepartmentAndPosition();

    List<StaffVo> searchStaff(StaffVo staffVo);

    StaffVo getStaffByCode(String staffCode);

    /**
     * 新增人物資料
     *
     * @param personVo
     */
    Map newStaffPerson(PersonVo personVo);

}
