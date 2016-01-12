package com.tms.vo;

import java.util.Date;

import com.tms.entity.commonfunctions.PayCard;

public class PayCardVo {
	private String id;
	private Boolean vaild = false;
	private Boolean modified =true;
	private String code;
	private Date fromDate;
	private Date toDate;
	private String employeeId;
	private String employeeName;
	
	public PayCardVo(){}
	public PayCardVo(PayCard payCard){
		this.id=payCard.getId();
		this.vaild=payCard.getVaild();
		this.modified=payCard.getModified();
		this.code=payCard.getCode();
		this.fromDate=payCard.getFromDate();
		this.toDate=payCard.getToDate();
		if(payCard.getEmployee()!=null){
			this.employeeId=payCard.getEmployee().getId();
			this.employeeName=payCard.getEmployee().getFirstName() + "," + payCard.getEmployee().getLastName();
		}
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Boolean getVaild() {
		return vaild;
	}
	public void setVaild(Boolean vaild) {
		this.vaild = vaild;
	}
	public Boolean getModified() {
		return modified;
	}
	public void setModified(Boolean modified) {
		this.modified = modified;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public Date getFromDate() {
		return fromDate;
	}
	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}
	public Date getToDate() {
		return toDate;
	}
	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
}
