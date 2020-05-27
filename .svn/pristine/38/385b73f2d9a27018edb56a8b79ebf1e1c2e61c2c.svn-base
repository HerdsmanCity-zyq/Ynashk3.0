package com.samhk.ynashk.service.impl.parameter_manage.role_manage;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.samhk.ynashk.mapper.*;
import com.samhk.ynashk.service.SystemRoleBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.vo.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@Service("systemRoleImpl")
public class SystemRoleImpl implements SystemRoleBo {

    @Resource(name = "systemFlowDao")
    private SystemFlowDao systemFlowDao;

    @Resource(name = "functionDao")
    private FunctionDao functionDao;

    @Resource(name = "seqNoDao")
    private SeqNoDao SeqNoDao;

    @Resource(name = "systemRoleDao")
    private SystemRoleDao systemRoleDao;

    @Resource(name = "functionPrivilegeDao")
    private FunctionPrivilegeDao functionPrivilegeDao;

    /**
     * 权限菜单
     *
     * @param vo
     * @return
     */
    @Override
    public String jsonTree(SystemUserRoleVo vo) {
        List<Object> result = new ArrayList<>();
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("id", 0);
        resultMap.put("text", "eSAM");
        List<Object> menu1List = new ArrayList<>();
        try {
            List<MenuVo> resultList = functionPrivilegeDao.getRoleFunctionPrivilege(vo);
            for (MenuVo pvo : resultList) {
                if (pvo.getParentMenuCode() == null || "".equals(pvo.getParentMenuCode())) {
                    //Parent Menu
                    Map<String, Object> menu1Map = new HashMap<>();
                    menu1Map.put("id", "home");
                    menu1Map.put("text", pvo.getMenuName());
                    menu1Map.put("state", "open");

                    if (pvo.getFunctionList() != null && pvo.getFunctionList().size() > 0 && pvo.getFunctionList().get(0).getFunctionCode() != null) {
                        List<Object> funcControlList = null;
                        menu1Map.put("id", pvo.getMenuCode());
                        menu1Map.put("text", pvo.getMenuName());
                        menu1Map.put("state", "open");
                        for (FunctionVo fvo : pvo.getFunctionList()) {
                            funcControlList = new ArrayList<Object>();
                            for (FunctionControlVo fcvo : fvo.getFunctionControlList()) {
                                if (fcvo.getControlCode() != null && !fcvo.getControlCode().equalsIgnoreCase("Read")) {
                                    Map<String, Object> button = new HashMap<String, Object>();
                                    Map<String, Object> attributes = new HashMap<String, Object>();
                                    attributes.put("function_code", fcvo.getFunctionCode());
                                    attributes.put("menu_code", systemFlowDao.byMenuCode(fcvo.getFunctionCode()));
                                    attributes.put("control_code", fcvo.getControlCode());
                                    attributes.put("control_name", fcvo.getControlName());
                                    button.put("id", fcvo.getFunctionCode() + "_" + fcvo.getControlCode() + "-_");
                                    button.put("text", fcvo.getControlName());
                                    if ("1".equals(fcvo.getChecked())) {
                                        button.put("checked", true);
                                    } else {
                                        button.put("checked", false);
                                    }
                                    button.put("attributes", attributes);
                                    funcControlList.add(button);
                                } else if (fvo.getFunctionControlList().size() == 1 && fcvo.getControlCode() != null && fcvo.getControlCode().equalsIgnoreCase("Read") && "1".equals(fcvo.getChecked())) {
                                    menu1Map.put("checked", true);
                                }
                            }
                        }
                    }

                    List<Object> childMenu = new ArrayList<Object>();
                    for (MenuVo cvo : resultList) {
                        if (cvo.getParentMenuCode() != null && !"".equals(cvo.getParentMenuCode())) {//Child&Son Menu
                            List<Object> sonMenu = new ArrayList<Object>();
                            List<Object> sonMenus = new ArrayList<Object>();
                            if (cvo.getParentMenuCode().equals(pvo.getMenuCode())) {//Child Menu
                                Map<String, Object> menu2Map = new HashMap<String, Object>();
                                menu2Map.put("text", cvo.getMenuName());
                                menu2Map.put("state", "open");

                                if (cvo.getFunctionList() != null && cvo.getFunctionList().size() > 0 && cvo.getFunctionList().get(0).getFunctionCode() != null) {
                                    menu2Map.put("id", cvo.getMenuCode());
                                    List<Object> functionList = new ArrayList<Object>();
                                    List<Object> funcControlList = null;
                                    for (FunctionVo fvo : cvo.getFunctionList()) {
                                        funcControlList = new ArrayList<Object>();
                                        for (FunctionControlVo fcvo : fvo.getFunctionControlList()) {
                                            if (fcvo.getControlCode() != null && !fcvo.getControlCode().equalsIgnoreCase("Read")) {
                                                Map<String, Object> button = new HashMap<String, Object>();
                                                Map<String, Object> attributes = new HashMap<String, Object>();
                                                attributes.put("function_code", fcvo.getFunctionCode());
                                                attributes.put("control_code", fcvo.getControlCode());
                                                attributes.put("control_name", fcvo.getControlName());
                                                button.put("id", fcvo.getFunctionCode() + "-" + fcvo.getControlCode() + "-_");
                                                button.put("text", fcvo.getControlName());
                                                if ("1".equals(fcvo.getChecked())) {
                                                    button.put("checked", true);
                                                } else {
                                                    button.put("checked", false);
                                                }
                                                button.put("attributes", attributes);
                                                funcControlList.add(button);
                                            } else if (fvo.getFunctionControlList().size() == 1 && fcvo.getControlCode() != null && fcvo.getControlCode().equalsIgnoreCase("Read") && "1".equals(fcvo.getChecked())) {
                                                menu2Map.put("checked", true);
                                            }
                                        }
                                        if (!cvo.getMenuCode().contains("Rep") || cvo.getMenuCode().equals("Rep_SESR")) {//包含多于一个function的child menu
                                            Map<String, Object> functionMap = new HashMap<String, Object>();
                                            functionMap.put("id", fvo.getFunctionCode());
                                            functionMap.put("text", fvo.getFunctionName());
                                            functionMap.put("state", "open");
                                            functionMap.put("children", funcControlList);
                                            functionList.add(functionMap);
                                        }
                                    }
                                    menu2Map.put("children", funcControlList);
                                } else {
                                    for (MenuVo svo : resultList) {
                                        if (svo.getParentMenuCode() != null && !"".equals(svo.getParentMenuCode())
                                                && svo.getParentMenuCode().equals(cvo.getMenuCode())) {//Son Menu
                                            Map<String, Object> menu3Map = new HashMap<String, Object>();
                                            menu3Map.put("id", svo.getMenuCode());
                                            menu3Map.put("text", svo.getMenuName());
                                            menu3Map.put("state", "open");
                                            List<Object> functionList = new ArrayList<Object>();
                                            if (svo.getFunctionList() != null && svo.getFunctionList().get(0).getFunctionControlList().get(0).getControlCode() != null) {//3
                                                menu3Map.put("id", svo.getMenuCode());
                                                for (FunctionVo fvo : svo.getFunctionList()) {
                                                    Map<String, Object> functionMap = new HashMap<String, Object>();
                                                    functionMap.put("id", fvo.getFunctionCode());
                                                    functionMap.put("text", fvo.getFunctionName());
                                                    functionMap.put("state", "open");

                                                    List<Object> funcControlList = new ArrayList<Object>();
                                                    if (fvo.getFunctionControlList() != null && fvo.getFunctionControlList().size() > 0) {
                                                        for (FunctionControlVo fcvo : fvo.getFunctionControlList()) {
                                                            if (fcvo.getControlCode() != null && !fcvo.getControlCode().equalsIgnoreCase("Read")) {
                                                                Map<String, Object> button = new HashMap<String, Object>();
                                                                Map<String, Object> attributes = new HashMap<String, Object>();

                                                                attributes.put("function_code", fcvo.getFunctionCode());
                                                                attributes.put("control_code", fcvo.getControlCode());
                                                                attributes.put("control_name", fcvo.getControlName());
                                                                String controlCode = fcvo.getControlCode();
                                                                if (controlCode.indexOf(".") != -1) {
                                                                    controlCode = controlCode.replace(".", "_");
                                                                }
                                                                button.put("id", fcvo.getFunctionCode() + "-" + controlCode + "-_");
                                                                button.put("text", fcvo.getControlName());
                                                                if ("1".equals(fcvo.getChecked())) {
                                                                    button.put("checked", true);
                                                                } else {
                                                                    button.put("checked", false);
                                                                }
                                                                button.put("attributes", attributes);
                                                                funcControlList.add(button);
                                                            } else if (fvo.getFunctionControlList().size() == 1 && fcvo.getControlCode() != null && fcvo.getControlCode().equalsIgnoreCase("Read") && "1".equals(fcvo.getChecked())) {
                                                                menu3Map.put("checked", true);
                                                            }
                                                        }
                                                    } else {
                                                        break;
                                                    }
                                                    menu3Map.put("children", funcControlList);
                                                    functionList.add(functionMap);
                                                }
                                            } else {
                                                for (MenuVo zvo : resultList) {
                                                    if (zvo.getParentMenuCode() != null && !"".equals(zvo.getParentMenuCode())
                                                            && zvo.getParentMenuCode().equals(svo.getMenuCode())) {
                                                        Map<String, Object> menu4Map = new HashMap<String, Object>();
                                                        menu4Map.put("id", zvo.getMenuCode());
                                                        menu4Map.put("text", zvo.getMenuName());
                                                        menu4Map.put("state", "open");
                                                        if (zvo.getFunctionList() != null && zvo.getFunctionList().size() > 0) {
                                                            for (FunctionVo fvo : zvo.getFunctionList()) {
                                                                Map<String, Object> functionMap = new HashMap<String, Object>();
                                                                functionMap.put("id", fvo.getFunctionCode());
                                                                functionMap.put("text", fvo.getFunctionName());
                                                                functionMap.put("state", "open");

                                                                List<Object> funcControlList = new ArrayList<Object>();
                                                                if (fvo.getFunctionControlList() != null && fvo.getFunctionControlList().size() > 0) {
                                                                    for (FunctionControlVo fcvo : fvo.getFunctionControlList()) {
                                                                        if (fcvo.getControlCode() != null && !fcvo.getControlCode().equalsIgnoreCase("Read")) {
                                                                            Map<String, Object> button = new HashMap<String, Object>();
                                                                            Map<String, Object> attributes = new HashMap<String, Object>();

                                                                            attributes.put("function_code", fcvo.getFunctionCode());
                                                                            attributes.put("control_code", fcvo.getControlCode());
                                                                            attributes.put("control_name", fcvo.getControlName());
                                                                            button.put("id", fcvo.getFunctionCode() + "-" + fcvo.getControlCode() + "-_");
                                                                            button.put("text", fcvo.getControlName());
                                                                            if ("1".equals(fcvo.getChecked())) {
                                                                                button.put("checked", true);
                                                                            } else {
                                                                                button.put("checked", false);
                                                                            }
                                                                            button.put("attributes", attributes);
                                                                            funcControlList.add(button);
                                                                        } else if (fvo.getFunctionControlList().size() == 1 && fcvo.getControlCode() != null && fcvo.getControlCode().equalsIgnoreCase("Read") && "1".equals(fcvo.getChecked())) {
                                                                            menu4Map.put("checked", true);
                                                                        }
                                                                    }
                                                                } else {
                                                                    break;
                                                                }
                                                                menu4Map.put("children", funcControlList);
                                                            }
                                                        }
                                                        sonMenus.add(menu4Map);
                                                    }
                                                }
                                                menu3Map.put("children", sonMenus);
                                            }
                                            sonMenu.add(menu3Map);
                                        }//end Son Menu
                                        else {
                                        }
                                    }
                                    menu2Map.put("children", sonMenu);
                                }
                                childMenu.add(menu2Map);

                            }//end Child Menu

                        }//end Child&Son Menu
                    }
                    menu1Map.put("children", childMenu);
                    menu1List.add(menu1Map);

                }//Parent Menu
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        resultMap.put("children", menu1List);
        result.add(resultMap);
        Gson gson = new Gson();
        JsonElement element = gson.toJsonTree(result);
        String json = gson.toJson(element);
        return json;
    }

    /**
     * 保存新增角色
     *
     * @param jsonTree
     * @return
     */
    @Override
    public String SaveNewRole(String jsonTree) {
        String result;
        String process_code = Constants.getRequest().getParameter("process_code");
        String roleCode = Constants.getRequest().getParameter("roleCode");
        String roleName = Constants.getRequest().getParameter("roleName");
        String roleChiName = Constants.getRequest().getParameter("roleChiName");
        String effectDate = Constants.getRequest().getParameter("effectDate");
        String stopDate = Constants.getRequest().getParameter("stopDate");
        SystemUserVo user = (SystemUserVo) Constants.getRequest().getSession().getAttribute("currUser");

        //新增角色表
        SystemUserRoleVo vo = new SystemUserRoleVo();
        vo.setRoleName(roleName);
        vo.setCru(user.getUserId());
        vo.setLuu(user.getUserId());
        vo.setRoleChiName(roleChiName);
        vo.setEffectDate(effectDate);
        vo.setStopDate(stopDate);
        String jg;
        if (roleCode != null && !"".equals(roleCode)) {
            //修改
            //需要先删除角色流程表
            vo.setRoleCode(roleCode);
            functionPrivilegeDao.deleteFunctionPrivilegeVoList(roleCode);
            systemRoleDao.updateRole(vo);
            jg = "修改成功";
        } else {
            //新增
            roleCode = getNoSeq();
            vo.setRoleCode(roleCode);
            systemRoleDao.newRole(vo);
            jg = "保存成功";
        }
        //新增角色流程表
        String[] arr = process_code.split(",");
        if (!"".equals(arr[0]) && arr[0] != null) {
            for (String s : arr) {
                systemRoleDao.addRoleProcess(roleCode, s);
            }
        }
        List<FunctionPrivilegeVo> list = forParse(jsonTree, roleCode);
        for (FunctionPrivilegeVo fvo : list) {
            functionPrivilegeDao.addFunctionPrivilegeVoList(fvo);
        }
        result = roleCode + "%" + jg;
        return result;
    }

    private List<FunctionPrivilegeVo> forParse(String treeString, String roleCode) {
        SystemUserVo user = (SystemUserVo) Constants.getRequest().getSession().getAttribute("currUser");
        List<FunctionPrivilegeVo> result = new CopyOnWriteArrayList<>();
        String[] str = treeString.split(",");
        for (String s : str) {
            if (!"".equals(s) && !"home".equals(s) && !"undefined".equals(s)) {
                //非一二级菜单
                FunctionPrivilegeVo vo = new FunctionPrivilegeVo();
                if (s.indexOf("-") > 0) {
                    //操作方法层
                    String[] tem = s.split("-");
                    if (Integer.parseInt(tem[0]) > 0) {
                        vo.setFunctionCode(tem[0]);
                        vo.setControlCode(tem[1]);
                        vo.setRoleCode(roleCode);
                        vo.setCru(user.getUserId());
                        vo.setLuu(user.getUserId());
                        vo.setAccessibleInd("Y");
                    }
                } else {
                    //三级菜单
                    //根据menuCode找到functionCode
                    MenuVo mvo = new MenuVo();
                    mvo.setMenuCode(s);
                    List<FunctionVo> funCodeVo = functionDao.getFunction(mvo);
                    if (funCodeVo.size() > 0) {
                        vo.setFunctionCode(funCodeVo.get(0).getFunctionCode());
                        vo.setControlCode("READ");
                        vo.setRoleCode(roleCode);
                        vo.setCru(user.getUserId());
                        vo.setLuu(user.getUserId());
                        vo.setAccessibleInd("Y");
                    } else {
                        continue;
                    }
                }
                result.add(vo);

            }
        }
        for (FunctionPrivilegeVo voo : result) {
            if (!isCountainRead(voo, result)) {
                FunctionPrivilegeVo vo = new FunctionPrivilegeVo();
                vo.setFunctionCode(voo.getFunctionCode());
                vo.setControlCode("READ");
                vo.setRoleCode(roleCode);
                vo.setCru(user.getUserId());
                vo.setLuu(user.getUserId());
                vo.setAccessibleInd("Y");
                result.add(vo);
            }
        }
        List<String> list = new ArrayList<>();
        for (FunctionPrivilegeVo voo : result) {
            if (isNumeric(voo.getFunctionCode())) {
                String privilege = voo.getFunctionCode() + "-" + voo.getControlCode();
                if (!list.contains(privilege)) {
                    list.add(privilege);
                }
            }
        }
        List<FunctionPrivilegeVo> privilege = new CopyOnWriteArrayList<>();
        for (String i : list) {
            String[] su = i.split("-");

            FunctionPrivilegeVo vo = new FunctionPrivilegeVo();
            vo.setFunctionCode(su[0]);
            vo.setControlCode(su[1]);
            vo.setRoleCode(roleCode);
            vo.setCru(user.getUserId());
            vo.setLuu(user.getUserId());
            vo.setAccessibleInd("Y");
            privilege.add(vo);
        }

        return privilege;
    }

    public static boolean isNumeric(String str) {
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    private boolean isCountainRead(FunctionPrivilegeVo voo, List<FunctionPrivilegeVo> result) {
        boolean bl = false;
        for (FunctionPrivilegeVo vo : result) {
            if (voo.getFunctionCode().equals(vo.getFunctionCode())) {
                if ("Read".equals(vo.getControlCode())) {
                    bl = true;
                    break;
                }
            }
        }
        return bl;
    }

    public synchronized String getNoSeq() {
        SeqNoVo wvo = SeqNoDao.findByRemember("RI");
        String number = (wvo.getNumber() + 1) + "";
        StringBuilder perfix = new StringBuilder(wvo.getPerfix());
        int seq = wvo.getLengthOfWatipersonNo() - perfix.length() - number.length();

        if (seq > 0) {
            for (int i = 0; i < seq; i++) {
                perfix.append("0");
            }
            perfix.append(number);
        }

        List<String> listWaitNo = systemRoleDao.getSeqNo(wvo);

        if (listWaitNo.contains(perfix.toString())) {
            perfix = new StringBuilder();
            String s = listWaitNo.get(0).replace(wvo.getPerfix(), "");
            String no = (Integer.parseInt(s) + 1) + "";
            seq = wvo.getLengthOfWatipersonNo() - wvo.getPerfix().length() - no.length();
            perfix = new StringBuilder(wvo.getPerfix());
            if (seq > 0) {
                for (int i = 0; i < seq; i++) {
                    perfix.append("0");
                }
                perfix.append(no);
            }
        }
        return perfix.toString();
    }

    /**
     * 获取所有角色列表
     *
     * @param systemUserRoleVo
     * @return
     */
    @Override
    public List<SystemUserRoleVo> getAllUserRoleList(SystemUserRoleVo systemUserRoleVo) {
        return systemRoleDao.getAllUserRoleList(systemUserRoleVo);
    }


    @Override
    public SystemUserRoleVo getOneRole(String code) {
        return systemRoleDao.getOneRole(code);
    }
}
