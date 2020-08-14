package com.sample.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.MypageService;
import com.sample.service.UserService;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/friend")
public class FriendsPageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	UserService userService;
	
	private MoimUser user = new MoimUser();
	
	@GetMapping("/info.do")
	public String friendPage1(@RequestParam("userId") String foluserId, Model model) {
		this.user = userService.getUserDetail(foluserId);
		
		model.addAttribute("friendUser", user);
		
		return "friend/info.tiles";
	}
	
		// 가입한모임
		@GetMapping("/usermoim.do")
		@ResponseBody
		public List<MoimJoinUserMoimDto> joinMoims (){
			
			return mypageService.allJoinMoims(user.getId());
		}
		
		// 작성글
		@GetMapping("/board.do")
		@ResponseBody
		public List<MoimBoard> userBoards (){
			
			return mypageService.boardsByUser(user.getId());
		}
		
		// 올린사진
		@GetMapping("/photo.do")
		@ResponseBody
		public List<MoimPhoto> userPhotos () {
			
			return mypageService.photosByUser(user.getId());
		}
}
