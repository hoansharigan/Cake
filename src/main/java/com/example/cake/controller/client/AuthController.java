package com.example.cake.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.cake.domain.User;
import com.example.cake.domain.dto.RegisterDTO;
import com.example.cake.service.UserService;

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
    public String getRegister(Model model, @ModelAttribute("registerUser") RegisterDTO registerUser) {
        User newUser = this.userService.RegisterDTOtoUser(registerUser);
        String hashPassWord = this.passwordEncoder.encode(newUser.getPassword());
        newUser.setPassword(hashPassWord);
        newUser.setRole(userService.getRoleByName("USER"));
        userService.handleSaveUser(newUser);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getPageLogin(Model model) {
        return "client/auth/register";
    }

}
