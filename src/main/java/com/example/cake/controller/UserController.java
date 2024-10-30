package com.example.cake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import com.example.cake.domain.User;
import com.example.cake.repository.UserRepository;
import com.example.cake.service.UserService;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
	public final UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/admin/user")
	public String getUsePage(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("Users", users);
		return "admin/user/table-user";
	}

	@RequestMapping("/admin/user/{id}")
	public String getUserDetailPage(Model model, @PathVariable long id) {
		model.addAttribute("id", id);
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "admin/user/show";
	}

	// lấy trang user
	@RequestMapping("/admin/user/create")
	public String getCreateUsePage(Model model) {
		model.addAttribute("newUser", new User());
		// là cách Spring MVC cho phép
		// bạn thêm một đối tượng vào model. Model này sau đó sẽ được gửi tới view
		// (trang giao diện như JSP, Thymeleaf, v.v.).
		// model là một đối tượng của lớp Model được Spring cung cấp, nó đóng vai
		// trò như một container để chứa dữ liệu mà controller muốn gửi cho view.
		// new User() là một đối tượng của lớp User. Đây là đối tượng bạn khởi
		// tạo và thêm vào model. Nó có thể là một POJO (Plain Old Java Object)
		// đại diện cho thông tin của người dùng mới. Đối tượng này sẽ chứa các
		// trường thông tin như username, password, v.v.
		return "admin/user/create";
	}

	@RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
	public String createUser(Model model, @ModelAttribute("newUser") User newUser) {
		System.out.println(newUser);
		userService.handleSaveUser(newUser);
		return "redirect:/admin/user";
	}

	@RequestMapping("/admin/user/update/{id}")
	public String getUpdateUsePage(Model model, @PathVariable long id) {
		User currentUser = userService.getUserById(id);
		model.addAttribute("newUser", currentUser);
		return "admin/user/update";
	}

	@RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
	public String updateUser(Model model, @ModelAttribute("newUser") User newUser) {
		User currentUser = userService.getUserById(newUser.getId());
		currentUser.setAddress(newUser.getAddress());
		currentUser.setPhoneNumber(newUser.getPhoneNumber());
		currentUser.setFullName(newUser.getFullName());
		userService.handleSaveUser(currentUser);
		return "redirect:/admin/user";
	}

	@RequestMapping("/admin/user/delete/{id}")
	public String getDeleteUsePage(Model model, @ModelAttribute("newUser") User newUser, @PathVariable long id) {
		User user = new User();
		user.setId(id);
		model.addAttribute("newUser", user);
		
		return "admin/user/delete";
	}

	@RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
	public String deleteUser(Model model, @ModelAttribute("newUser") User newUser) {
		userService.deleteUserById(newUser.getId());
		return "redirect:/admin/user";
	}

}
