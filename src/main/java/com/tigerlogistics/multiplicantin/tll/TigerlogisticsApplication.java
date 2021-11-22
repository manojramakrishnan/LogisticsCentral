package com.tigerlogistics.multiplicantin.tll;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.tigerlogistics.multiplicantin.tll.DAO")
public class TigerlogisticsApplication {

	
	
	public static void main(String[] args) {
		SpringApplication.run(TigerlogisticsApplication.class, args);
	
		
	}

}
