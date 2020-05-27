package com.samhk.ynashk.controller.home_management.staff_main;

import com.samhk.ynashk.service.NewStaffBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.StaffVo;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class SearchStaffAction {
    @Resource(name="newStaffImpl")
    public NewStaffBo newStaffBo;

    @RequestMapping("searchStaff.do")
    public String SearchStaff(StaffVo staffVo){
        List<StaffVo> staffVos =  newStaffBo.searchStaff(staffVo);
        Constants.getRequest().setAttribute("staffList",staffVos);
        return "Home_Management/staff_main/searchStaff";
    }
}
