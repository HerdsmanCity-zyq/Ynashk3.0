package com.samhk.ynashk.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PafAttachmentVo extends BaseVo{

    private Integer pafAttachmentId;

    private String frameworkId;

    private Integer versionsId;

    private String pafId;

    private String pafAttachmentName;

    private String pafAttachmentDesc;

    private String pafAttachmentSize;
    private String pafPath;

    private MultipartFile files;


    private String date;


    private String fileUrl;

    private String fileCrd;

}
