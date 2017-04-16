package com.fp.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fp.ssm.service.TableIpService;



@Controller
public class FetchController {

	@Resource
	TableIpService service;
	
	@RequestMapping(value = "task")
	public String helloWorld(){
		return "task";
	}

	@RequestMapping(value = "get", method = RequestMethod.POST)
	public void get(HttpServletRequest request, HttpServletResponse response){
		String number = request.getParameter("num");
		String country = request.getParameter("country");
		String isp = request.getParameter("isp");
		
		String txt = service.findIp(number, country, isp);
		
		PrintWriter writer;
		try {
			response.setCharacterEncoding("GBK");
			writer = response.getWriter();
			writer.write(txt);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
