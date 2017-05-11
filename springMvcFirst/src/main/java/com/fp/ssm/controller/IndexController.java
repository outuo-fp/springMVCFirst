package com.fp.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import javafx.scene.control.Alert;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sun.util.logging.resources.logging;

import com.fp.ssm.common.PageParam;
import com.fp.ssm.po.RoleResourcePo;
import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
import com.fp.ssm.service.TableIpService;




@Controller
public class IndexController {

	@Resource
	TableIpService service;
	
	@RequestMapping(value = "index")
	public String helloWorld(Model model,HttpServletRequest request,TableIpShowVo tbipvo,@RequestParam(value = "page",required = false)Integer page){
		//String currPageStr = request.getParameter("page");
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
		model.addAttribute("tbList", TbEx);
		
		return "index";
	}
	
	@RequestMapping("/view")
	public String view(int id,Model model,HttpServletRequest req){
		/**
		 * 根据id查询单个用户,处理单个数据查看请求
		 * @param id
		 */
	//	System.out.println(id);
		req.setAttribute("user", service.findById(id));
		model.addAttribute("user",service.findById(id));
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
	 public String toEdit(TableIp tableIp,HttpServletRequest req,Model model){ 
		req.setAttribute("userEdit", service.findById(tableIp.getId()));
		model.addAttribute("userEdit",service.findById(tableIp.getId()));
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
	 public String saveOrUpdate(TableIp tableIp,HttpServletRequest req,Model model){ 
	
		String message ="";
		if(!service.update(tableIp)){
			message ="修改成功";
		}else{
			message ="修改失败";
		}
		model.addAttribute("message", message);
		return "redirect:/index.html";
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
	public String toAdduser(){
		
		return "add";
	}
	/**
	 * 
	 * 用户信息添加
	 * 方法名：add
	 * @param req
	 * @param tableIp
	 * @return String
	 * @exception
	 */
	@RequestMapping("/insertUser")
	public String insert(HttpServletRequest req, TableIp tableIp){
		String addUser = service.insert(tableIp);
		req.setAttribute("addUser", addUser);
		return "/add";
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
	public void delete(int id,HttpServletRequest request,HttpServletResponse response){
		String deString =service.delete(id);
		
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
	
	public String getSelectByLike(RoleResourcePo rPo,Model model){
		System.out.println(rPo.getItem());
		List<TableIp> findList =service.getselect(rPo);
//		map.addAllAttributes(findList);
		model.addAttribute("ullist", findList);
		return "findByLike";
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
