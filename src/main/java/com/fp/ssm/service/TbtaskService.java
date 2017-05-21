package com.fp.ssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fp.ssm.dao.TbTaskMapper;
import com.fp.ssm.po.TbProject;
import com.fp.ssm.po.TbProjectEx;
import com.fp.ssm.po.TbProjectExample;
import com.fp.ssm.po.TbTask;
import com.fp.ssm.po.TbTaskEx;
import com.fp.ssm.po.TbTaskExample;
import com.fp.ssm.po.TbViewVo;

/**
 * 
 * TbtaskService
 * 创建人:fangwanpeng
 * 时间：2017年5月20日-下午2:37:43 
 * @version 1.0.0
 * 
 */
@Service
public class TbtaskService {
	@Resource
	private TbTaskMapper tbTaskMapper;
	public List<TbTask> getProListByPage(TbViewVo tbViewVo){

		List<TbTask> proList = null;
		TbTaskExample example = null;		
		if (tbViewVo != null) {
			String strname = tbViewVo.getTbTaskEx().getTaskName();
			Long userid = tbViewVo.getTbTaskEx().getUserId();
			Long proid = tbViewVo.getTbTaskEx().getProId();
			Integer status =tbViewVo.getTbTaskEx().getStatus();
			example = new TbTaskExample();
			TbTaskExample.Criteria criteria = example.or();
			if(strname !=null)
			{
				criteria.andTaskNameLike("%"+strname+"%");
			}
			if(userid !=null)
			{
				criteria.andTaskIdEqualTo(userid);
			}
			if(status !=null)
			{
				criteria.andStatusEqualTo(status);
			}
			if(proid !=null){
				criteria.andProIdEqualTo(proid);
			}
		}

		proList = tbTaskMapper.selectByExample(example);
		return proList;
	}
	public int getRowCount(TbViewVo tbViewVo) {
		int count = 0;
		TbTaskExample example = null;
		if (tbViewVo != null) {
			example = new TbTaskExample();
			example.or().andTaskNameLike("好");//tbViewVo.getTbProjectEx().getProName());
					//.andCustomerLike(tbViewVo.getTbProjectEx().getCustomer())
					//.andStatusEqualTo(tbViewVo.getTbProjectEx().getStatus());
		}
		count = tbTaskMapper.countByExample(example);
		return count;
	}
	public List<TbTask> findByproId(TbViewVo tbViewVo){
		List<TbTask> proList = null;
		TbTaskExample example = null;
		Long proid = tbViewVo.getTbTaskEx().getProId();
		if(tbViewVo != null){
			example = new TbTaskExample();
			TbTaskExample.Criteria criteria = example.or();
			if(proid!=null){
				criteria.andProIdIsNotNull();
			}
		}
		proList =tbTaskMapper.selectByExample(example);
		return proList;
	}

	public TbTask findById(Integer id){
		
		return tbTaskMapper.selectByPrimaryKey(Long.valueOf(id));
	}
/**
 * 更新数据方法
 */
	public int update(TbViewVo tbViewVo){
		
		TbTask tbTask = tbViewVo.getTbTaskEx();
		return tbTaskMapper.updateByPrimaryKey(tbTask);
		
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
		 
		 TbTask tbTask = tbViewVo.getTbTaskEx();
		 int i = tbTaskMapper.insert(tbTask);
		 String message = "";
		 if(i>0){
			 message ="添加成功";
		 }else{
			 message ="添加失败";
		 }
		 return message;
	 }
	 public String delete(TbViewVo tbViewVo){
		 
		 Long taskId = tbViewVo.getTbTaskEx().getTaskId();
		 int i = tbTaskMapper.deleteByPrimaryKey(taskId);
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