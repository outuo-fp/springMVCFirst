package com.fp.ssm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fp.ssm.dao.ITableIpDao;
import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;
import com.fp.ssm.po.TableIpShowVo;



@Service
public class TableIpService {

	@Resource
	ITableIpDao dao ;
	
	public int getRowCount() {
		return dao.getRowCount();
	}

	public List<TableIpEx> getIpListByPage(TableIpShowVo tableipvo) {
//		int currPage = pageParam.getCurrPage();
//		// limit offset, size
//		int offset = (currPage - 1) * PageParam.pageSize ;
//		int size = PageParam.pageSize;
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("offset", offset);
//		params.put("size", size);
		
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


}

