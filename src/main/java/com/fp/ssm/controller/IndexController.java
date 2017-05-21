package com.fp.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javafx.scene.control.Alert;

import javax.annotation.Resource;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sun.util.logging.resources.logging;

import com.fp.ssm.common.PageParam;
import com.fp.ssm.converter.CustomDateConverter;
import com.fp.ssm.po.RoleResourcePo;
import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
import com.fp.ssm.po.TbProject;
import com.fp.ssm.po.TbProjectEx;
import com.fp.ssm.po.TbTaskEx;
import com.fp.ssm.po.TbTaskExample;
import com.fp.ssm.po.TbViewVo;
import com.fp.ssm.service.TbOutuoService;
import com.fp.ssm.service.TbtaskService;
import com.fp.ssm.service.TbuserService;




@Controller
public class IndexController {

	@Resource
	TbOutuoService tbOutuoService;
	@Resource
	TbuserService tbuserService;
	@Resource
	TbtaskService tbtaskService;
	
	@RequestMapping(value = "index")
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
		int rowCount = tbOutuoService.getRowCount(null);
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
		
		List<TbProject> list = tbOutuoService.getProListByPage(null);
		List<TbProject> TbEx = list.subList(offset, offset+size);
	
		
		model.addAttribute("pageParam", pageParam);
		model.addAttribute("tbList", TbEx);
		
		return "index";
	}
	
	@RequestMapping("/view")
	public String view(int id,Model model,TbViewVo tbViewVo){
		/**
		 * 根据id查询单个用户,处理单个数据查看请求
		 * @param id
		 */
		/*
		tbTaskEx.setProId((long)id);
		tbViewVo.setTbTaskEx(tbTaskEx);*/
		model.addAttribute("user",tbOutuoService.findById(id));
	/*	model.addAttribute("utask",tbtaskService.findByproId(tbViewVo));*/
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
	@RequestMapping("/edit")
	 public String toEdit(int id,HttpServletRequest req,Model model){ 
	//	req.setAttribute("userEdit", service.findById(tableIp.getId()));
		model.addAttribute("userEdit",tbOutuoService.findById(id));
		model.addAttribute("tbuser",tbuserService.findAll());
		
//		model.addAttribute("userEdit", tableIp.getId());
		 return "edit";
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
	@RequestMapping("/saveOrUpdate")
	
	 public String saveOrUpdate(TbViewVo tbViewVo,TbProjectEx tbProjectEx,Model model){ 
		tbViewVo.setTbProjectEx(tbProjectEx);
		int i =tbOutuoService.update(tbViewVo);
		String message ="";
		
		if(i>0){
			message ="修改成功";
			
			
		}else{
			message ="修改失败";
		
		}
		model.addAttribute("message", message);
		
		return "edit";
	 }
	/**
	 * 
	 * 跳转到添加用户界面
	 * 方法名：toadd
	 * @param req
	 * @param tableIp
	 * @return String
	 * @exception
	 */
	@RequestMapping("/add")
	public String toAdduser(Model model){
		model.addAttribute("tbAdduser",tbuserService.findAll());
		return "add";
	}
	/**
	 * 
	 * 添加项目
	 * 方法名：insert
	 * @param model
	 * @param tbViewVo
	 * @return String
	 * @exception
	 */
	@RequestMapping("/insertUser")
	public String insert(Model model, TbViewVo tbViewVo,TbProjectEx tbProjectEx){
		tbViewVo.setTbProjectEx(tbProjectEx);
		String addUser = tbOutuoService.insert(tbViewVo);
		
		model.addAttribute("addUser", addUser);
		return "add";
	}
	/**
	 * 
	 * 删除数据
	 * 方法名：delete
	 * @param id
	 * @param request
	 * @param response void
	 * @exception
	 */
	@RequestMapping("/deleteUser")
	public void delete(HttpServletResponse response,TbProjectEx tbProjectEx,TbViewVo tbViewVo,Long id){
		
		tbProjectEx.setProId(id);
		tbViewVo.setTbProjectEx(tbProjectEx);
		String deString = tbOutuoService.delete(tbViewVo);
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
	 * 模糊查询
	 * 方法名：getSelect
	 * @param rPo
	 * @param model
	 * @return ModelAndView
	 * @exception
	 */
	
	@RequestMapping("/rolefind")
	
	public String getSelectByLike(Model model,HttpServletRequest request,TbViewVo tbProvo){
		System.out.println(tbProvo.getTbProjectEx());
		List<TbProject> findList =tbOutuoService.getProListByPage(tbProvo);
//		map.addAllAttributes(findList);
		model.addAttribute("tbList", findList);
		return "index";
	}
	/* @RequestMapping("/rolefind")//为方法设置访问路径  
	    public ModelAndView mav(@RequestParam(required=false) Map map){  
	        List<Map> selectUser = service.getselect(map); 
	        ModelAndView mav=new ModelAndView();  
	        mav.addObject("ulist", selectUser);  
	        mav.setViewName("/findByLike.jsp");  
	        return mav;  
	    }  */
	
	/*@RequestMapping("/tofindByLike")
	public String tofindByLike(){
		return "findByLike";
	}*/
}
