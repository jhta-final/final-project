package com.sample.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sample.dto.MoimFollowDto;
import com.sample.dto.MoimJoinUserMoimDto;
import com.sample.service.MypageService;
import com.sample.service.UserService;
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
	
	private MoimUser user = new MoimUser();
	
	
	@GetMapping("/mypage.do")
	public String myPage1(HttpSession session, Model model) {
		this.user = (MoimUser)session.getAttribute("LOGIN_USER");
		List<MoimFollowDto> followers = mypageService.allFollower(user.getId());
		model.addAttribute("followers", followers);
		
		return "mypage/mypage.tiles";
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
	
	// 내정보수정
	@PostMapping("/modify.do")
	public String modifyUser (@ModelAttribute("modifyform") ModifyForm modifyForm) {
		MoimUser modifyUser = new MoimUser();
		modifyUser.setId(user.getId());
		BeanUtils.copyProperties(modifyForm, modifyUser);
		
		MultipartFile upfile = modifyForm.getUpfile();
		String filename = upfile.getOriginalFilename();
			
		File file = new File("C:\\final_project\\workspace\\somoim\\src\\main\\webapp\\resources\\profileImage"+filename);
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
		modifyUser.setProfileImage(filename);
		userService.modifyUser(modifyUser);
		return "mypage/mypage.tiles?modify=success";
	}
}
