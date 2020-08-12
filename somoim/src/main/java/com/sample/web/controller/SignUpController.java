package com.sample.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.UserService;
import com.sample.vo.MoimUser;
import com.sample.web.form.SignUpForm;

@Controller
public class SignUpController {

	
	@Autowired
	UserService userService;
	
	SignUpForm signUpForm;
	
	@GetMapping("signup1.do")
	@ResponseBody
	public Map<String, String> step1Submit (@ModelAttribute("signUpForm") SignUpForm signUpForm1) {
		MoimUser user = userService.getUserDetail(signUpForm1.getId());
		Map<String, String> map = new HashMap<>();
		if(user != null) {
			map.put("status", "false");
			return map;
		}
		signUpForm.setId(signUpForm1.getId());
		signUpForm.setNickname(signUpForm1.getNickname());
		signUpForm.setPassword(signUpForm1.getPassword());
		signUpForm.setEmail(signUpForm1.getEmail());
		signUpForm.setTel(signUpForm1.getTel());
		signUpForm.setBirth(signUpForm1.getBirth());
		signUpForm.setGender(signUpForm1.getGender());
		signUpForm.setContent(signUpForm1.getContent());
		map.put("status", "true");
		return map;
	}
	
	@GetMapping("signup2.do")
	@ResponseBody
	public Map<String, String> step2Submit (@ModelAttribute("signUpForm") SignUpForm signUpForm2) {
		signUpForm.setMainCateNo(signUpForm2.getMainCateNo());
		Map<String, String> map = new HashMap<>();
		map.put("status", "true");
		return map;
	}
	
	@GetMapping("final.do")
	public String finalSubmit (@ModelAttribute("signUpForm") SignUpForm signUpForm3,HttpSession session) {
		signUpForm.setLocationNo(signUpForm3.getLocationNo());
		// insert
		MoimUser user = new MoimUser();
		
		// session.setAttribute("LOGIN_USER", user);
		return "redirect:/home.do?status=new";
	}
}
