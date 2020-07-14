package com.pet.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pet.model.product.ProductService;

@Controller
public class MainController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/", method= RequestMethod.GET)
	public String main(Model model) {
		System.out.println("main called !!");
		  List productList = productService.selectAll();
		  model.addAttribute("productList" , productList);
		return "main";
	}
	
}







