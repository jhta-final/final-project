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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String checkId (@RequestBody String userId) {
		MoimUser user = userService.getUserDetail(userId);
		if(user != null) {
			return "false";
		}
		return "true";
	}
	
	@PostMapping("/signup1.do")
	@ResponseBody
	public String step1Submit (@RequestBody @Valid SignUpForm signUpForm1,
			BindingResult errors) {
		System.out.println("결과: " + signUpForm1);
		/*if(errors.hasErrors()) {
			return "false";
		}*/
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
		return "true";
	}
	
	@RequestMapping(value="/signup2.do" , method = RequestMethod.GET)
	public String step2Submit (@RequestParam("cateno") long cateNo, HttpSession session) {
		
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
		userCate.setMainCateNo(cateNo);
		
		userService.signUpUser(user, userCate);
		session.setAttribute("LOGIN_USER", user);
		return "redirect:/home.do?status=new";
	}
	
}
