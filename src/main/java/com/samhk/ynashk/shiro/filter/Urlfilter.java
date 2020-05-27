package com.samhk.ynashk.shiro.filter;

import com.samhk.ynashk.service.LoginBo;
import com.samhk.ynashk.util.Constants;
import com.samhk.ynashk.util.SpringContextHelp;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Writer;

public class Urlfilter extends AccessControlFilter {
    private static final Logger log = LoggerFactory.getLogger(Urlfilter.class);


    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object o) throws Exception {
        Subject subject = getSubject(servletRequest, servletResponse);
        HttpServletRequest request = WebUtils.toHttp(servletRequest);
        HttpServletResponse response = WebUtils.toHttp(servletResponse);
        String url = getPathWithinApplication(servletRequest);

        request.setAttribute("URI", request.getRequestURI());
        response.setCharacterEncoding("UTF-8");
        Constants.setObject(Constants.REQUESTCONTEXT, new RequestContext(request, servletRequest.getServletContext()));
        Constants.setObject(Constants.REQUEST, request);
        Constants.setObject(Constants.RESPONSE, response);
        response.setHeader("Set-Cookie", "HTTPOnly=true;Secure=true");
        //保存排序
        request.setAttribute("order", request.getParameter("order"));
        request.setAttribute("orderBy", request.getParameter("orderBy"));
        if (!StringUtils.isEmpty(request.getParameter("resident_no"))) {
            Constants.getSession().setAttribute("resident_no", request.getParameter("resident_no"));
        }
        //以项目名结尾不进行拦截


        String status = login(request, response, subject);

        //ajax 请求  为了防止alert html code
        if (null != request.getHeader("X-Requested-With")) {
            if (null != status) {
                Writer writer = response.getWriter();
                writer.write(Constants.getText(/*"message.common.03"*/status));
                writer.flush();
                writer.close();
                return false;
            }
        } else {
            if (null != status) {
                String appCome = request.getParameter("appCome"); //判斷是否 是 手機端登陸
                if (appCome != null && appCome.equals("appCome")) {
                    response.setStatus(888);
                } else {

                    response.sendRedirect(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/welcome.do?message=" + status);//message=sessionOut
                }
                return false;
            }
        }
        return true;// 只有返回true才会继续向下执行，返回false取消当前请求

    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        return false;
    }

    private String login(HttpServletRequest request, HttpServletResponse response, Subject subject) {

        HttpSession session = request.getSession(false);
        String status = null;
        //session超时
        if (session == null || null == session.getAttribute(Constants.LOGUSER)) {
            status = "message.common.03";
        } else {
            LoginBo loginBo = (LoginBo) SpringContextHelp.getBean("loginImpl");
            //獲取用戶信息是否修改
            String message = loginBo.userInterceptorCheck();
            if (message != null) {
                status = message;
            } else {


                boolean flag = false;
                log.info("当前访问的是" + request.getRequestURI());
                String URI = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1, request.getRequestURI().indexOf(".do")) + ".do";
                log.info("当前用户正在访问的 url => " + URI);
                log.info("subject.isPermitted(url);" + subject.isPermitted(URI));
                if (subject.isPermitted(URI)) {
                    flag = true;
                }
                if ("checkRole.do".equals(URI) || "getMenu.do".equals(URI) || "saveFilterData.do".equals(URI)) {
                    flag = true;
                }
                if (!flag) {
                    status = "message.common.03";
                }

            }
        }
        return status;

    }

}
