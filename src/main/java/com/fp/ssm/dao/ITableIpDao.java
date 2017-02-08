package com.fp.ssm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;



@Repository
public interface ITableIpDao {

	int getRowCount();

	public List<TableIpEx> selectByParams(TableIpShowVo tableipvo) ;

	public List<TableIp> fetchByParams(Map<String, Object> params) ;

}
