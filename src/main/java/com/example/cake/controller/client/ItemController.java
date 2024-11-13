package com.example.cake.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.cake.domain.Product;
import com.example.cake.service.ProductService;

@Controller
public class ItemController {

    ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products/{id}")
    public String getPageDetail( Model model ,@PathVariable long id) {
        Product product = productService.getProduct(id).get();
        model.addAttribute("product", product);
        return "/client/product/detail";
    }

    @GetMapping("/products")
    public String getPageProducts(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "/client/product/show";
    }

}
