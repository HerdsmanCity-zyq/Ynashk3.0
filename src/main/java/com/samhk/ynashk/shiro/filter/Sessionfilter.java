package com.samhk.ynashk.shiro.filter;

import com.samhk.ynashk.util.Constants;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.support.RequestContext;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author:swye
 * @Description:
 * @Date:Create in 20:23 2019/6/16
 */
@Slf4j
public class Sessionfilter extends AccessControlFilter {
    /**
     * Returns <code>true</code> if the request is allowed to proceed through the filter normally, or <code>false</code>
     * if the request should be handled by the
     * {@link #onAccessDenied(ServletRequest, ServletResponse, Object) onAccessDenied(request,response,mappedValue)}
     * method instead.
     *
     * @param servletRequest     the incoming <code>ServletRequest</code>
     * @param servletResponse    the outgoing <code>ServletResponse</code>
     * @param mappedValue the filter-specific config value mapped to this filter in the URL rules mappings.
     * @return <code>true</code> if the request should proceed through the filter normally, <code>false</code> if the
     * request should be processed by this filter's
     * {@link #onAccessDenied(ServletRequest, ServletResponse, Object)} method instead.
     * @throws Exception if an error occurs during processing.
     */
    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object mappedValue) throws Exception {
        HttpServletRequest request = WebUtils.toHttp(servletRequest);
        HttpServletResponse response = WebUtils.toHttp(servletResponse);
        String url = getPathWithinApplication(servletRequest);


       if (url.contains(".do") || url.equals("/")){
           request.setAttribute("URI",request.getRequestURI());
           response.setCharacterEncoding("UTF-8");
           Constants.setObject(Constants.REQUESTCONTEXT,new RequestContext(request,servletRequest.getServletContext()));
           Constants.setObject(Constants.REQUEST, request);
           Constants.setObject(Constants.RESPONSE, response);
//        response.setHeader("Set-Cookie", "HTTPOnly=true;Secure=true");
           //保存排序
           request.setAttribute("order", request.getParameter("order"));
           request.setAttribute("orderBy", request.getParameter("orderBy"));
           if(!StringUtils.isEmpty(request.getParameter("resident_no"))){
               Constants.getSession().setAttribute("resident_no", request.getParameter("resident_no"));
           }
       }
        return true;
    }

    /**
     * Processes requests where the subject was denied access as determined by the
     * {@link #isAccessAllowed(ServletRequest, ServletResponse, Object) isAccessAllowed}
     * method.
     *
     * @param request  the incoming <code>ServletRequest</code>
     * @param response the outgoing <code>ServletResponse</code>
     * @return <code>true</code> if the request should continue to be processed; false if the subclass will
     * handle/render the response directly.
     * @throws Exception if there is an error processing the request.
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        return false;
    }
}
