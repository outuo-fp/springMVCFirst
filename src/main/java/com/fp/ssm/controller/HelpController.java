package com.fp.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {

	@RequestMapping(value = "items")
	public String helloWorld(){
		return "items";
	}
	
}
