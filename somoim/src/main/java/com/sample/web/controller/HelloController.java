package com.sample.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {

	@GetMapping("/")
	public String index() {
		return "form/index";
	}
	@GetMapping("/home.do")
	public String home() {
		return "main/main.tiles";
	}
}
