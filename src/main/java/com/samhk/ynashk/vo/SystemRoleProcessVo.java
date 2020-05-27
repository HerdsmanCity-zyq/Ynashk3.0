package com.samhk.ynashk.vo;

import java.util.List;

public class SystemRoleProcessVo extends BaseVo {

    private String roleCode;
    private String processCode;
    private String processName;
    private List<ProcessPrivilegeVo> processPrivilegeList;

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getProcessCode() {
        return processCode;
    }

    public void setProcessCode(String processCode) {
        this.processCode = processCode;
    }

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public List<ProcessPrivilegeVo> getProcessPrivilegeList() {
        return processPrivilegeList;
    }

    public void setProcessPrivilegeList(
            List<ProcessPrivilegeVo> processPrivilegeList) {
        this.processPrivilegeList = processPrivilegeList;
    }
}
