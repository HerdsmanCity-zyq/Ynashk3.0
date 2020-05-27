package com.samhk.ynashk;

import com.samhk.ynashk.util.AESUtil;
import org.junit.Test;

import java.util.Date;

public class JavaTest {

    @Test
    public void test(){
        Long date = System.currentTimeMillis();
        System.out.println(date);
        String ss = AESUtil.AESEncode("APP_LOGIN","test"+","+"123"+","+date);
        System.out.println("1:"+ss);
        String deS = AESUtil.AESDecode("APP_LOGIN",ss);
        System.out.println("2:"+deS);

    }

    @Test
    public void test1(){
        String s = "cl02100000163";
        s=s.substring(5,s.length());
        System.out.println(s);
        int i= Integer.parseInt(s);
        System.out.println(i);
    }
}
