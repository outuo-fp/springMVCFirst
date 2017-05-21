package com.fp.ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fp.ssm.dao.TbProjectMapper;
import com.fp.ssm.po.RoleResourcePo;
import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;
import com.fp.ssm.po.TbBomExample.Criteria;
import com.fp.ssm.po.TbProject;
import com.fp.ssm.po.TbProjectEx;
import com.fp.ssm.po.TbProjectExample;
import com.fp.ssm.po.TbViewVo;

@Service
public class TbOutuoService {
	
	@Resource
	private TbProjectMapper tbProjectMapper;
	
	public List<TbProject> getProListByPage(TbViewVo tbViewVo){

		List<TbProject> proList = null;
		TbProjectExample example = null;		
		if (tbViewVo != null) {
			String strname = tbViewVo.getTbProjectEx().getProName();
			String strcus = tbViewVo.getTbProjectEx().getCustomer();
			Integer status = tbViewVo.getTbProjectEx().getStatus();
			Long userid = tbViewVo.getTbProjectEx().getUserId();
			example = new TbProjectExample();
			TbProjectExample.Criteria criteria = example.or();
			if(strname !=null)
			{
				criteria.andProNameLike("%"+strname+"%");
			}
			if(strcus !=null)
			{
				criteria.andCustomerLike("%"+strcus+"%");
			}
			if(status !=null)
			{
				criteria.andStatusEqualTo(status);
			}
			if(userid !=null){
				criteria.andUserIdEqualTo(userid);
			}
		}

		proList = tbProjectMapper.selectByExample(example);

		return proList;
	}
	
	public int getRowCount(TbViewVo tbViewVo) {
		int count = 0;
		TbProjectExample example = null;
		if (tbViewVo != null) {
			example = new TbProjectExample();
			example.or().andProNameLike("好");//tbViewVo.getTbProjectEx().getProName());
					//.andCustomerLike(tbViewVo.getTbProjectEx().getCustomer())
					//.andStatusEqualTo(tbViewVo.getTbProjectEx().getStatus());
		}
		count = tbProjectMapper.countByExample(example);
		return count;
	}
	

	public TbProject findById(Integer id){
		
		return tbProjectMapper.selectByPrimaryKey(Long.valueOf(id));
	}
/**
 * 更新数据方法
 */
	public int update(TbViewVo tbViewVo){
		
		TbProject tbProject = tbViewVo.getTbProjectEx();
		return tbProjectMapper.updateByPrimaryKey(tbProject);
		
	} 
	/**
	 * 
	 * 添加用户信息
	 * 方法名：insert
	 * @param tableIp
	 * @return String
	 * @exception
	 */
	 public String insert(TbViewVo tbViewVo){
		 
		 TbProject tbProject = tbViewVo.getTbProjectEx();
		 int i = tbProjectMapper.insert(tbProject);
		 String message = "";
		 if(i>0){
			 message ="添加成功";
		 }else{
			 message ="添加失败";
		 }
		 return message;
	 }
	 public String delete(TbViewVo tbViewVo){
		 
		 Long proId = tbViewVo.getTbProjectEx().getProId();
		 int i = tbProjectMapper.deleteByPrimaryKey(proId);
		 String data = "";
		 System.out.println("id的值为"+i);
		 if(i>0){
			 data ="删除成功";
		 }else{
			 data ="删除失败";
		 }
		
		 return data;
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
//	 public List<TableIp> getselect(RoleResourcePo rPo) { 
//		 System.out.println(rPo.getItem());
//	        List<TableIp> selectUser = dao.selectByLike(rPo);  
//	        return selectUser;  
//	    }  

}
