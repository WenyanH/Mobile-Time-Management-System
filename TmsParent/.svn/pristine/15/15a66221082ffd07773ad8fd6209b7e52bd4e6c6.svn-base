package com.tms.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import com.tms.entity.Department;
import com.tms.entity.commonfunctions.AutoSendReport;
import com.tms.entity.customer.ReportType;

public class SendReportVo {
	private String id;
	private ReportType reportType;
	private String runatTime;
	private Date   runTimeDisplay;
	private String sendTo;	
    private String  sendFrequency;	
	private String parameter;
	private String[] departments;
	private String department;
	private String departmentValue;
	public SendReportVo(){}

	public SendReportVo(AutoSendReport sendreport) {
		this.id = sendreport.getId();
		this.reportType = sendreport.getReportType();
		if (sendreport.getRunatTime() != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm");
			this.runatTime = sdf.format(sendreport.getRunatTime());
			this.runTimeDisplay=sendreport.getRunatTime();
		}
		
		this.sendTo = sendreport.getSendTo();
		this.sendFrequency = String.valueOf(sendreport.getSendFrequency());
		this.parameter = sendreport.getParameter();
		Set<Department> departments=sendreport.getDepartment();
		for(Department department :departments){
			this.department+=department.getId()+",";
			this.departmentValue+=department.getName()+",";
		}
		if(StringUtils.isNotEmpty(department)){
			this.departmentValue=departmentValue.substring(0, departmentValue.length()-1);
		}
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public ReportType getReportType() {
		return reportType;
	}
	public void setReportType(ReportType reportType) {
		this.reportType = reportType;
	}
	public String getRunatTime() {
		return runatTime;
	}
	public void setRunatTime(String runatTime) {
		this.runatTime = runatTime;
	}
	public String getSendTo() {
		return sendTo;
	}
	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}
	public String getSendFrequency() {
		return sendFrequency;
	}
	public void setSendFrequency(String sendFrequency) {
		this.sendFrequency = sendFrequency;
	}
	public String getParameter() {
		return parameter;
	}
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}
	public String[] getDepartments() {
		return departments;
	}
	public void setDepartments(String[] department) {
		this.departments = department;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDepartmentValue() {
		return departmentValue;
	}

	public void setDepartmentValue(String departmentValue) {
		this.departmentValue = departmentValue;
	}

	public Date getRunTimeDisplay() {
		return runTimeDisplay;
	}

	public void setRunTimeDisplay(Date runTimeDisplay) {
		this.runTimeDisplay = runTimeDisplay;
	}
}
