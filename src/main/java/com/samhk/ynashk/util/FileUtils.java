package com.samhk.ynashk.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Slf4j
public class FileUtils {

    /**
     * 文件下载
     *
     * @param
     * @param response
     * @param fileName
     * @return
     */
    public static void downloadFile(HttpServletResponse response, HttpServletRequest req, String filePath, String fileName) {

        try {
            if (!StringUtils.isEmpty(filePath)) {
                //设置文件路径
                File file = new File(filePath);
                //File file = new File(realPath , fileName);
                if (file.exists()) {
                    // 设置强制下载不打开
                    response.setContentType("application/force-download");
                    //response.setContentType("multipart/form-data");
                    // 设置文件名
                    String newFileName = null;
                    try {

                        response.setContentType("binary/octet-stream");
                        req.setCharacterEncoding("UTF-8");
                        newFileName=URLEncoder.encode(fileName,"UTF-8");
                        newFileName=newFileName.replaceAll("\\+","%20");
                    } catch (UnsupportedEncodingException e1) {
                        e1.printStackTrace();
                    }

                    response.addHeader("Content-Disposition", "attachment;filename*=UTF-8''" + newFileName);
                    byte[] buffer = new byte[1024];
                    FileInputStream fis = null;
                    BufferedInputStream bis = null;
                    try {
                        fis = new FileInputStream(file);
                        bis = new BufferedInputStream(fis);
                        OutputStream os = response.getOutputStream();
                        int i = bis.read(buffer);
                        while (i != -1) {
                            os.write(buffer, 0, i);
                            i = bis.read(buffer);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (bis != null) {
                            try {
                                bis.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                        if (fis != null) {
                            try {
                                fis.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            log.info(e.getMessage());
        }
    }

}
