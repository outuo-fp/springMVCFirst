package com.fp.ssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fp.ssm.dao.TbBomMapper;
import com.fp.ssm.dao.TbTaskMapper;
import com.fp.ssm.po.TbBom;
import com.fp.ssm.po.TbBomExample;
import com.fp.ssm.po.TbTask;
import com.fp.ssm.po.TbTaskEx;
import com.fp.ssm.po.TbTaskExample;
import com.fp.ssm.po.TbViewVo;

/**
 * 
 * TbitemService
 * 创建人:fangwanpeng
 * 时间：2017年5月20日-下午9:54:35 
 * @version 1.0.0
 * 
 */
@Service
public class TbitemService {
	@Resource
	private TbBomMapper tbBomMapper;
	public List<TbBom> getProListByPage(TbViewVo tbViewVo){

		List<TbBom> proList = null;
		TbBomExample example = null;		
		if (tbViewVo != null) {
			String strname = tbViewVo.getTbTaskEx().getTaskName();
			Long userid = tbViewVo.getTbBomEx().getUserId();
			Long proid = tbViewVo.getTbBomEx().getProId();
			Integer status =tbViewVo.getTbBomEx().getStatus();
			example = new TbBomExample();
			TbBomExample.Criteria criteria = example.or();
			if(strname !=null)
			{
				criteria.andComponentsLike("%"+strname+"%");
			}
			if(userid !=null)
			{
				criteria.andBomIdEqualTo(userid);
			}
			if(status !=null)
			{
				criteria.andStatusEqualTo(status);
			}
			if(proid !=null){
				criteria.andProIdEqualTo(proid);
			}
		}

		proList = tbBomMapper.selectByExample(example);
		return proList;
	}
	public int getRowCount(TbViewVo tbViewVo) {
		int count = 0;
		TbBomExample example = null;
		if (tbViewVo != null) {
			example = new TbBomExample();
			example.or().andBrandLike("好");//tbViewVo.getTbProjectEx().getProName());
					//.andCustomerLike(tbViewVo.getTbProjectEx().getCustomer())
					//.andStatusEqualTo(tbViewVo.getTbProjectEx().getStatus());
		}
		count = tbBomMapper.countByExample(example);
		return count;
	}
	

	public TbBom findById(Integer id){
		
		return tbBomMapper.selectByPrimaryKey(Long.valueOf(id));
	}
/**
 * 更新数据方法
 */
	public int update(TbViewVo tbViewVo){
		
		TbBom tbBom = tbViewVo.getTbBomEx();
		return tbBomMapper.updateByPrimaryKey(tbBom);
		
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
		 
		TbBom tbBom = tbViewVo.getTbBomEx();
		 int i = tbBomMapper.insert(tbBom);
		 String message = "";
		 if(i>0){
			 message ="添加成功";
		 }else{
			 message ="添加失败";
		 }
		 return message;
	 }
	 public String delete(TbViewVo tbViewVo){
		 
		 Long bomId = tbViewVo.getTbBomEx().getBomId();
		 int i = tbBomMapper.deleteByPrimaryKey(bomId);
		 String data = "";
		 System.out.println("id的值为"+i);
		 if(i>0){
			 data ="删除成功";
		 }else{
			 data ="删除失败";
		 }
		
		 return data;
	 }
}
