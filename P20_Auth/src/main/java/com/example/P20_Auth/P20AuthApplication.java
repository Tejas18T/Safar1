package com.example.P20_Auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class P20AuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(P20AuthApplication.class, args);
	}

}
