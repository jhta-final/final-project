package com.sample.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.MoimService;
import com.sample.service.MypageService;
import com.sample.service.UserService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/other")
public class OtherpageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MoimService moimService;
	
	private MoimUser loginedUser = new MoimUser();
	private MoimFollow moimFollow = new MoimFollow();
	
	@GetMapping("/info.do")
	public String friendPage1(@RequestParam("userId") String foluserId, Model model, HttpSession session) {
		this.loginedUser = (MoimUser)session.getAttribute("LOGIN_USER");
		MoimUser otherUser = userService.getUserDetail(foluserId);
		List<MoimFollowDto> followers = mypageService.allFollower(foluserId);
		
		MoimFollow moim = new MoimFollow();
		moim.setFolUserId(foluserId);
		moim.setUserId(loginedUser.getId());
		this.moimFollow = moim;
		
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("followerCnt", followers.size());
		return "other/info.tiles";
	}
	
		// 가입한모임
		@GetMapping("/usermoim.do")
		@ResponseBody
		public Map<String, Object> joinMoims (){
			Map<String, Object> infos = new HashMap<String, Object>();
			long followYn = mypageService.followYn(moimFollow);
			List<MoimJoinUserMoimDto> moims = mypageService.allJoinMoims(moimFollow.getFolUserId());
			// 팔로우 상태일떄
			if(followYn == 1) {
				infos.put("status", "true");
				infos.put("joinmoim", moims);
			}
			// 팔로우 상태가 아닐때
			if(followYn == 0) {
				infos.put("status", "false");
			}
			return infos;
		}
		
		// 작성글
		@GetMapping("/board.do")
		@ResponseBody
		public Map<String, Object> userBoards (){
			Map<String, Object> infos = new HashMap<String, Object>();
			long followYn = mypageService.followYn(moimFollow);
			List<MoimBoard> boards = mypageService.boardsByUser(moimFollow.getFolUserId());
			// 팔로우 상태일떄
			if(followYn == 1) {
				infos.put("status", "true");
				infos.put("boards", boards);
			}
			// 팔로우 상태가 아닐때
			if(followYn == 0) {
				infos.put("status", "false");
			}
			return infos;
		}
		
		// 올린사진
		@GetMapping("/photo.do")
		@ResponseBody
		public Map<String, Object> userPhotos () {
			/*Map<String, Object> infos = new HashMap<String, Object>();
			long followYn = mypageService.followYn(moimFollow);
			//List<MoimPhoto> photos = mypageService.photosByUser(moimFollow.getFolUserId());
			// 팔로우 상태일떄
			if(followYn == 1) {
				infos.put("status", "true");
				infos.put("photos", photos);
			}
			// 팔로우 상태가 아닐때
			if(followYn == 0) {
				infos.put("status", "false");
			}*/
			return null;
		}
		
		// 쪽지보내기
		@PostMapping("/sendmessage.do")
		public String sendMessage(@ModelAttribute("messageForm") MoimAlram message) {
			// 메세지 인서트
			mypageService.AddMessage(message);
			// 알람 인서트
			MoimAlram alram = new MoimAlram();
			alram.setType("쪽지");
			alram.setUserId(message.getUserId());
			alram.setMessage(message.getLoginUserId()+"님이 쪽지를 보내셨습니다.");
			mypageService.AddAlram(alram);
			
			mypageService.AddMessage(message);
			return "other/info.tiles";
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
			
			return "other/info.tiles";
		}
		
		// 팔로우취소하기
		@PostMapping("/deletefollow.do")
		public String deleteFollow(@ModelAttribute("follow") MoimFollow follow) {
			
			// 팔로우테이블 삭제
			mypageService.deleteFollower(follow);
			
			return "other/info.tiles";
		}
		
}
