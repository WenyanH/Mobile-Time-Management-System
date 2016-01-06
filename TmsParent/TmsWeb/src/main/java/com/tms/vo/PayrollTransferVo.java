package com.tms.vo;

import java.text.SimpleDateFormat;

import com.tms.entity.commonfunctions.PayrollTransfer;

public class PayrollTransferVo {
	
	private String id;
	private Boolean isClosed = false;
	private Boolean isExported =true;
	private String code;
	private String fromDate;
	private String toDate;
	
	private String employee;
	private String employeeName;

	public PayrollTransferVo(){}
	public PayrollTransferVo(PayrollTransfer payrollTransfer){
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		this.id=payrollTransfer.getId();
		this.isClosed=payrollTransfer.getIsClosed();
		this.isExported=payrollTransfer.getIsExported();
		this.code=payrollTransfer.getCode();
		if(payrollTransfer.getFromDate()!=null){
			this.fromDate=sdf.format(payrollTransfer.getFromDate());
		}
		if(payrollTransfer.getToDate()!=null){
			this.toDate=sdf.format(payrollTransfer.getToDate());
		}
		if(payrollTransfer.getEmployee()!=null){
			this.employee=payrollTransfer.getEmployee().getId();
			this.employeeName=payrollTransfer.getEmployee().getFirstName() + "," + payrollTransfer.getEmployee().getLastName();
		}
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getEmployee() {
		return employee;
	}

	public void setEmployee(String employee) {
		this.employee = employee;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public Boolean getIsClosed() {
		return isClosed;
	}
	public void setIsClosed(Boolean isClosed) {
		this.isClosed = isClosed;
	}
	public Boolean getIsExported() {
		return isExported;
	}
	public void setIsExported(Boolean isExported) {
		this.isExported = isExported;
	}
	
	
}
