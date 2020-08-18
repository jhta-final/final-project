package com.sample.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.MoimService;
import com.sample.service.MypageService;
import com.sample.service.UserService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimMessage;
import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/friend")
public class FriendsPageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MoimService moimService;
	
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
		
		// 쪽지보내기
		@PostMapping("/sendmessage.do")
		public String sendMessage(@ModelAttribute("messageForm") MoimMessage message) {
			// 메세지 인서트
			mypageService.AddMessage(message);
			// 알람 인서트
			MoimAlram alram = new MoimAlram();
			alram.setType("쪽지");
			alram.setUserId(message.getFromUser());
			alram.setMessage(message.getToUser()+"님이 쪽지를 보내셨습니다.");
			mypageService.AddAlram(alram);
			return "friend/info.tiles";
		}
		
		// 팔로우하기
		@PostMapping("/addfollow.do")
		public String addFollow(@ModelAttribute("follow") MoimFollow follow) {
			// 팔로우 추가하기
			mypageService.addFollower(follow);
			// 알람 인서트
			MoimAlram alram = new MoimAlram();
			alram.setType("팔로우");
			alram.setMessage(follow.getUserId()+"님이 팔로우 신청을 하였습니다.");
			alram.setUserId(follow.getFolUserId());
			mypageService.AddAlram(alram);
			
			return "friend/info.tiles";
		}
		
		// 모임초대하기
		@PostMapping("/invitemoim.do")
		public String inviteMoim(@ModelAttribute("message") MoimMessage message, Model model) {
			// 내가 개설한 모임의 제목, 번호 찾기 (혹은 다 찾기)
			// List<moimUser> users = moimService.findAdmin(message.gettoUser());
			/* if (users.isEmpty()) {
			 * return "friend/info.tiles?error=fail"
			 * } else {
			 * model.addAttribute("moim",users);
			 * }
			 */
			MoimAlram alram = new MoimAlram();
			alram.setType("모임초대");
			alram.setMessage(message.getToUser()+"님이 모임초대를 하였습니다.");
			alram.setUserId(message.getFromUser());
			
			return "friend/info.tiles";
		}
		
		
}
