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

import com.sample.dao.AlramDao;
import com.sample.dao.WarningDao;
import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.AlramService;
import com.sample.service.MoimService;
import com.sample.service.MypageService;
import com.sample.service.UserService;
import com.sample.service.WarningService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimFollow;
import com.sample.vo.MoimMessage;
import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimUser;
import com.sample.vo.MoimWarning;

@Controller
@RequestMapping("/other")
public class OtherpageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MoimService moimService;
	
	@Autowired
	WarningService warningService;
	
	@Autowired
	AlramService alramService;
	
	private MoimUser loginedUser = new MoimUser();
	private MoimFollow moimFollow = new MoimFollow();
	private int followYn;
	
	
	@GetMapping("/info.do")
	public String friendPage(@RequestParam("userId") String foluserId, Model model, HttpSession session) {
		this.loginedUser = (MoimUser)session.getAttribute("LOGIN_USER");
		MoimUser otherUser = userService.getUserDetail(foluserId);
		List<MoimFollowDto> followers = mypageService.allFollower(foluserId);
		List<MoimFollowDto> followings = mypageService.allFollowing(foluserId);
		
		MoimFollow moim = new MoimFollow();
		moim.setFolUserId(foluserId);
		moim.setUserId(loginedUser.getId());
		this.moimFollow = moim;
		this.followYn = mypageService.followYn(moimFollow);
		
		model.addAttribute("followerYN", this.followYn);
		model.addAttribute("otherUser", otherUser);
		model.addAttribute("followerCnt", followers.size());
		model.addAttribute("followingCnt", followings.size());
		
		return "other/info.tiles";
	}
		// 가입한모임
		@GetMapping("/usermoim.do")
		public Map<String, Object> joinMoims (){
			Map<String, Object> infos = new HashMap<String, Object>();
			
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
		@ResponseBody
		public boolean sendMessage(@RequestParam("content") String content,
				@RequestParam("title") String title) {
			MoimMessage message = new MoimMessage(title, content, moimFollow.getUserId(), moimFollow.getFolUserId());
			MoimAlram alram = new MoimAlram(moimFollow.getUserId() + "님이 메세지를 보냈습니다.", "메세지", moimFollow.getFolUserId(), moimFollow.getUserId());
			try {
				alramService.addMessage(message);
				alramService.addAlram(alram);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
		
		// 팔로우하기
		@GetMapping("/addfollow.do")
		public String addFollow() {
			// 팔로우 추가하기
			mypageService.addFollower(moimFollow);
			// 알람 인서트
			MoimAlram alram = new MoimAlram(moimFollow.getUserId() + "님이 팔로우 했습니다.", "팔로우",
					moimFollow.getFolUserId(), moimFollow.getUserId());
			alramService.addAlram(alram);
			
			return "redirect:info.do?userId="+ moimFollow.getFolUserId();
		}
		
		// 팔로우취소하기
		@GetMapping("/deletefollow.do")
		public String deleteFollow() {
			
			// 팔로우테이블 삭제
			mypageService.deleteFollower(moimFollow);
			
			return "redirect:info.do?userId="+ moimFollow.getFolUserId();
		}
		
		// 신고하기
		@PostMapping("/warning.do")
		@ResponseBody
		public boolean warningUser(@RequestParam("text") String text) {
			try {
				MoimWarning warningUser = new MoimWarning();
				warningUser.setContent(text);
				warningUser.setType("유저");
				warningUser.setLoginUserId(moimFollow.getUserId());
				warningUser.setUserId(moimFollow.getFolUserId());
				
				warningService.addWarning(warningUser);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
		
}
