package com.samhk.ynashk.mapper;

import com.samhk.ynashk.vo.PersonVo;
import com.samhk.ynashk.vo.SeqNoVo;
import com.samhk.ynashk.vo.StaffVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("staffDao")
public interface StaffDao {
    /**
     * 新增员工
     * @param staffVo
     */
    public void newStaff(StaffVo staffVo);

    /**
     * 获取员工编号
     * @param vo
     * @return
     */
    public List<String> getStaff_code(SeqNoVo vo);
    /**
     * 获取人物编号
     * @param vo
     * @return
     */
     List<String> getPersonCode(SeqNoVo vo);
    /**
     * 员工信息最后更新保存时间
     * @param staffCode
     * @return
     */
    String getStaffLastUpdateDateByCode(String staffCode);

    List<StaffVo> searchStaff(StaffVo staffVo);

    public StaffVo getStaffByCode(String staffCode);

    PersonVo getPersonByCode(String personCode);

    public Integer updateStaff(StaffVo staffVo);

    /**
     * 新增人物資料
     * @param personVo
     */
    public void addStaffPerson(PersonVo personVo);

    /**
     * 查詢新增人物資料
     * @param personCode
     * @return
     */
    PersonVo findStaffPerson(String personCode);

    /**
     * 修改新增人物资料
     * @param personVo
     * @return
     */
    Integer updateStaffPerson(PersonVo personVo);

    int getstaffcountByCodeandStatus(StaffVo staffVo);
}
