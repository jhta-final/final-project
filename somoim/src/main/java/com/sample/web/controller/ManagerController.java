package com.sample.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.AlramService;
import com.sample.service.WarningService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimUser;
import com.sample.vo.MoimWarning;

@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired
	private WarningService warningService;
	
	@Autowired
	private AlramService alramService;
	
	// 사용자 신고 리스트 뿌리기
	@GetMapping("show.do")
	public String show(Model model) {
		model.addAttribute("userList", warningService.getWarningsForManager());
		
		return "manager/manager.tiles";
	}
	
	// 사용자 신고 상세보기
	@GetMapping("detail.do")
	@ResponseBody
	public List<MoimWarning> detail(Model model, @RequestParam("userId") String userId) {
		return warningService.getWarningsByUserId(userId);
	}
	
	// 사용자 신고 상세 삭제하기
	@GetMapping("delete.do")
	@ResponseBody
	public void delete(@RequestParam("warningNo") long warningNo) {
		warningService.deleteWarning(warningNo);
	}
	
	// 유저한테 경고 보내기
	@GetMapping("warning.do")
	@ResponseBody
	public void warning(HttpSession httpSession, @RequestParam("userId") String userId) {
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setUserId(userId);
		moimAlram.setType("경고");
		moimAlram.setMessage("경고를 받으셨습니다.");
		
		alramService.addAlram(moimAlram);
	}
	
	// 유저 계정 정지/해제
	@GetMapping("account.do")
	@ResponseBody
	public void account(@RequestParam("userId") String userId, @RequestParam("status") String status) {
		warningService.changeStatus(userId, status);
	}
}
