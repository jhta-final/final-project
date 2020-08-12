package com.sample.web.controller;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.MoimService;
import com.sample.vo.MoimMain;
import com.sample.web.form.MoimForm;

@Controller

@RequestMapping("/moim")
public class MoimController {

	@Autowired
	private MoimService moimService;
	
	// 새 모임 등록
	@PostMapping("/add.do")
	public String addMoim(@ModelAttribute("moimForm") @Valid MoimForm moimForm) throws Exception {
		
		MoimMain moimMain = new MoimMain();
		
		BeanUtils.copyProperties(moimForm, moimMain);
//		moimService.addNewMoim(moimMain);
		
		return "";
	}
	
	// 모임 정보 수정
	// moimNo ???
	@PostMapping("/modify.do")
	public String modifyMoim(@ModelAttribute("moimForm") @Valid MoimForm moimForm) throws Exception {
		MoimMain moimMain = new MoimMain();
		
		BeanUtils.copyProperties(moimForm, moimMain);
		moimService.modifyMoim(moimMain);
		
		return "";
	}
}
