package com.samhk.ynashk.util;


import com.samhk.ynashk.exception.UpdateStatusException;

public class UpdateStatusUtil {
    public static void isTrue(boolean expression, String error){
        if(!expression) {
            throw new UpdateStatusException(error);
        }
    }
}
