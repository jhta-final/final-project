package com.sample.web.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.dto.MoimMainDto;
import com.sample.service.CategoryService;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/cate")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/test.do")
	public String test() {
		
		List<MoimMainDto> list = categoryService.getMoimsByMainCategory(1);
		
		for(MoimMainDto m : list) {
			System.out.println(m.getMoimNo());
			List<MoimUser> users = m.getFriends();
			for(MoimUser u : users) {
				System.out.println(u.getName());
			}
		}
		return "";
	}
}
