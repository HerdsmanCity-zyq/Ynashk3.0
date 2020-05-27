package com.samhk.ynashk.util;

import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Objects;
import java.util.ResourceBundle;

public class Constants {

    public static final String REQUESTCONTEXT = "RequestContext";
    public static final String REQUEST = "Request";
    public static final String RESPONSE = "Response";
    public static final String LOGUSER = "currUser";
    public static final String JSON = "json";
    public static final String OS = System.getProperty("os.name").toLowerCase();


    private static ThreadLocal<HashMap<String, Object>> CurrentThreadVariable = new ThreadLocal<>();

    /**
     * 通过当前的操作系统来获取对应配置文件里的值
     * @param key
     * @return
     */
    public static String getApplicationValue(String key) {
        if("paf.vsb.file.path".equals(key)||"paf.doc.file.path".equals(key)){
            if(OS.contains("windows")){
                key += ".windows";
            } else {
                key += ".linux";
            }
        }
        return ResourceBundle.getBundle("applicationContext").getString(key);
    }

    public static DateFormat getDateFormat(String formatKey, Locale locale) {
        DateFormat dateFormat = (SimpleDateFormat) getObject(formatKey.concat("_").concat(locale.toString()));
        if (null == dateFormat) {
            dateFormat = new SimpleDateFormat(formatKey, locale);
            setObject(formatKey.concat("_").concat(locale.toString()), dateFormat);
        }
        return dateFormat;
    }

    public static DateFormat getDateFormat(String formatKey) {
        return getDateFormat(formatKey, Locale.getDefault(Locale.Category.FORMAT));
    }

    public static void setObject(String key, Object value) {
        HashMap<String, Object> map = CurrentThreadVariable.get();
        if (null == map) {
            map = new HashMap<>();
            CurrentThreadVariable.set(map);
        }
        map.put(key, value);
    }

    public static Object getObject(String key) {
        HashMap<String, Object> map = CurrentThreadVariable.get();
        if (null == map) {
            return null;
        }
        return map.get(key);
    }

    public static void removeObject() {
        CurrentThreadVariable.get().clear();
        CurrentThreadVariable.remove();
    }

    public static HttpServletRequest getRequest() {
        return ((HttpServletRequest) getObject(Constants.REQUEST));
    }

    public static HttpServletResponse getResponse() {
        return ((HttpServletResponse) getObject(Constants.RESPONSE));
    }

    public static HttpSession getSession() {
        return ObjectUtils.isEmpty(getRequest()) ? null : getRequest().getSession();
    }

    public static void defaultErrorView(String view, String key, Object value, HttpServletRequest request) {
        request.setAttribute("ErrorView", view);
        request.setAttribute("ViewMessageKey", key);
        request.setAttribute(key, value);
    }

    public static String getText(String key, Object... arg) {
        return ((RequestContext) Objects.requireNonNull(getObject(Constants.REQUESTCONTEXT))).getMessage(key, arg);
    }

    public static void validate(String value, boolean dropdownName, int maxLength, boolean isMust, String valueName, StringBuffer message) {
        if (dropdownName && "0".equals(value)) {
            value = null;
        }
        if (!StringUtils.isEmpty(value)) {
            if (value.length() > maxLength && maxLength > -1) {
                message.append(getText("message.common.04", valueName, maxLength)).append(System.getProperty("line.separator"));
            }
        } else {
            if (isMust) {
                message.append(getText("message.common.02", valueName)).append(System.getProperty("line.separator"));
            }
        }
    }

    public static String getKeyByLang(String name_ch, String name_en, String lang) {
        String name = "";
        if ("zh".equals(lang)) {
            name = name_ch;
        } else {
            name = name_en;
        }
        return name;
    }

    /**
     * 兼容ie浏览器下上传文件路径出错
     * @param file
     * @return
     */
    public static String getFileName(MultipartFile file) {
        // 获取文件名
        String fileName = file.getOriginalFilename();
        //判断是否为IE浏览器的文件名，IE浏览器下文件名会带有盘符信息
        // Check for Unix-style path
        int unixSep = fileName != null ? fileName.lastIndexOf('/') : 0;
        // Check for Windows-style path
        int winSep = fileName != null ? fileName.lastIndexOf('\\') : 0;
        // Cut off at latest possible point
        int pos = Math.max(winSep, unixSep);
        if (pos != -1) {
            // Any sort of path separator found...
            fileName = fileName != null ? fileName.substring(pos + 1) : null;
        }
        return fileName;
    }


    /**
     * 获取登录IP地址
     *
     * @param request
     * @return
     * @throws UnknownHostException
     */
    public static String getIpAddr(HttpServletRequest request) throws UnknownHostException {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if ("0:0:0:0:0:0:0:1".equals(ip) || "127.0.0.1".equals(ip)) {
            ip = InetAddress.getLocalHost().getHostAddress();
        }
        return ip;
    }
}
