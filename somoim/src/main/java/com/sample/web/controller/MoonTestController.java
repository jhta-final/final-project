package com.sample.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoonTestController {

	@RequestMapping("/test.do")
	public String test() {
		return "manager/manager.tiles";
	}
	@RequestMapping("/test1.do")
	public String test1() {
		return "form/test.tiles";
	}
}
