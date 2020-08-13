package com.sample.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.MypageService;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	private MoimUser user = new MoimUser();
	
	
	@GetMapping("/profile.do")
	public String myPage1(HttpSession session, Model model) {
		this.user = (MoimUser)session.getAttribute("LOGIN_USER");
		List<MoimFollow> followers = mypageService.getAllFollower(user.getId());
		model.addAttribute("followers", followers);
		
		return "";
	}
	
	// 가입한모임
	@GetMapping("/usermoim.do")
	@ResponseBody
	public List<MoimJoinUserMoimDto> joinMoims (){
		
		return mypageService.getAllJoinMoims(user.getId());
	}
	
	// 작성글
	@GetMapping("/board.do")
	@ResponseBody
	public List<MoimBoard> userBoards (){
		
		return null;
	}
}
