package com.sample.web.controller;

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

import com.sample.dto.MoimMainDto;
import com.sample.service.MoimService;
import com.sample.web.form.MoimForm;

@Controller
@RequestMapping("/moim")
public class MoimController {

	@Autowired
	private MoimService moimService;
	
	// 새 모임 등록
	@PostMapping("/add.do")
	public String addMoim(@ModelAttribute("moimForm") @Valid MoimForm moimForm) throws Exception {
		
		MoimMainDto moimMainDto = new MoimMainDto();
		
		BeanUtils.copyProperties(moimForm, moimMainDto);
//		moimService.addNewMoim(moimMainDto);
		
		
		moimMainDto = moimService.getMoimByNo(50019);
		System.out.println(moimMainDto.getUserId());
		
		return "";
	}
	
	// 모임 정보 수정
	// moimNo ???
	@PostMapping("/modify.do")
	public String modifyMoim(@ModelAttribute("moimForm") @Valid MoimForm moimForm) throws Exception {
		MoimMainDto moimMainDto = new MoimMainDto();
		
		BeanUtils.copyProperties(moimForm, moimMainDto);
		moimService.modifyMoim(moimMainDto);
		
		return "";
	}
	
	// 모임 상세정보
	@GetMapping("/moim.do")
	public String detailMoim(@RequestParam("moimNo") long moimNo, Model model) {
		model.addAttribute("moim", moimService.getMoimByNo(moimNo));
		return "moim/moim.tiles";
	}
}
