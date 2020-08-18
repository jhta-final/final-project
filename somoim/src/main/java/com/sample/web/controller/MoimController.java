package com.sample.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.MoimMainDto;
import com.sample.service.CategoryService;
import com.sample.service.MoimService;
import com.sample.service.SubMoimService;
import com.sample.vo.MoimSubCate;
import com.sample.vo.MoimSubMoim;
import com.sample.vo.MoimUser;
import com.sample.web.form.MoimForm;
import com.sample.web.form.SubMoimForm;

@Controller
@RequestMapping("/moim")
public class MoimController {

	@Autowired
	private MoimService moimService;
	
	@Autowired
	private SubMoimService subMoimService;
	
	@Autowired
	private CategoryService categoryService;
	
	// 새 모임 등록
	@PostMapping("/add.do")
	public String addMoim(@ModelAttribute("moimForm") @Valid MoimForm moimForm) throws Exception {
		
		MoimMainDto moimMainDto = new MoimMainDto();
		BeanUtils.copyProperties(moimForm, moimMainDto);
		System.out.println(moimMainDto.getPremiumYn());
		moimService.addNewMoim(moimMainDto);
		
		return "redirect:moim.do?moimNo=" + moimMainDto.getMoimNo();
	}
	
	// 새 모임 등록 페이지
	@GetMapping("/add.do")
	public String createMoim(Model model, HttpSession httpSession) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		model.addAttribute("longinedUser", user.getId());
		
		model.addAttribute("moimForm", new MoimForm());
		
		return "moim/moimCreate.tiles";
	}
	
	// 모임등록 세부 카테고리
	@GetMapping("/subCate.do")
	@ResponseBody
	public List<MoimSubCate> getSubCate(@RequestParam("mainCateNo") long mainCateNo) {
		System.out.println(mainCateNo);
		return categoryService.getSubCates(mainCateNo);
	}
	
	// 모임 정보 수정
	@GetMapping("/modify.do")
	public String modify(Model model, HttpSession httpSession, @RequestParam("moimNo") long moimNo) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		model.addAttribute("moim", moimService.getMoimByNo(moimNo));
		model.addAttribute("loginedUser", user.getId());		
		model.addAttribute("moimForm", new MoimForm());
		model.addAttribute("moimNo", moimNo);
		return "moim/moimModify.tiles";
	}
	
	// 모임 정보 수정
	@PostMapping("/modify.do")
	public String modifyMoim(@ModelAttribute("moimForm") @Valid MoimForm moimForm, @RequestParam("moimNo") long moimNo) throws Exception {
		MoimMainDto moimMainDto = moimService.getMoimByNo(moimNo);
		
		BeanUtils.copyProperties(moimForm, moimMainDto);
		moimService.modifyMoim(moimMainDto);
		
		return "redirect:moim.do?moimNo=" + moimNo;
	}
	
	// 모임 상세정보
	@GetMapping("/moim.do")
	public String detailMoim(@RequestParam("moimNo") long moimNo, Model model, HttpSession httpSession) {
		model.addAttribute("moim", moimService.getMoimByNo(moimNo));
		model.addAttribute("submoims", subMoimService.getAllSubMoims(moimNo));
		model.addAttribute("users", moimService.getAllJoinUsers(moimNo));

		model.addAttribute("subMoimForm", new SubMoimForm());
		
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		model.addAttribute("loginedUser", user.getId());
		model.addAttribute("role", moimService.getJoinUser(moimNo, user.getId()));
		
		return "moim/moim.tiles";
	}
	
	// 모임 삭제
	@GetMapping("delete.do")
	public String deleteMoim(@RequestParam("moimNo") long moimNo) {
		
		moimService.deleteMoim(moimNo);
		moimService.AllOutMoim(moimNo);
		
		return "redirect:/home.do";
	}
	
	// 모임 가입
	@GetMapping("join.do")
	public String joinMoim(@RequestParam("moimNo") long moimNo, @RequestParam("userId") String userId) {
		
		moimService.joinMoim(moimNo, userId);
		
		return "";
	}
	
	// 모임 탈퇴
	@GetMapping("out.do")
	public String outMoim(@RequestParam("moimNo") long moimNo, @RequestParam("userId") String userId) {
		
		moimService.outMoim(moimNo, userId);
		
		return "";
	}
}
