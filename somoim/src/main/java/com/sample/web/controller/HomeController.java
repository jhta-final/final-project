package com.sample.web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.dto.MoimMainDto;

import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.DetailViewMoimsDto;
import com.sample.service.AlramService;
import com.sample.service.HomeService;
import com.sample.service.MoimService;
import com.sample.vo.MoimFavoriteMoim;
import com.sample.vo.MoimUser;

@Controller
public class HomeController {

	@Autowired
	HomeService homeService;
	@Autowired
	MoimService moimService;
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
	
	// 키워드 검색 기능(타이틀, 내용, 지역, 메인카테고리 이름, 서브카테고리 이름)
	@PostMapping("/test.do")
	public String searchFunction(@RequestParam("keyword") String keyword,
			Model model){

		List<MoimMainDto> searchDto = homeService.getsearchFunction(keyword);
		model.addAttribute("cateMoims", searchDto);
		model.addAttribute("title", "search");

		return "form/test.tiles";
	}
	
	// 셀렉트 박스를 이용해서 검색
	@PostMapping("/test2.do")
	public String selectSearchFunction
			(@RequestParam(value="locationNo", required=false) long locationNo,
			@RequestParam(value="mainCateNo", required=false) long mainCateNo,	
			@RequestParam(value="subCateNo", required=false) long subCateNo,	
			Model model) {
		
		Map<String, Object> keyword = new HashMap<String, Object>();
		keyword.put("locationNo", locationNo);
		keyword.put("mainCateNo", mainCateNo);
		keyword.put("subCateNo", subCateNo);
		List<MoimMainDto> searchSelectBoxs = homeService.getselectSearchFunction(keyword);
		model.addAttribute("cateMoims", searchSelectBoxs);
		model.addAttribute("title", "search");
		
		return "form/test.tiles";
	}

	@GetMapping("/like.do")
	@ResponseBody
	public void increaseLikesMoim(HttpSession httpSession, @RequestParam("moimNo") long moimNo) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		homeService.increaseLikesMoim(moimNo, user.getId());
	}
	
	@GetMapping("/detail.do")
	@ResponseBody
	public DetailViewMoimsDto getDetailViewMoims(HttpSession httpSession, @RequestParam("moimNo") long moimNo) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		DetailViewMoimsDto detailViewMoimsDto = homeService.detailViewMoims(moimNo);
		MoimFavoriteMoim moimFavoriteMoim = homeService.getFavorite(moimNo, user.getId());
		
		if(moimFavoriteMoim == null) {
			detailViewMoimsDto.getMoimMainDto().setLikesYn("N");
		}else {
			detailViewMoimsDto.getMoimMainDto().setLikesYn("Y");
		}
		return detailViewMoimsDto;
	}
}
