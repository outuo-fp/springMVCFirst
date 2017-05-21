package com.fp.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fp.ssm.common.PageParam;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
import com.fp.ssm.po.TbProject;
import com.fp.ssm.po.TbProjectEx;
import com.fp.ssm.po.TbTask;
import com.fp.ssm.po.TbTaskEx;
import com.fp.ssm.po.TbViewVo;
import com.fp.ssm.service.TbOutuoService;
import com.fp.ssm.service.TbtaskService;
import com.fp.ssm.service.TbuserService;



@Controller
public class FetchController {
	@Resource
	TbtaskService tbtaskService;
	@Resource
	TbuserService tbuserService;
	@Resource
	TbOutuoService tbOutuoService;
	
	@RequestMapping(value = "task")
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
		int rowCount = tbtaskService.getRowCount(null);
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
		
		List<TbTask> list = tbtaskService.getProListByPage(null);
		List<TbTask> TbEx = list.subList(offset, offset+size);
	
		
		model.addAttribute("pageParam", pageParam);
		model.addAttribute("tbList", TbEx);
		
		return "task";
	}

	/*@RequestMapping(value = "get", method = RequestMethod.POST)
	public void get(HttpServletRequest request,HttpServletResponse response){
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
		
	}*/
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
	@RequestMapping("/viewtask")
	public String view(Integer id,Model model,HttpServletRequest req){
		/**
		 * 根据id查询单个用户,处理单个数据查看请求
		 * @param id
		 */
	
		model.addAttribute("utask",tbtaskService.findById(id));
		return "view";
	}
	/**
	 * 
	 * 返回数据编辑页面
	 * 方法名：toEdit
	 * @param id
	 * @param req
	 * @param model
	 * @return String
	 * @exception
	 */
	@RequestMapping("/edittask")
	 public String toEdit(Integer id,Model model,TbViewVo tbViewVo,TbProjectEx tbProjectEx){ 
	
		model.addAttribute("userEdit",tbtaskService.findById(id));
		model.addAttribute("tbuser",tbuserService.findAll());
		tbViewVo.setTbProjectEx(tbProjectEx);
		model.addAttribute("tbtaskuser", tbOutuoService.getProListByPage(null));
//		model.addAttribute("userEdit", tableIp.getId());
		 return "edittask";
	 }
	/**
	 * 
	 * 数据修改保存
	 * 方法名：saveOrUpdate
	 * @param tbViewVo
	 * @param tbTaskEx
	 * @param model
	 * @return String
	 * @exception
	 */
	@RequestMapping("/saveOrtask")
	public String saveOrUpdate(TbViewVo tbViewVo,TbTaskEx tbTaskEx,Model model){ 
		System.out.println(tbTaskEx.getTaskId());
		System.out.println(tbTaskEx.getUserId());
		tbViewVo.setTbTaskEx(tbTaskEx);
		int i = tbtaskService.update(tbViewVo);
		String message ="";
		
		if(i>0){
			message ="修改成功";
			
			
		}else{
			message ="修改失败";
		
		}
		model.addAttribute("message", message);
		
		return "edittask";
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
	@RequestMapping("/deleteTask")
	public void delete(HttpServletResponse response,TbTaskEx taskEx,TbViewVo tbViewVo,Long id){
		
		taskEx.setTaskId(id);
		tbViewVo.setTbTaskEx(taskEx);
		String deString = tbtaskService.delete(tbViewVo);
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
	@RequestMapping("/addtask")
	public String toAdduser(Model model){
		model.addAttribute("tbuser",tbuserService.findAll());
		model.addAttribute("tbtaskuser", tbOutuoService.getProListByPage(null));
		return "addtask";
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
	@RequestMapping("/insertTask")
	public String insert(Model model, TbViewVo tbViewVo,TbTaskEx tbTaskEx){
		tbViewVo.setTbTaskEx(tbTaskEx);
		String addUser = tbtaskService.insert(tbViewVo);
		
		model.addAttribute("addUser", addUser);
		return "addtask";
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
	
	@RequestMapping("/rolefindtask")
	
	public String getSelectByLike(Model model,HttpServletRequest request,TbViewVo tbProvo){
		/*System.out.println(tbProvo.getTbTaskEx());*/
		List<TbTask> findList =tbtaskService.getProListByPage(tbProvo);
//		map.addAllAttributes(findList);
		model.addAttribute("tbList", findList);
		return "task";
	}
}
