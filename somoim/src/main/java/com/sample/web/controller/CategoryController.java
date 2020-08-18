package com.sample.web.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.dto.MoimFriends;
import com.sample.dto.MoimMainDto;
import com.sample.service.CategoryService;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/cate")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/test.do")
	public String test(HttpSession httpSession) {
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		List<MoimMainDto> list = categoryService.getMoimsByMainCategory(1);
		
		for(MoimMainDto m : list) {
			List<MoimUser> users = categoryService.getFollowsByMoim(new MoimFriends(m.getMoimNo(), user.getId()));
			m.setFriends(users);
			
			List<MoimUser> u = m.getFriends();
			for(MoimUser uu : u) {
				System.out.println(uu.getId());
			}
		}
		return "";
	}
}
