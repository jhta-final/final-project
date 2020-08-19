package com.sample.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sample.service.AlramService;
import com.sample.service.HomeService;
import com.sample.vo.MoimUser;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;
	@Autowired
	private AlramService alramService;
	
	@GetMapping("/home.do")
	public String getAllMoims(Model model, HttpSession httpSession) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");

		// 모든 카테고리 랜덤 모임 표시
		httpSession.setAttribute("allMoims", homeService.getAllMoims());
		
		// 지역별 선호 모임 랜덤 표시
		model.addAttribute("locationMoims", homeService.getlocationMoims(user.getLocationNo()));
		
		// 좋아요순으로 모임 랜덤 표시
		model.addAttribute("favoliteMoims", homeService.getFavoliteMoims());
		
		// 메안카테고리 랜덤표시
		model.addAttribute("mainCategoryMoims", homeService.getMainCategoryMoims());
		
		// 가입한 모임 표시
		//model.addAttribute("joinedMoim", homeService.getjoinedMoim(user.getId()));
		httpSession.setAttribute("joinedMoim", homeService.getjoinedMoim(user.getId()));
		
		// 내 친구 보기
		//model.addAttribute("followUsers", homeService.getfollowUsers(user.getId()));
		httpSession.setAttribute("followUsers", homeService.getfollowUsers(user.getId()));
		
		// 좋아요한 모임 표시
		httpSession.setAttribute("selectMoim", homeService.getselectMoim(user.getId()));
		
		// 알람서비스
		httpSession.setAttribute("alrams", alramService.getAlrams(user.getId()));
		
		return "main/main.tiles";
	} 
}
