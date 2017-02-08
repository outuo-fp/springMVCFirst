package com.fp.ssm.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fp.ssm.service.TableIpService;



@Controller
public class TestController {

	@Resource
	TableIpService service;
	
	@RequestMapping(value = "hello")
	public String helloTest(){
		
		Integer temp=9;
		temp = 10;
		
		return "test";
	}
	
}
