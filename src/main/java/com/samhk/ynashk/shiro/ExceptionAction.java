package com.samhk.ynashk.shiro;

import com.samhk.ynashk.util.MessageHandle;
import org.apache.shiro.session.UnknownSessionException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@ControllerAdvice
public class ExceptionAction {
    @Resource
    private MessageHandle messageHandle;

    @ExceptionHandler( UnknownSessionException.class)
    public String errorHandler(HttpServletRequest reqest,
                               HttpServletResponse response, Model model,Exception e) throws Exception {
        System.out.println("111");
        if (isAjax(reqest)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            //具体操作
            writer.write(messageHandle.getMessage("message.common.03"));
            //
            writer.flush();
            writer.close();
            return null;
        } else {
            String msg = messageHandle.getMessage("message.common.03");
            model.addAttribute("message", msg);
            return "login";
        }
    }

    @ExceptionHandler(IllegalStateException.class)
    public String errorHandler2(HttpServletRequest reqest,
                               HttpServletResponse response,Model model, Exception e) throws Exception {
        System.out.println("222");
        if (isAjax(reqest)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            //具体操作
            writer.write(messageHandle.getMessage("message.common.03"));
            //
            writer.flush();
            writer.close();
            return null;
        } else {
            String msg = messageHandle.getMessage("message.common.03");
            model.addAttribute("message", msg);
            return "login";
        }
    }

    /**
     * 判断是否是ajax请求
     */
    public static boolean isAjax(HttpServletRequest httpRequest) {
        return (httpRequest.getHeader("X-Requested-With") != null
                && "XMLHttpRequest"
                .equals(httpRequest.getHeader("X-Requested-With").toString()));
    }
}
