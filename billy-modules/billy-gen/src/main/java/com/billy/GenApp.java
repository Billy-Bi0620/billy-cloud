package com.billy;

import com.billy.system.annotation.EnableRyFeignClients;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.billy.*.mapper")
@EnableRyFeignClients
public class GenApp
{
    public static void main(String[] args)
    {
        SpringApplication.run(GenApp.class, args);
    }
}
