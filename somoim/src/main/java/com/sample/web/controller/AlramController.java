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
	
	// 관리자 -> 사용자 경고 추가
	@GetMapping("warning.do")
	public String warning(Model model, HttpSession httpSession, @RequestParam("userId") String userId) {
		
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setMessage("경고메시지 뭐라쓰지");
		moimAlram.setType("경고");
		moimAlram.setUserId(userId);
		
		alramService.addAlram(moimAlram);
		
		return "redirect:/test.do";
	}
	
	// 팔로우 알림 추가
	@GetMapping("follow.do")
	public String follow(Model model, HttpSession httpSession, @RequestParam("userId") String userId) {

		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setMessage(user.getNickname() + "님이 팔로우하셨습니다.");
		moimAlram.setType("팔로우");
		moimAlram.setUserId(userId);
		moimAlram.setLoginUserId(user.getId());
		
		alramService.addAlram(moimAlram);
		
		return "";
	}
}
