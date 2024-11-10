package com.example.cake.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.cake.domain.Product;
import com.example.cake.domain.User;

@Controller
public class ProuctController {

    @GetMapping("/admin/product")
    public String getProduct() {
        return "/admin/product/view";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }
}
