package com.sample.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.UserService;
import com.sample.vo.MoimUser;
import com.sample.vo.MoimUserCate;
import com.sample.web.form.SignUpForm;

@Controller
@RequestMapping("/login")
public class SignUpController {

	
	@Autowired
	UserService userService;
	
	private SignUpForm signUpForm = new SignUpForm();
	
	@PostMapping("/check.do")
	@ResponseBody
	public Map<String, String> checkId (@RequestBody String userId) {
		MoimUser user = userService.getUserDetail(userId);
		Map<String, String> map = new HashMap<>();
		if(user != null) {
			map.put("status", "false");
		}
		return map;
	}
	
	@PostMapping("/signup1.do")
	@ResponseBody
	public Map<String, String> step1Submit (@RequestBody @Valid SignUpForm signUpForm1,
			BindingResult errors) {
		System.out.println("결과: " + signUpForm1);
		Map<String, String> map = new HashMap<>();
		if(errors.hasErrors()) {
			map.put("status", "false1");
			return map;
		}
		MoimUser user = userService.getUserDetail(signUpForm1.getId());
		if(user != null) {
			map.put("status", "false2");
			return map;
		}
		signUpForm.setId(signUpForm1.getId());
		signUpForm.setName(signUpForm1.getName());
		signUpForm.setNickname(signUpForm1.getNickname());
		signUpForm.setPassword(signUpForm1.getPassword());
		signUpForm.setEmail(signUpForm1.getEmail());
		signUpForm.setTel(signUpForm1.getTel());
		signUpForm.setBirth(signUpForm1.getBirth());
		signUpForm.setGender(signUpForm1.getGender());
		signUpForm.setContent(signUpForm1.getContent());
		signUpForm.setLocationNo(signUpForm1.getLocationNo());
		map.put("status", "true");
		return map;
	}
	
	@GetMapping("/signup2.do")
	public String step2Submit (@ModelAttribute("signUpForm") SignUpForm signUpForm2, HttpSession session) {
		
		MoimUser user = new MoimUser();
		user.setId(signUpForm.getId());
		user.setName(signUpForm.getName());
		user.setNickname(signUpForm.getNickname());
		user.setPassword(signUpForm.getPassword());
		user.setEmail(signUpForm.getEmail());
		user.setTel(signUpForm.getTel());
		user.setBirthDate(signUpForm.getBirth());
		user.setGender(signUpForm.getGender());
		user.setContent(signUpForm.getContent());
		user.setLocationNo(signUpForm.getLocationNo());
		
		MoimUserCate userCate = new MoimUserCate();
		userCate.setUserId(signUpForm.getId());
		userCate.setMainCateNo(signUpForm2.getMainCateNo());
		
		userService.signUpUser(user, userCate);
		session.setAttribute("LOGIN_USER", user);
		return "redirect:/home.do?status=new";
	}
	
}
