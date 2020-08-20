package com.sample.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.service.AlramService;
import com.sample.vo.MoimAlram;
import com.sample.vo.MoimUser;

@Controller
@RequestMapping("/alram")
public class AlramController {

	@Autowired
	private AlramService alramService;
	
	/* 알람 관련 */
	
	// 관리자 -> 사용자 경고 추가
	@GetMapping("warning.do")
	public String warning(Model model, HttpSession httpSession, @RequestParam("userId") String userId) {
		
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setMessage("경고메시지 뭐라쓰지");
		moimAlram.setType("경고");
		moimAlram.setUserId(userId);
		
		alramService.addAlram(moimAlram);
		
		return "redirect:/test.do";
	}
	
	// 팔로우 알림 추가
	@GetMapping("follow.do")
	public String follow(Model model, HttpSession httpSession, @RequestParam("userId") String userId) {

		MoimUser user = (MoimUser) httpSession.getAttribute("LOGIN_USER");
		
		MoimAlram moimAlram = new MoimAlram();
		moimAlram.setMessage(user.getNickname() + "님이 팔로우하셨습니다.");
		moimAlram.setType("팔로우");
		moimAlram.setUserId(userId);
		moimAlram.setLoginUserId(user.getId());
		
		alramService.addAlram(moimAlram);
		
		return "";
	}
	
	// 알림 클릭 -> 삭제 후 다음 알림 뿌리기
	@GetMapping("read.do")
	@ResponseBody
	public List<MoimAlram> show(@RequestParam("alramNo") long alramNo, @RequestParam("userId") String userId) {
		alramService.readAlram(alramNo);
		return alramService.getAlrams(userId);
	}
	
	
	
	/* 쪽지 관련 */
	@GetMapping("/message.do")
	@ResponseBody
	public Map<String, Object> messageUser(HttpSession session) {
		MoimUser user = (MoimUser) session.getAttribute("LOGIN_USER");
		
		Map<String, Object> messages = new HashMap<String, Object>();
		
		List<MoimAlram> sendMessages = alramService.sendMessages(user.getId());
		// 보낸 쪽지함
		/*model.addAttribute("sendMessages", sendMessages);*/
		messages.put("sendMessages", sendMessages);
		List<MoimAlram> receiveMessages = alramService.receiveMessages(user.getId());
		// 받은 쪽지함
		/*model.addAttribute("receiveMessages", receiveMessages);*/
		messages.put("receiveMessages", receiveMessages);
		
		
		return messages;
	}
}
