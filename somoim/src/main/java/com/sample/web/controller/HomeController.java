package com.sample.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sample.service.HomeService;
import com.sample.vo.MoimUser;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;
	
	@GetMapping("/home.do")
	public String getAllMoims(Model model, HttpSession httpSession) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		model.addAttribute("allMoims", homeService.getAllMoims());
		model.addAttribute("locationMoims", homeService.getlocationMoims(user.getLocationNo()));
		
		return "redirect:home.do";
	} 
}
