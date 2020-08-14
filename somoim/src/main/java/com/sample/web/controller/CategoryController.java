package com.sample.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.CategoryService;

@Controller
@RequestMapping("/cate")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
}
