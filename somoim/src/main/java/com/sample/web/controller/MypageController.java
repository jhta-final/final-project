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
	
	
	@GetMapping("/mypage.do")
	public String myPage1(HttpSession session, Model model) {
		this.user = (MoimUser)session.getAttribute("LOGIN_USER");
		List<MoimFollowDto> followers = mypageService.allFollower(user.getId());
		model.addAttribute("followers", followers);
		model.addAttribute("followersCnt", followers.size());
		
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
	public String modifyUser (@ModelAttribute("modifyform") ModifyForm modifyForm, HttpSession session) {
		
		BeanUtils.copyProperties(modifyForm, user);
		
		MultipartFile upfile = modifyForm.getUpfile();
		String filename = upfile.getOriginalFilename();
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
		
		user.setProfileImage(filename);
		
		session.setAttribute("LOGIN_USER", user);
		
		System.out.println(user);
		
		userService.modifyUser(user);
		return "redirect:/mypage/mypage.do?updatestatus=success";
	}
	
	// 회원탈퇴
	@PostMapping("/delete.do")
	public String deleteUser (@RequestParam("password")String password) {
		 if(password.equals(user.getPassword())) {
	         userService.deleteUser(user.getId());
	         return "mypage/mypage.tiles";
	      } else {
	         return "mypage/mypage.tiles";         
	      }
	}
	
	// 쪽지합
	@GetMapping("/message.do")
	@ResponseBody
	public Map<String, Object> messageUser() {
		Map<String, Object> messages = new HashMap<String, Object>();
		
		//List<MoimAlram> sendMessages = alramService.sendMessages(user.getId());
		// 보낸 쪽지함
		/*model.addAttribute("sendMessages", sendMessages);*/
		//messages.put("sendMessages", sendMessages);
		//List<MoimAlram> receiveMessages = alramService.receiveMessages(user.getId());
		// 받은 쪽지함
		/*model.addAttribute("receiveMessages", receiveMessages);*/
		//messages.put("receiveMessages", receiveMessages);
		
		
		return messages;
	}
}
