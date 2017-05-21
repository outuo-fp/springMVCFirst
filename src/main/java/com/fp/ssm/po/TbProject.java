package com.fp.ssm.po;

import java.util.Date;

public class TbProject {
    private Long proId;

    private String proName;

    private Long userId;

    private Integer num;

    private Long totalFee;

    private String department;

    private String customer;

    private String reqUrl;

    private String elcUrl;

    private String mechUrl;

    private String softUrl;

    private Integer status;

    private Date created;

    private Date deadline;

    private String comment;

    public Long getProId() {
        return proId;
    }

    public void setProId(Long proId) {
        this.proId = proId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName == null ? null : proName.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Long getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(Long totalFee) {
        this.totalFee = totalFee;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department == null ? null : department.trim();
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer == null ? null : customer.trim();
    }

    public String getReqUrl() {
        return reqUrl;
    }

    public void setReqUrl(String reqUrl) {
        this.reqUrl = reqUrl == null ? null : reqUrl.trim();
    }

    public String getElcUrl() {
        return elcUrl;
    }

    public void setElcUrl(String elcUrl) {
        this.elcUrl = elcUrl == null ? null : elcUrl.trim();
    }

    public String getMechUrl() {
        return mechUrl;
    }

    public void setMechUrl(String mechUrl) {
        this.mechUrl = mechUrl == null ? null : mechUrl.trim();
    }

    public String getSoftUrl() {
        return softUrl;
    }

    public void setSoftUrl(String softUrl) {
        this.softUrl = softUrl == null ? null : softUrl.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
}