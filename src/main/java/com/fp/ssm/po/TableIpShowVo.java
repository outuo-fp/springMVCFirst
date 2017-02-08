package com.fp.ssm.po;


public class TableIpShowVo {

//pojo
	private TableIp tableIp;
	
	private TableIpEx tableIpEx;
	
//	private List<TableIpEx> ipList;
	
	private Integer offset;
	private Integer size;
	// 商品信息拓展
	private int currPage; // 当前页

	private int totalPage; // 总页

	private int rowCount; // 总记录数

	public static int pageSize = 10; // 页大小

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

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}


	public TableIp getTableIp() {
		return tableIp;
	}

	public void setTableIp(TableIp tableIp) {
		this.tableIp = tableIp;
	}

	public TableIpEx getTableIpEx() {
		return tableIpEx;
	}

	public void setTableIpEx(TableIpEx tableIpEx) {
		this.tableIpEx = tableIpEx;
	}

	
}
