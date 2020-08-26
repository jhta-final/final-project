package com.sample.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.AlramService;
import com.sample.service.MypageService;
import com.sample.service.UserService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimBoard;
import com.sample.vo.MoimPhoto;
import com.sample.vo.MoimUser;
import com.sample.web.form.ModifyForm;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AlramService alramService;
	
	private MoimUser user = new MoimUser();
	
	@ModelAttribute("followers")
	public List<MoimFollowDto> getFollower(HttpSession session) {
		this.user = (MoimUser)session.getAttribute("LOGIN_USER");
		
		return mypageService.allFollower(user.getId());
	}
	
	// 마이페이지 메인화면
	@GetMapping("/mypage.do")
	public String myPage(Model model) {
		List<MoimFollowDto> followings = mypageService.allFollowing(user.getId());
		model.addAttribute("followingsCnt", followings.size());
		
		return "mypage/mypage.tiles";
	}
	
	// 가입한모임
	@GetMapping("/usermoim.do")
	public String joinMoims(Model model){
		model.addAttribute("joinmoim", mypageService.allJoinMoims(user.getId()));
		
		return "mypage/joinMoim.tiles";
	}
	
	// 작성글
	@GetMapping("/board.do")
	public String userBoards(Model model) {
		model.addAttribute("boards", mypageService.boardsByUser(user.getId()));
		return "mypage/myBoard.tiles";
	}
	
	// 올린사진
	@GetMapping("/photo.do")
	public String userPhotos (Model model) {
		model.addAttribute("photos", mypageService.photosByUser(user.getId()));
		return "mypage/myPhoto.tiles";
	}
	
	// 내정보수정
	@PostMapping("/modify.do")
	public String modifyUser (@ModelAttribute("modifyform") ModifyForm modifyForm, HttpSession session) {		
		BeanUtils.copyProperties(modifyForm, user);
		
		MultipartFile upfile = modifyForm.getUpfile();
		String filename = "";
		if (upfile.isEmpty()) {
			filename = "profile.png";
		} else {
			filename = upfile.getOriginalFilename();
			System.out.println(filename);
			
			File file = new File("C:\\final_project\\workspace\\somoim\\src\\main\\webapp\\resources\\profileImage\\"+filename);
			FileOutputStream fos;
			try {
				file.createNewFile();
				fos = new FileOutputStream(file);
				fos.write(upfile.getBytes());
				fos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		user.setProfileImage(filename);
		
		session.setAttribute("LOGIN_USER", user);		
		userService.modifyUser(user);
		
		return "redirect:/mypage/mypage.do?updatestatus=success";
	}
	
	// 회원탈퇴 비번확인
	@PostMapping("/checkpwd.do")
	@ResponseBody
	public boolean deletePwdCheck (@RequestParam("password")String password) {
		System.out.println(password);
		 if(password.equals(user.getPassword())) {
	         return true;
	      } else {
	         return false;         
	      }
	}
	
	// 회원탈퇴
	@GetMapping("/userdelete.do")
	public String deleteUser (HttpSession session) {
		userService.deleteUser(user.getId());
		session.invalidate();
		return "redirect:/"; 
	}
}
