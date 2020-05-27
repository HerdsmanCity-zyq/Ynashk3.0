package com.samhk.ynashk.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;
@Data
public class FunctionVo implements Serializable {

    private String functionCode;
    private String functionName;
    private String menuCode; 
    private String objectName;
    private Integer displayOrder;
    private List<FunctionControlVo> functionControlList = null;
    private List<FunctionVo> functionList;
    

    
}
