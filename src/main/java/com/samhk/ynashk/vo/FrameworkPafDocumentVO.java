package com.samhk.ynashk.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class FrameworkPafDocumentVO extends  BaseVo{

    private String pafId;

    private String pafDocumentName;

    private String pafDocumentDesc;

    private String pafDocumentSize;

    private String pafDocumentPath;

    private String crdstr;

    private MultipartFile files;
}
