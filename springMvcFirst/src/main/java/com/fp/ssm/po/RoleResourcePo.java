
package com.fp.ssm.po;

import java.io.Serializable;

/**
 * 模糊查询参数实体类
 * RoleResourcePo
 * 创建人:fangwanpeng
 * 时间：2017年5月8日-下午11:00:45 
 * @version 1.0.0
 * 
 */
public class RoleResourcePo implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	private String item;
	private String principal;
	private Integer selectCorol;
	private String phone;
	
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public Integer getSelectCorol() {
		return selectCorol;
	}
	public void setSelectCorol(Integer selectCorol) {
		this.selectCorol = selectCorol;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

}
