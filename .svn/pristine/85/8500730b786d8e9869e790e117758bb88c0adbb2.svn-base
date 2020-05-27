package com.samhk.ynashk.service.impl.home_management.staff_main;

import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.NewStaffBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.util.UpdateStatusUtil;
import com.samhk.ynashk.vo.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@Service
public class NewStaffImpl implements NewStaffBo {

    @Resource(name = "staffDao")
    public StaffDao staffDao;
    @Resource(name = "seqNoDao")
    public SeqNoDao seqNoDao;
    @Resource(name = "staffDepartmentDao")
    public StaffDepartmentDao staffDepartmentDao;
    @Resource(name = "staffPositionDao")
    public StaffPositionDao staffPositionDao;
    @Resource(name = "selectDownDao")
    public SelectDownDao selectDownDao;
    @Resource(name = "sysUserDao")
    public SysUserDao sysUserDao;

    public static DateFormat sdfH = Constants.getDateFormat("yyyy/MM/dd HH:mm:ss");

    @Override
    public Map newStaff(StaffVo staffVo) throws SQLException {
        Map map = new HashMap();
        SystemUserVo sessionUserVo = (SystemUserVo) Constants.getSession().getAttribute(Constants.LOGUSER);
        staffVo.setLuu(sessionUserVo.getUserCode());
        staffVo.setCru(sessionUserVo.getUserCode());
        if (StringUtils.isEmpty(staffVo.getStaffCode())) {
            //新增员工
            staffVo.setStaffCode(getAllUserCode("STAFF_CODE"));
            staffDao.newStaff(staffVo);
            String lastUpdateDate = staffDao.getStaffLastUpdateDateByCode(staffVo.getStaffCode());
            staffVo.setYz_last_up_date(lastUpdateDate);
            map.put("message", Constants.getText("newStaff.succ"));
            map.put("status", "success");
        } else {
            //编辑员工
            StaffVo s = staffDao.getStaffByCode(staffVo.getStaffCode());
            String lud = sdfH.format(s.getLud());
            if (lud.equals(staffVo.getYz_last_up_date().replace("-", "/"))) {

                //停用账号
                if("已離職".equals(staffVo.getStaffStatus())){
                    SystemUserVo systemUserVo=new SystemUserVo();
                    systemUserVo.setStaffCode(staffVo.getStaffCode());
                    int count=sysUserDao.getStaffCodeCount(systemUserVo);
                    if(count>0){
                        systemUserVo.setUserStatus("已停用");
                        sysUserDao.updateUserStatus(systemUserVo);
                    }
                }

                if (!"已離職".equals(staffVo.getStaffStatus()) && "在職中".equals(s.getStaffStatus()) && "已保存".equals(staffVo.getStaffStatus())) {
                    staffVo.setStaffStatus(s.getStaffStatus());
                }
                if ("已離職".equals(s.getStaffStatus()) && !"在職中".equals(s.getStaffStatus()) && "已保存".equals(staffVo.getStaffStatus())) {
                    staffVo.setStaffStatus(s.getStaffStatus());
                }
                Integer col1 = staffDao.updateStaff(staffVo);
                if (col1 < 1) {
                    UpdateStatusUtil.isTrue(false, Constants.getText("newStaff.updateOrNot"));
                }
                String lastUpdateDate = staffDao.getStaffLastUpdateDateByCode(staffVo.getStaffCode());
                staffVo.setYz_last_up_date(lastUpdateDate);
                map.put("message", Constants.getText("newStaff.update"));
                map.put("status", "success");
            } else {
                map.put("message", Constants.getText("newStaff.updateOrNot"));
            }
        }
        map.put("staffVo", staffVo);
        return map;
    }

    @Override
    public List<Map<String, Object>> getDepartmentAndPosition() {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<StaffDepartmentVo> staffDepartmentList = staffDepartmentDao.getAllStaffDepartment();
        for (StaffDepartmentVo vo : staffDepartmentList) {
            Map<String, Object> map = new HashMap<String, Object>();
            List<StaffPositionVo> positionList = staffPositionDao.getStaffPositionWithDepartment(vo.getDepartmentId());
            map.put("staffPositionList", positionList);
            map.put("staffDepartmentCode", vo.getDepartmentId());
            list.add(map);
        }
        Map<String, Object> allPosition = new HashMap<String, Object>();
        allPosition.put("staffDepartmentCode", "0");
        allPosition.put("staffPositionList", selectDownDao.getStaffPosition());//存放所有的职位
        list.add(allPosition);
        return list;
    }

