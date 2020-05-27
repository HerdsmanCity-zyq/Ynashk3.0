package com.samhk.ynashk.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class ProjectPafDocumentVo extends BaseVo{

    private Integer projectId;
    private String pafId;
    private String pafDocumentName;
    private String pafDocumentDesc;
    private String pafDocumentSize;
    private String pafDocumentPath;
    private MultipartFile files;
}
