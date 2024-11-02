package com.example.cake.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProuctController {

    @GetMapping("/admin/product")
    public String getProduct() {
        return "/admin/product/view";
    }
}