    @Override
    public List<StaffVo> searchStaff(StaffVo staffVo) {
        return staffDao.searchStaff(staffVo);
    }

    @Override
    public StaffVo getStaffByCode(String staffCode) {
        StaffVo staff = staffDao.getStaffByCode(staffCode);
        return staff;
    }

    @Override
    @Transactional
    public Map newStaffPerson(PersonVo personVo) {
        Map map = new HashMap();
        if (StringUtils.isEmpty(personVo.getBirthday())) {
            personVo.setBirthday(null);
        }
        SystemUserVo sessionUserVo = (SystemUserVo) Constants.getSession().getAttribute(Constants.LOGUSER);
        personVo.setLuu(sessionUserVo.getUserCode());
        personVo.setCru(sessionUserVo.getUserCode());
        personVo.setPersonStatus("1");//不知該狀態用途，暫時默認設置為1
        if (StringUtils.isEmpty(personVo.getPersonCode())) {
            //新增人物資料
            if (!StringUtils.isEmpty(personVo)) {
                personVo.setPersonCode(getAllUserCode("PERSON_CODE"));
                staffDao.addStaffPerson(personVo);
                PersonVo personVo1 = staffDao.findStaffPerson(personVo.getPersonCode());
                map.put("message", Constants.getText("newStaff.succ"));
                map.put("personVo", personVo1);
            }
        } else {
            //編輯人物資料
            if (!StringUtils.isEmpty(personVo)) {
                Integer col1 = staffDao.updateStaffPerson(personVo);
                if (col1 < 1) {
                    UpdateStatusUtil.isTrue(false, Constants.getText("newStaff.updateOrNot"));
                }
                PersonVo personVo1 = staffDao.findStaffPerson(personVo.getPersonCode());
                map.put("message", Constants.getText("newStaff.succ"));
                map.put("personVo", personVo1);
            }
        }
        map.put("status", "success");
        return map;
    }


    public static ConcurrentMap<String, SeqNoVo> concurrentIdsMap = new ConcurrentHashMap<>();

    /**
     * 新增员工时生成员工编号和人物编号
     *
     * @return
     */
    public synchronized String getAllUserCode(String seqNo) {
        SeqNoVo wvo = seqNoDao.getNoSeq(seqNo);
        if (concurrentIdsMap.get("seq" + seqNo) == null || !concurrentIdsMap.get("seq" + seqNo).getPerfix().equals(wvo.getPerfix())) {

            String number = (wvo.getNumber() + 1) + "";
            wvo.setNumber(Integer.parseInt(number));
            String perfix = wvo.getPerfix();

            int seq = wvo.getLengthOfWatipersonNo() - perfix.length() - number.length();

            for (int i = 0; i < seq; i++) {
                perfix += "0";
            }
            perfix += number;


            List<String> listWaitNo = new ArrayList<>();
            if ("STAFF_CODE".equals(seqNo)) {
                listWaitNo = staffDao.getStaff_code(wvo);
            } else {
                listWaitNo = staffDao.getPersonCode(wvo);

            }
            if (listWaitNo.contains(perfix)) {
                perfix = "";
                String s = listWaitNo.get(0).replace(wvo.getPerfix(), "");
                String no = (Integer.parseInt(s) + 1) + "";
                seq = wvo.getLengthOfWatipersonNo() - wvo.getPerfix().length() - no.length();
                wvo.setNumber(Integer.parseInt(no));
                perfix = wvo.getPerfix();

                for (int i = 0; i < seq; i++) {
                    perfix += "0";
                }
                perfix += no;

            }
            concurrentIdsMap.put("seq" + seqNo, wvo);
            return perfix;

        } else {
            wvo = concurrentIdsMap.get("seq" + seqNo);

            String number = (wvo.getNumber() + 1) + "";
            wvo.setNumber(Integer.parseInt(number));
            concurrentIdsMap.get("seq" + seqNo).setNumber(Integer.parseInt(number));

            String perfix = wvo.getPerfix();

            int seq = wvo.getLengthOfWatipersonNo() - perfix.length() - number.length();


            for (int i = 0; i < seq; i++) {
                perfix += "0";
            }
            perfix += number;

            return perfix;
        }
    }
}
