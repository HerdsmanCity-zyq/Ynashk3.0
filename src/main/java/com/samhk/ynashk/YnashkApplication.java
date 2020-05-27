package com.samhk.ynashk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.samhk.ynashk.mapper")
public class YnashkApplication {

    public static void main(String[] args) {
        SpringApplication.run(YnashkApplication.class, args);
    }

}
