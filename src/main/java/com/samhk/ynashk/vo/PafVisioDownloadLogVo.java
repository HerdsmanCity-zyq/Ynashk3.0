package com.samhk.ynashk.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class PafVisioDownloadLogVo implements Serializable {

    private Integer pafDownloadLogId;

    private Integer pafVisioId;

    private String downloadBy;

    private Date downloadDate;

}
