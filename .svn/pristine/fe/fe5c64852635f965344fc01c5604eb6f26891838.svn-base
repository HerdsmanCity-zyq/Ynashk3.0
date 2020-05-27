package com.samhk.ynashk.service.impl.home_management.user_main;

import com.google.gson.Gson;
import com.samhk.ynashk.mapper.SeqNoDao;
import com.samhk.ynashk.mapper.StaffDao;
import com.samhk.ynashk.mapper.SysUserDao;
import com.samhk.ynashk.service.NewUserBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.SeqNoVo;
import com.samhk.ynashk.vo.StaffVo;
import com.samhk.ynashk.vo.SystemUserVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

@Service("newUserImpl")
public class NewUserImpl implements NewUserBo {

    @Resource(name = "sysUserDao")
    SysUserDao sysUserDao;

    @Resource(name = "staffDao")
    public StaffDao staffDao;

    @Resource(name = "seqNoDao")
    public SeqNoDao SeqIDDao;

    @Override
    public List<SystemUserVo> searchUserList(SystemUserVo systemUserVo) {
        return sysUserDao.getAllUserList(systemUserVo);
    }

    public static DateFormat sdfH = Constants.getDateFormat("yyyy/MM/dd HH:mm:ss");

    @Override
    @Transactional
    public Map<String, Object> save(SystemUserVo systemUserVo, String chgPwd) throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        SystemUserVo user = (SystemUserVo) Constants.getRequest().getSession().getAttribute("currUser");

        SystemUserVo sessionUserVo = (SystemUserVo) Constants.getSession().getAttribute(Constants.LOGUSER);

        String old_value = Constants.getRequest().getParameter("old_value");
        if (systemUserVo.getStaffCode().equals("0")) {
            systemUserVo.setStaffCode(null);
        }
        SystemUserVo s = sysUserDao.searchUser(systemUserVo);
        String last_up_date = null;
        if (s != null) {
            last_up_date = sdfH.format(s.getLud());
            systemUserVo.setYzLastUpDate(last_up_date);
        }
        map.put("systemUserVo", systemUserVo);
        map.put("old", new Gson().toJson(systemUserVo));
        map.put("result", Constants.getText("message.common.09"));

        if (StringUtils.isEmpty(systemUserVo.getUserCode())) {
            //用戶編號為空
            //檢查身份證是否已經存在

            systemUserVo.setUserCode(getAllUserCode());
            systemUserVo.setCru(user.getUserId());
            systemUserVo.setLuu(user.getUserId());
            //插入地址和用戶信息
//			sysUserDao.insertAddress(systemUserVo);
            sysUserDao.insertSysUser(systemUserVo);

        } else {

            SystemUserVo temp = new SystemUserVo();
            temp.setUserCode(systemUserVo.getUserCode());
            String staffcode = sysUserDao.searchUser(temp).getStaffCode();
            if ("已啟動".equals(systemUserVo.getUserStatus()) && !StringUtils.isEmpty(staffcode)) {
                StaffVo staffvo = new StaffVo();
                staffvo.setStaffStatus("已離職");
                staffvo.setStaffCode(staffcode);
                if (staffDao.getstaffcountByCodeandStatus(staffvo) > 0) {
                    map.put("error", "restartTip");
                    return map;
                }
            }

            /*
             * 判断该员工是否已经被修改过了
             */
            /*SystemUserVo s = sysUserDao.searchUser(systemUserVo);
            String last_up_date = sdfH.format(s.getLud());*/
            //判断该员工是否已经被修改过了
            if (last_up_date.equals(systemUserVo.getYzLastUpDate())) {
                if ("Y".equals(chgPwd)) {
                    //重發密碼
                    if (user.getUserId().equals(systemUserVo.getUserId())) {
                        map.put("self", "Y");
                    } else {
                        map.put("self", "N");
                    }
                    systemUserVo.setLuu(user.getUserId());
                    sysUserDao.changeSysUserPwd(systemUserVo);
                    //日志 插入
                } else {
                    systemUserVo.setLuu(user.getUserId());
                    //更新sysUser
                    if (systemUserVo.getStaffCode()!=null&&systemUserVo.getStaffCode().equals("0")) {
                        systemUserVo.setStaffCode(null);
                    }
                    sysUserDao.updateSysUser(systemUserVo);

					/*//进行修改用户时，需要先删除该用户院舍，后面再重新添加
					systemUserNursingHomeDao.deleteUserBeforeInsert(systemUserVo.getUser_code());*/
                }
            } else {
                map.put("error", Constants.getText("newUser.updateOrNot"));
            }
        }

        return map;
    }

    @Override
    public SystemUserVo searchUser(SystemUserVo systemUserVo) {
        return sysUserDao.searchUser(systemUserVo);
    }

    @Override
    public String getAutoCode() {
        return sysUserDao.getCountCode();
    }
    /**
     * 检查用戶賬號是否重复
     * @param ID
     * @return
     */
    @Override
    public String checkUserID(String ID) {
        SystemUserVo check = sysUserDao.chekUserID(ID);

        if (check != null){
            return "Y";
        }
        return "N";
    }

    @Override
    public String checkUser(String staffCode) {
        SystemUserVo check = sysUserDao.chekUser(staffCode);
        if (check != null){
            return "Y";
        }
        return "N";
    }

    //获取居址服务套餐编号规则
    public static ConcurrentMap<String, SeqNoVo> concurrentIdsMap = new ConcurrentHashMap<>();

    public synchronized String getAllUserCode() {
        SeqNoVo wvo = SeqIDDao.getNoSeq("USER_CODE");
        if (concurrentIdsMap.get("seq") == null || !concurrentIdsMap.get("seq").getPerfix().equals(wvo.getPerfix())) {

            String number = (wvo.getNumber() + 1) + "";
            wvo.setNumber(Integer.parseInt(number));
            String perfix = wvo.getPerfix();

            int seq = wvo.getLengthOfWatipersonNo() - perfix.length() - number.length();
            if (seq > 0) {
                for (int i = 0; i < seq; i++) {
                    perfix += "0";
                }
                perfix += number;
            }

            List<String> listWaitNo = sysUserDao.getAllUserCode(wvo);
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
            concurrentIdsMap.put("seq", wvo);
            return perfix;

        } else {
            wvo = concurrentIdsMap.get("seq");

            String number = (wvo.getNumber() + 1) + "";
            wvo.setNumber(Integer.parseInt(number));
            concurrentIdsMap.get("seq").setNumber(Integer.parseInt(number));

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
