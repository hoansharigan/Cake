package com.example.cake;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// tắt đi security 
// include >< exclude bao gồm >< loại bỏ 

// dòng code bên bên dưới có nghĩa là loại bỏ class security đi , khi truy cập vào trang
// web thì không cần đăng nhập vào
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class CakeApplication {

	public static void main(String[] args) {
		SpringApplication.run(CakeApplication.class, args);
	}

}
