package com.fp.ssm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.ssm.common.PageParam;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
import com.fp.ssm.service.TableIpService;

@Controller
public class HelpController {
	@Resource
	TableIpService service;
	@RequestMapping(value = "items")
	public String helloWorld(Model model,HttpServletRequest request,TableIpShowVo tbipvo,@RequestParam(value = "page",required = false)Integer page){
		int currPage = 0;
		if (page == null) {
			currPage = 1;
			System.out.println("输出为空");
		}else{
			currPage = page;
		}
//		try {
//			currPage = Integer.parseInt(currPageStr);
//		} catch (Exception e) {
//		}
		
		// 获取总记录数
		int rowCount = service.getRowCount();
		PageParam pageParam = new PageParam();
		pageParam.setRowCount(rowCount);
		if (pageParam.getTotalPage() < currPage) {
			currPage = pageParam.getTotalPage();
		}
		int offset = (currPage - 1) * PageParam.pageSize ;
		int size = PageParam.pageSize;
		
		pageParam.setCurrPage(currPage);
		
		TableIpShowVo tbvo = new TableIpShowVo();
		tbvo.setOffset(offset);
		tbvo.setSize(size);
		List<TableIpEx> TbEx = service.getIpListByPage(tbvo);
		//tbipvo.setIpList(TbEx);
		
		//pageParam.setData(TbEx);
		
		//request.setAttribute("pageParam", pageParam);
		//request.setAttribute("tbList", TbEx);
		model.addAttribute("pageParam", pageParam);
		model.addAttribute("itemList", TbEx);
		return "items";
	}
	
}
