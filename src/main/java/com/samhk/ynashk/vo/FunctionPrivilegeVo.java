package com.samhk.ynashk.vo;

import lombok.Data;

@Data
public class FunctionPrivilegeVo extends BaseVo{

    private String roleCode;
    private String functionCode;
    private String controlCode;
    private String accessibleInd;

}
