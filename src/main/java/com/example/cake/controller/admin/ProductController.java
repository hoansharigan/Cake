package com.example.cake.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.cake.domain.Product;
import com.example.cake.domain.Role;
import com.example.cake.domain.User;
import com.example.cake.service.ProductService;
import com.example.cake.service.UpLoadFileService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProductController {

    public final UpLoadFileService upLoadFileService;
    public final ProductService productService;

    public ProductController(UpLoadFileService upLoadFileService, ProductService productService) {
        this.upLoadFileService = upLoadFileService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("Products", products);
        return "/admin/product/view";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "/admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String CreateProduct(Model mode,
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newUserBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {
        // TODO: process POST request
        String img = this.upLoadFileService.handlSaveUploadFile(file, "product");
        // validate
        // in ra lỗi
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // nếu tạo không thành công có sẽ trả ra page create và không bị mất message lối
        // nếu sài redirect sẽ bị lỗi
        if (newUserBindingResult.hasErrors()) {
            return "admin/product/create";
        }
        // đoạn code dùng để lưu file ảnh
        newProduct.setImage(img);
        productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getPageDetailProduct(Model model, @PathVariable long id) {
        Product product = productService.getProduct(id).get();
        model.addAttribute("product", product);
        return "/admin/product/detail";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getPageDeleteProduct(Model model, @PathVariable long id) {
        Product product = productService.getProduct(id).get();
        model.addAttribute("product", product);
        return "/admin/product/delete";
    }

    @PostMapping("/admin/product/delete/{id}")
    public String DeleteProduct(Model model, @PathVariable long id) {
        // TODO: process POST request
        productService.deleteProduct(id);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getPageUpdateProduct(Model model, @PathVariable long id) {
        Product product = productService.getProduct(id).get();
        model.addAttribute("product", product);
        return "/admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("product") Product product,
            @RequestParam("newFile") MultipartFile file) {

        // Lấy thông tin user hiện tại
        Product currentProduct = this.productService.getProduct(product.getId()).get();

        // Cập nhật thông tin từ form
        currentProduct.setName(product.getName());
        currentProduct.setPrice(product.getPrice());
        currentProduct.setDetailDesc(product.getDetailDesc());
        currentProduct.setImage(this.upLoadFileService.handlSaveUploadFile(file, "product"));
        currentProduct.setShortDesc(product.getShortDesc());
        currentProduct.setQuantity(product.getQuantity());
        currentProduct.setSold(product.getSold());
        currentProduct.setFactory(product.getFactory());
        currentProduct.setTarget(product.getTarget());
        // Lưu lại user đã cập nhật
        productService.handleSaveProduct(currentProduct);
        return "redirect:/admin/product";
    }

}
