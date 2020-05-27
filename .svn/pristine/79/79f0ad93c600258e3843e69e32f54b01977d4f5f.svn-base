package com.samhk.ynashk.vo;


import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class PafAssignVo extends BaseVo{

    private String frameworkId;
    private Integer versionsId;
    private String pafId;
    private String developer;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date assignTime;
    private Integer estimateCompleteHour;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date submitTime;
    private Integer actualCompleteHour;
    private String remark;

    private String assignTimeStr;

    private FrameworkVo frameworkVo;
    private VersionsVo versionsVo;
}
