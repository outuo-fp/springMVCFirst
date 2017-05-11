package com.fp.ssm.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
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
	//contentType:'application/json;charset=utf-8',
	@RequestMapping(value = "findone")
	public  @ResponseBody String findTestone(@RequestParam(value ="id",defaultValue = "1")  Integer id) throws  JsonMappingException, IOException{
		
		
		TableIpEx tableIpEx =service.findTest(id);
		ObjectMapper mapper = new ObjectMapper();   
        String json = mapper.writeValueAsString(tableIpEx); 
	//	model.addAttribute("tableIpEx", tableIpEx);
		//@ResponseBody将itemsCustom转成json输出 TableIp
		return json;
	}
	
	@RequestMapping(value = "find")
	public  @ResponseBody String findTest(TableIpShowVo tableIpshowVo) throws  JsonMappingException, IOException{
		
		
		TableIpEx tableIpEx =service.findTest(tableIpshowVo.getTableIp().getId());
		ObjectMapper mapper = new ObjectMapper();   
        String json = mapper.writeValueAsString(tableIpEx); 
	//	model.addAttribute("tableIpEx", tableIpEx);
		//@ResponseBody将itemsCustom转成json输出 TableIp
		return json;
	}
	
	
}
