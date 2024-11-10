package com.example.cake.controller.admin;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

import com.example.cake.domain.Role;
import com.example.cake.domain.User;
import com.example.cake.service.UpLoadFileService;
import com.example.cake.service.UserService;

import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
	public final UserService userService;
	private final UpLoadFileService upLoadFileService;
	private PasswordEncoder passwordEncoder;

	public UserController(UserService userService, UpLoadFileService upLoadFileService,
			PasswordEncoder passwordEncoder) {
		this.userService = userService;
		this.upLoadFileService = upLoadFileService;
		this.passwordEncoder = passwordEncoder;
	}

	@RequestMapping("/admin/user")
	public String getUsePage(Model model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("Users", users);
		return "admin/user/show";
	}

	@RequestMapping("/admin/user/{id}")
	public String getUserDetailPage(Model model, @PathVariable long id) {
		model.addAttribute("id", id);
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "admin/user/detail";
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

	@PostMapping(value = "/admin/user/create")
	public String createUser(Model model,
			@ModelAttribute("newUser") User newUser,
			@RequestParam("hoidanitFile") MultipartFile file) {
		String avatar = this.upLoadFileService.handlSaveUploadFile(file, "avatar");
		// đoạn code dùng để lưu file ảnh
		String hashPassWord = this.passwordEncoder.encode(newUser.getPassword());
		newUser.setPassword(hashPassWord);
		newUser.setAvatar(avatar);
		newUser.setRole(userService.getRoleByName(newUser.getRole().getName()));
		userService.handleSaveUser(newUser);
		return "redirect:/admin/user";
	}

	@GetMapping("/admin/user/update/{id}")
	public String getUpdateUsePage(Model model, @PathVariable long id) {
		User currentUser = userService.getUserById(id);
		model.addAttribute("newUser", currentUser);
		String pathImage = upLoadFileService.getPathImg(currentUser);
		model.addAttribute("pathImage", pathImage);
		return "admin/user/update";
	}

	@PostMapping("/admin/user/update")
	public String updateUser(Model model, @ModelAttribute("newUser") User newUser,
			@RequestParam("newFile") MultipartFile file) {

		// Lấy thông tin user hiện tại
		User currentUser = this.userService.getUserById(newUser.getId());

		// Cập nhật thông tin từ form
		currentUser.setAddress(newUser.getAddress());
		currentUser.setPhoneNumber(newUser.getPhoneNumber());
		currentUser.setFullName(newUser.getFullName());
		currentUser.setAvatar(this.upLoadFileService.handlSaveUploadFile(file, "avatar"));

		// Kiểm tra và cập nhật Role
		if (newUser.getRole() != null && newUser.getRole().getName() != null) {
			Role role = userService.getRoleByName(newUser.getRole().getName());
			System.out.println(role); // Kiểm tra xem Role có đúng không
			currentUser.setRole(role);
		} else {
			System.out.println("Role is null");
		}

		// Lưu lại user đã cập nhật
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
