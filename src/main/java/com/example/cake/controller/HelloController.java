package com.example.cake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HelloController {
	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/admin/create")
	public String create() {
		return "/admin/create";
	}

}
