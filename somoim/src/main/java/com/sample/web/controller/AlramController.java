package com.sample.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.service.AlramService;
import com.sample.vo.MoimAlram;

@Controller
@RequestMapping("/alram")
public class AlramController {

	@Autowired
	private AlramService alramService;
	
	// 관리자 -> 사용자 경고
	@GetMapping("warning.do")
	public String warning(Model model, HttpSession httpSession, @RequestParam("userId") String userId) {
		
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setMessage("경고메시지 뭐로하지");
		moimAlram.setType("경고");
		moimAlram.setUserId(userId);
		
		alramService.addAlram(moimAlram);
//		httpSession.setAttribute("alrams", alramService.getAlrams(userId));
		
		return "redirect:/test.do";
	}
	
	// 팔로우 알림
	@GetMapping("follow.do")
	public String follow(Model model) {
		return "";
	}
}
