package com.fp.ssm.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;




import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.fp.ssm.converter.CustomDateConverter;
import com.fp.ssm.dao.ITableIpDao;
import com.fp.ssm.po.RoleResourcePo;
import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;



@Service
public class TableIpService {

	@Resource
	ITableIpDao dao ;
	RoleResourcePo rPo;
	
	public int getRowCount() {
		return dao.getRowCount();
	}

	public List<TableIpEx> getIpListByPage(TableIpShowVo tableipvo){
//		int currPage = pageParam.getCurrPage();
//		// limit offset, size
//		int offset = (currPage - 1) * PageParam.pageSize ;
//		int size = PageParam.pageSize;
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("offset", offset);
//		params.put("size", size);
		/*CustomDateConverter converter =new CustomDateConverter();
		Date findTime=converter.convert(tableipvo.getTableIp().getFindTime().toString());*/
		
		List<TableIpEx> ipList;
		ipList = dao.selectByParams(tableipvo);
//		pageParam.setData(ipList);
		
		return ipList;
	}
	public String findIp(String number, String country, String isp) {
		int size = 100;
		try {
			size = Integer.parseInt(number);
		} catch (Exception e) {
		}
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("size", size);
		params.put("country", country);
		params.put("isp", isp);
		
		List<TableIp> ipList = dao.fetchByParams(params);
		StringBuilder sBuilder = new StringBuilder();
		for (TableIp tableIp : ipList) {
			sBuilder.append(tableIp.getIp()).append(":").append(tableIp.getPort()).append(",").append(tableIp.getCountry()).append(",").append(tableIp.getIsp());
			sBuilder.append("\r\n");
		}
		
		return sBuilder.toString();
	}

	public TableIpEx findTest(Integer id)
	{
		TableIpEx tableIpEx =dao.findById(id);
		return tableIpEx;
	}
	public TableIpEx findById(Integer id){
		
		return dao.findById(id);
	}
/**
 * 更新数据方法
 */
	public boolean update(TableIp tableIp){
		
		return dao.update(tableIp);
		
	} 
	/**
	 * 
	 * 添加用户信息
	 * 方法名：insert
	 * @param tableIp
	 * @return String
	 * @exception
	 */
	 public String insert(TableIp tableIp){
		 int i = dao.insert(tableIp);
		 String message = "";
		 if(i>0){
			 message ="添加失败";
		 }else{
			 message ="添加成功";
		 }
		 return message;
	 }
	 public String delete(int id){
		 int i = dao.delete(id);
		 String message = "";
		 if(i>0){
			 message ="删除失败";
		 }else{
			 message ="删除成功";
		 }
		 return message;
	 }
	
	/*public List<TableIp> getSelect(RoleResourcePo rPo){
		Map<String, Object> params = new HashMap<String, Object>();

		params.put("item", rPo.getItem());
		List<TableIp> list =dao.selectByLike(params);
		
		return list;
	} */ 
	 /**
	  * 
	  * 实现模糊查询
	  * 方法名：getselect
	  * @param map
	  * @return List<Map>
	  * @exception
	  */
	 public List<TableIp> getselect(RoleResourcePo rPo) { 
		 System.out.println(rPo.getItem());
	        List<TableIp> selectUser = dao.selectByLike(rPo);  
	        return selectUser;  
	    }  

}
