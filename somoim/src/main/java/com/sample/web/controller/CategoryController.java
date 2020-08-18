package com.sample.web.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.dto.MoimMainDto;
import com.sample.service.CategoryService;

@Controller
@RequestMapping("/cate")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/test.do")
	public String test() {
		
		List<MoimMainDto> list = categoryService.getMoimsByMainCategory(1);
		for(MoimMainDto m : list) {
			System.out.println(m.getFriends());
		}
		
		return "";
	}
}
