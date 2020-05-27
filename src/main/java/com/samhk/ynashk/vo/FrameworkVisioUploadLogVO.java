package com.samhk.ynashk.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class FrameworkVisioUploadLogVO implements Serializable {

    private int uploadId;
    private String pafId;
    private String visioName;
    private String uploadBy;
    private String uplodaDate;
}
