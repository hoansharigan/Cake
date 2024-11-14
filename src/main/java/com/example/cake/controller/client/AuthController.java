package com.example.cake.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.cake.domain.User;
import com.example.cake.domain.dto.RegisterDTO;
import com.example.cake.service.UserService;

import jakarta.validation.Valid;

@Controller
public class AuthController {
    public final UserService userService;
    private PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String getPageRegister(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String getRegister(
            Model model, @ModelAttribute("registerUser") @Valid RegisterDTO registerUser,
            BindingResult bindingResult) {

        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
			return "client/auth/register";
		}
        User newUser = this.userService.RegisterDTOtoUser(registerUser);
        String hashPassWord = this.passwordEncoder.encode(newUser.getPassword());
        newUser.setPassword(hashPassWord);
        newUser.setRole(userService.getRoleByName("USER"));
        userService.handleSaveUser(newUser);
        return "redirect:/login";
        // redirect + đường dản URL còn return thì trỏ đến trang trong resource
    }

    @GetMapping("/login")
    public String getPageLogin(Model model) {
        return "/client/auth/login";
    }

}
