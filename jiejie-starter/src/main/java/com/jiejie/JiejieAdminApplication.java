package com.jiejie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Jiejie Admin 启动类
 */
@SpringBootApplication
@EnableScheduling
public class JiejieAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(JiejieAdminApplication.class, args);
    }
}
