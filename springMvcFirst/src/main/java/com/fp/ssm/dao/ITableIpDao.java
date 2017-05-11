package com.fp.ssm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fp.ssm.po.RoleResourcePo;
import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;



@Repository
public interface ITableIpDao {

	int getRowCount();

	public List<TableIpEx> selectByParams(TableIpShowVo tableipvo) ;

	public List<TableIp> fetchByParams(Map<String, Object> params) ;
	
	public TableIpEx findById(Integer id) ;
	
	public boolean update(TableIp tableIp);
	
	public int insert(TableIp tableIp);  
	
	public int delete(int id);  
	//根据項目名等模糊查询
	  public List<TableIp> selectByLike(RoleResourcePo rPo);     
}
