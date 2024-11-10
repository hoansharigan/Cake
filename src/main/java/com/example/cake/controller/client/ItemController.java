package com.example.cake.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {

    @GetMapping("/products/{id}")
    public String getPageDetail(  @PathVariable long id) {
        return "/client/product/detail";
    }

}
