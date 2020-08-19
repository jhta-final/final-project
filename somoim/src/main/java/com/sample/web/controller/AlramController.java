package com.sample.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sample.service.AlramService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/alram")
public class AlramController {

	@Autowired
	private AlramService alramService;
	
	// 관리자 -> 사용자 경고
	@GetMapping("warning.do")
	public String warning(Model model, HttpSession httpSession, @RequestParam("userId") String userId) {
		
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setMessage("경고메시지 .....");
		moimAlram.setType("경고");
		moimAlram.setUserId(userId);
		
		alramService.addAlram(moimAlram);
		
		return "redirect:/test.do";
	}
	
	// 팔로우 알림
	@GetMapping("follow.do")
	public void follow(Model model, HttpSession httpSession) {
		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		List<MoimAlram> alrams = alramService.getAlrams(user.getId());
		System.out.println(alrams);
		System.out.println("sss");
		for (MoimAlram alram : alrams) {
			System.out.println(alram.getContent());
		}
	}
}
