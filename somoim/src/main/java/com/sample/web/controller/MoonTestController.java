package com.sample.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoonTestController {

	@RequestMapping("/test.do")
	public String test() {
		return "form/test.tiles";
	}
}
