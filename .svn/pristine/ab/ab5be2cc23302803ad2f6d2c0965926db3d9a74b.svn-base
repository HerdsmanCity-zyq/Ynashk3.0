package com.samhk.ynashk.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class MessageHandle {
    private static Logger log = LoggerFactory.getLogger(MessageHandle.class);

     @Autowired
     private MessageSource messageSource;




    public  String getMessage(String result) {
        String message = "";
        try {
            Locale locale = LocaleContextHolder.getLocale();
            message = messageSource.getMessage(result, null, locale);
        } catch (Exception e) {
            log.error("parse message error! ", e);
            message = "parse message error! ";
        }
        return message;
    }

}
