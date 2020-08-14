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

		// 모든 모임 랜덤으로 표시하기
		model.addAttribute("allMoims", homeService.getAllMoims());
		
		// 모든 모임 지역 선호별로 표시하기
		model.addAttribute("locationMoims", homeService.getlocationMoims(user.getLocationNo()));
		
		// 모든 모임 좋아요별로 표시하기
		model.addAttribute("favoliteMoims", homeService.getFavoliteMoims());
		
		return "main/main.tiles";
	} 
}
