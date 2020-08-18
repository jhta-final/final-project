package com.sample.web.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.dto.MoimDates;
import com.sample.dto.MoimFriends;
import com.sample.dto.MoimMainDto;
import com.sample.service.CategoryService;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/cate")
public class CategoryController {

	@Autowired
	private CategoryService categoryService;
	
	// 메인카테고리별 조회 & 가입된 친구 조회
	@GetMapping("/mainCate.do")
	public String mainCate(Model model, HttpSession httpSession, @RequestParam("mainCateNo") long mainCateNo) {
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		List<MoimMainDto> list = categoryService.getMoimsByMainCategory(mainCateNo);
		
		for(MoimMainDto moims : list) {
			List<MoimUser> users = categoryService.getFollowsByMoim(new MoimFriends(moims.getMoimNo(), user.getId()));
			moims.setFriends(users);
		}
		
		
		model.addAttribute("mainCateMoims", list);
		
		return "";
	}
	
	// 서브카테고리별 조회 & 가입된 친구 조회
	@GetMapping("/subCate.do")
	public String subCate(Model model, HttpSession httpSession, @RequestParam("subCateNo") long subCateNo) {
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		List<MoimMainDto> list = categoryService.getMoimsBySubCategory(subCateNo);
		
		for(MoimMainDto moims : list) {
			List<MoimUser> users = categoryService.getFollowsByMoim(new MoimFriends(moims.getMoimNo(), user.getId()));
			moims.setFriends(users);
		}
		
		model.addAttribute("subCateMoims", list);
		
		return "";
	}
	
	// 지역별 조회 & 가입된 친구 조회
	@GetMapping("/location.do")
	public String location(Model model, HttpSession httpSession, @RequestParam("locationNo") long locationNo) {
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		List<MoimMainDto> list = categoryService.getMoimsByLocation(locationNo);
		
		for(MoimMainDto moims : list) {
			List<MoimUser> users = categoryService.getFollowsByMoim(new MoimFriends(moims.getMoimNo(), user.getId()));
			moims.setFriends(users);
		}
		
		model.addAttribute("locationMoims", list);
		
		return "";
	}
	
	// 날짜별 조회 & 가입된 친구 조회
	// 안될수도
	@GetMapping("/dates.do")
	public String dates(Model model, HttpSession httpSession, @RequestParam("startDate") Date startDate,
															  @RequestParam("endDate") Date endDate) {
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		List<MoimMainDto> list = categoryService.getMoimsByDate(new MoimDates(startDate, endDate));
		
		for(MoimMainDto moims : list) {
			List<MoimUser> users = categoryService.getFollowsByMoim(new MoimFriends(moims.getMoimNo(), user.getId()));
			moims.setFriends(users);
		}
		
		model.addAttribute("datesMoims", list);
		
		return "";
	}
	
	// 좋아요 순 조회 & 가입된 친구 조회
	@GetMapping("likes.do")
	public String likes(Model model, HttpSession httpSession) {
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		List<MoimMainDto> list = categoryService.getMoimsByLikes();
		
		for(MoimMainDto moims : list) {
			List<MoimUser> users = categoryService.getFollowsByMoim(new MoimFriends(moims.getMoimNo(), user.getId()));
			moims.setFriends(users);
		}
		
		model.addAttribute("likesMoims", list);
		
		return "";
	}
}
