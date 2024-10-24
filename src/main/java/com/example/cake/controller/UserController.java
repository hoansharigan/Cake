package com.example.cake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.example.cake.domain.User;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	@GetMapping("/")
	public String index() {
		return "index";
	}

	// lấy trang user
	@RequestMapping("/admin/user")
	public String getUsePage(Model model) {
		model.addAttribute("newUser", new User());
		//là cách Spring MVC cho phép
		//  bạn thêm một đối tượng vào model. Model này sau đó sẽ được gửi tới view 
		//  (trang giao diện như JSP, Thymeleaf, v.v.).
		// model là một đối tượng của lớp Model được Spring cung cấp, nó đóng vai 
		// trò như một container để chứa dữ liệu mà controller muốn gửi cho view.
		// new User() là một đối tượng của lớp User. Đây là đối tượng bạn khởi 
		// tạo và thêm vào model. Nó có thể là một POJO (Plain Old Java Object)
		//  đại diện cho thông tin của người dùng mới. Đối tượng này sẽ chứa các
		//   trường thông tin như username, password, v.v.
		return "admin/user/create";
	}

	@RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
	public String createUser(Model model ,@ModelAttribute("newUser") User newUser) {
		System.out.println(newUser);
		return "index";
	}
}
