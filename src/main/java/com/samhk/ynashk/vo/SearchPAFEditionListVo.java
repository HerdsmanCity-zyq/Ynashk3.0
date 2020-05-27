package com.samhk.ynashk.vo;

import lombok.Data;

import java.util.Date;

@Data
public class SearchPAFEditionListVo extends BaseVo{
    private String pafId;
    private String frameworkName;
    private String versionsNo;
    private String bpwinNo;
    private String projectName;
    private String pafName;
    private String pafNameChi;
    private String pafVisioVersion;
    private String status;
    private String assignTo;
    private Date assignDate;
    private Integer estDuration;
    private String codeTo;
    private Date submitStartDate;
    private Date submitDate;
    private Integer actualDuration;
    private Integer projectId;
}
