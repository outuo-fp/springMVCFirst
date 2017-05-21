package com.fp.ssm.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.ssm.common.PageParam;
import com.fp.ssm.dao.TbBomMapper;
import com.fp.ssm.dao.TbProjectMapper;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
import com.fp.ssm.po.TbBom;
import com.fp.ssm.po.TbBomEx;
import com.fp.ssm.po.TbProjectEx;
import com.fp.ssm.po.TbTask;
import com.fp.ssm.po.TbTaskEx;
import com.fp.ssm.po.TbViewVo;
import com.fp.ssm.service.TbOutuoService;
import com.fp.ssm.service.TbitemService;
import com.fp.ssm.service.TbuserService;

@Controller
public class ItemController {
	@Resource
	TbOutuoService tbOutuoService;
	@Resource 
	TbitemService tbitemService;
	@Resource
	TbuserService tbuserService;
	@RequestMapping(value = "items")
	public String helloWorld(Model model,HttpServletRequest request,TbViewVo tbProvo,@RequestParam(value = "page",required = false)Integer page){
		//String currPageStr = request.getParameter("page");
		int currPage = 0;
		if (page == null) {
			currPage = 1;
			System.out.println("输出为空");
		}else{
			currPage = page;
		}

		
		// 获取总记录数
		int rowCount = tbitemService.getRowCount(null);
		//int rowCount = tbOutuoService.getRowCount(null);
		PageParam pageParam = new PageParam();
		pageParam.setRowCount(rowCount);
		if (pageParam.getTotalPage() < currPage) {
			currPage = pageParam.getTotalPage();
		}
		int offset = (currPage - 1) * PageParam.pageSize ;
		int size = PageParam.pageSize;
		if (rowCount - offset < pageParam.pageSize) {
			size = rowCount - offset;
		}
		
		
		pageParam.setCurrPage(currPage);
		
		List<TbBom> list = tbitemService.getProListByPage(null);
		List<TbBom> TbEx = list.subList(offset, offset+size);
	
		
		model.addAttribute("pageParam", pageParam);
		model.addAttribute("tbList", TbEx);
		
		return "items";
	}
	/**
	 * 
	 * 数据查看页面 
	 * 方法名：view
	 * @param id
	 * @param model
	 * @param req
	 * @return String
	 * @exception
	 */
	@RequestMapping("/viewitems")
	public String view(Integer id,Model model,HttpServletRequest req){
		/**
		 * 根据id查询单个用户,处理单个数据查看请求
		 * @param id
		 */
	
		model.addAttribute("userItem",tbitemService.findById(id));
		return "view";
	}
	/**
	 * 返回用户数据的编辑页面
	 * 方法名：updateUser
	 * @param tableIp
	 * @param request
	 * @param model
	 * @return String
	 * @exception
	 */
	@RequestMapping("/edititems")
	 public String toEdit(int id,TbViewVo tbViewVo,Model model,TbBomEx tbBomEx){ 

		model.addAttribute("userEdit",tbitemService.findById(id));
		model.addAttribute("tbuser",tbuserService.findAll());
		/*tbViewVo.setTbBomEx(tbBomEx);*/
		model.addAttribute("tbitemuser", tbOutuoService.getProListByPage(null));
//		model.addAttribute("userEdit", tableIp.getId());
		 return "edititems";
		
	 }
	/**
	 * 
	 * 用户数据修改处理
	 * 方法名：update
	 * @param tableIp
	 * @param req
	 * @param model
	 * @return String
	 * @exception
	 */
	@RequestMapping("/saveOritems")
	
	 public String saveOrUpdate(TbViewVo tbViewVo,TbBomEx tbBomEx,Model model){ 
		tbViewVo.setTbBomEx(tbBomEx);
		int i =tbitemService.update(tbViewVo);
		String message ="";
		
		if(i>0){
			message ="修改成功";
			
			
		}else{
			message ="修改失败";
		
		}
		model.addAttribute("message", message);
		
		return "edititems";
	 }
	/**
	 * 
	 * 删除数据
	 * 方法名：delete
	 * @param response
	 * @param taskEx
	 * @param tbViewVo
	 * @param id void
	 * @exception
	 */
	@RequestMapping("/deleteitems")
	public void delete(HttpServletResponse response,TbBomEx tbBomEx,TbViewVo tbViewVo,Long id){
		
		tbBomEx.setBomId(id);
		tbViewVo.setTbBomEx(tbBomEx);
		String deString = tbitemService.delete(tbViewVo);
		try {
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.write(deString);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * 返回添加页面
	 * 方法名：toAdduser
	 * @param id
	 * @param model
	 * @return String
	 * @exception
	 */
	@RequestMapping("/additem")
	public String toAdduser(Model model){
		model.addAttribute("tbuser",tbuserService.findAll());
		model.addAttribute("tbitemuser", tbOutuoService.getProListByPage(null));
		return "additem";
	}
	/**
	 * 
	 * 添加数据
	 * 方法名：insert
	 * @param model
	 * @param tbViewVo
	 * @param tbProjectEx
	 * @return String
	 * @exception
	 */
	@RequestMapping("/insertitem")
	public String insert(Model model, TbViewVo tbViewVo,TbBomEx tbBomEx){
		tbViewVo.setTbBomEx(tbBomEx);
		String addUser =tbitemService.insert(tbViewVo);
		
		model.addAttribute("addUser", addUser);
		return "additem";
	}
	/**
	 * 
	 * 模糊查询
	 * 方法名：getSelect
	 * @param rPo
	 * @param model
	 * @return ModelAndView
	 * @exception
	 */
	
	@RequestMapping("/rolefinditem")
	
	public String getSelectByLike(Model model,HttpServletRequest request,TbViewVo tbProvo){
		System.out.println(tbProvo.getTbTaskEx());
		List<TbBom> findList =tbitemService.getProListByPage(tbProvo);
//		map.addAllAttributes(findList);
		model.addAttribute("tbList", findList);
		return "items";
	}
}
