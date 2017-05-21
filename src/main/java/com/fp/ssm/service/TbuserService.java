package com.fp.ssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fp.ssm.dao.TbUserMapper;
import com.fp.ssm.po.TbUser;
import com.fp.ssm.po.TbUserExample;
import com.fp.ssm.po.TbViewVo;

/**
 * 
 * TbuserService
 * 创建人:fangwanpeng
 * 时间：2017年5月18日-下午11:45:18 
 * @version 1.0.0
 * 
 */
@Service
public class TbuserService {
	@Resource
	private TbUserMapper tbUserMapper;
	
	public List<TbUser> findAll(){
		TbUserExample example =new TbUserExample();
		example.createCriteria().andUserIdIsNotNull();
		
		List<TbUser> userList =tbUserMapper.selectByExample(example);
		return userList;
	}
}
