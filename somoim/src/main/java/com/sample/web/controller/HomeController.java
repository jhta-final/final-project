package com.sample.web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.dto.MoimMainDto;

import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.DetailViewMoimsDto;
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
		
		// 유저 아이디 넘기기
		model.addAttribute("loginedUser", user.getId());
		
		return "main/main.tiles";
	} 

	@GetMapping("/test.do")
	public String searchFunction(@RequestParam(value="title", required= false) String title,
			@RequestParam(value="content", required= false) String content, 
			@RequestParam(value="locationName", required= false) List<String> locationName,
			@RequestParam(value="mainCateName", required= false) List<String> mainCateName,
			@RequestParam(value="subCateName", required= false) List<String> subCateName,
			Model model){
		
		Map<String, Object> params = new HashMap<String, Object>();
		if(title != null && !title.isEmpty()) {
			params.put("title", title);
		}
		if(content != null && !content.isEmpty()) {
			params.put("content", content);
		}
		if(locationName != null && !locationName.isEmpty()) {
			params.put("locationName", locationName);
		}
		if(mainCateName != null && !mainCateName.isEmpty()) {
			params.put("mainCateName", mainCateName);
		}
		if(subCateName != null && !subCateName.isEmpty()) {
			params.put("subCateName", subCateName);
		}
		List<MoimMainDto> searchDto = homeService.getsearchFunction(params);
		model.addAttribute("searchDto", searchDto);
		return "redirect:/test.do";
	}
	
	@GetMapping("/detail.do")
	@ResponseBody
	public DetailViewMoimsDto getDetailViewMoims(@RequestParam("moimNo") long moimNo) {
		return homeService.detailViewMoims(moimNo);
	}
}
