package com.samhk.ynashk.controller.home_management.staff_main;

import com.google.gson.Gson;
import com.samhk.ynashk.service.NewStaffBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.PersonVo;
import com.samhk.ynashk.vo.StaffVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/")
public class NewStaffAction {

    @Resource(name="newStaffImpl")
    private NewStaffBo newStaffBo;

    private static DateFormat DF = Constants.getDateFormat("yyyy-MM-dd");

    @RequestMapping("newStaff.do")
    public String StaffIndex(){
        Constants.getRequest().setAttribute("staffDepartmentAndPositonList", new Gson().toJson(newStaffBo.getDepartmentAndPosition()));
        return "Home_Management/staff_main/newStaff";
    }

    /***
     * 跳转到新增员工
     * @return
     * @throws Exception
     */
    @RequestMapping(value="newStaff.do",params = {"action=newStaff"},produces = {"application/text; charset=UTF-8"},method = RequestMethod.POST)
    @ResponseBody
    public String newStaff(@ModelAttribute StaffVo staffVo ) throws Exception{
        SystemUserVo systemUserVo = new SystemUserVo();
        SystemUserVo user=(SystemUserVo) Constants.getSession().getAttribute("currUser");
        systemUserVo.setCru(user.getUserId());
        systemUserVo.setLuu(user.getUserId());
        Map map=newStaffBo.newStaff(staffVo);
        return new Gson().toJson(map);
    }

    /***
     * 从检视员工跳转到编辑
     * @param staffVo
     * @return
     */
    @RequestMapping(value="newStaff.do",params={"action=editStaff"})
    public String EditStaff(@ModelAttribute StaffVo staffVo) throws ParseException {
        Constants.getRequest().setAttribute("staffDepartmentAndPositonList", new Gson().toJson(newStaffBo.getDepartmentAndPosition()));
        StaffVo staff=newStaffBo.getStaffByCode(staffVo.getStaffCode());
        staff.setInductionDate(DF.format(DF.parse(staff.getInductionDate())));
        staff.setDimissionDate(staff.getDimissionDate()==null? null : DF.format(DF.parse(staff.getDimissionDate())));
        Constants.getRequest().setAttribute("staff", staff);
        return "Home_Management/staff_main/newStaff";
    }

    /**
     * 新增人物資料
     * @param personVo
     * @return
     */
    @RequestMapping(value="newStaff.do",params={"action=addStaffPersonData"})
    @ResponseBody
    public String addStaffPersonData(@ModelAttribute PersonVo personVo){
        Map map = new HashMap();
        if(!StringUtils.isEmpty(personVo)){
            map = newStaffBo.newStaffPerson(personVo);
        }
        return new Gson().toJson(map);
    }

    /**
     * 編輯人物資料
     * @param personVo
     * @return
     */
    @RequestMapping(value="newStaff.do",params={"action=updateStaffPersonData"})
    @ResponseBody
    public String updateStaffPersonData(@ModelAttribute PersonVo personVo){
        Map map = newStaffBo.newStaffPerson(personVo);
        return new Gson().toJson(map);
    }
}
