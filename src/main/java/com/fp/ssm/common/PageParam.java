package com.fp.ssm.common;

import java.util.List;

import com.fp.ssm.po.TableIp;
import com.fp.ssm.po.TableIpEx;


public class PageParam {

	private int currPage ; // 当前页
	
	private int totalPage ; // 总页
	
	private int rowCount ; // 总记录数
	
	public static int pageSize = 10; // 页大小
	
//	private List<TableIpEx> data ; // 数据

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		int totalPage = rowCount / pageSize;
		if (rowCount % pageSize > 0) {
			totalPage += 1;
		}
		setTotalPage(totalPage);
		this.rowCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	
}
