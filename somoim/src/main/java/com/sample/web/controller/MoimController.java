package com.sample.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.service.MoimService;
import com.sample.vo.MoimMain;

@Controller

@RequestMapping("/moim")
public class MoimController {

	@Autowired
	private MoimService moimService;
	
	@GetMapping("/detail.do")
	public String moimDetail() {
		MoimMain main = new MoimMain();
		main.setMoimNo(500015);
		main.setTitle("문화/공연/축제");
		main.setHeadCount(5);
		main.setContent("내용!");
		main.setSubCateNo(700023);
		main.setLocationNo(1);
		
		moimService.modifyMoim(main);
		return "list.do";
	}
}
