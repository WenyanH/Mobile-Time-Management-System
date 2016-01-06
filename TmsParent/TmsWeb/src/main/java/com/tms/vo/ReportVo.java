package com.tms.vo;

import java.text.SimpleDateFormat;

import com.tms.entity.customer.Report;
public class ReportVo {
	
	private String id;
	private String reportType;
	private String paging;
	private String sort;
	private String payGroupName;
	private String payGroupId;
	private String updateTime;
	private String departmentId;
	private String endDate;
	private String startDate;
	private String[] type;
	public ReportVo(){}
	public ReportVo(Report report){
		this.id=report.getId();
		this.reportType=report.getReportType().name();
		this.paging=report.getPaging();
		this.sort=report.getSort();
		if(report.getPayGroup()!=null){
			this.payGroupName=report.getPayGroup().getName();
			this.payGroupId=report.getPayGroup().getId();
		}
		if(report.getUpdateTime()!=null){
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
			this.updateTime=sdf.format(report.getUpdateTime());
		}
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPaging() {
		return paging;
	}
	public void setPaging(String paging) {
		this.paging = paging;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getPayGroupName() {
		return payGroupName;
	}
	public void setPayGroupName(String payGroupName) {
		this.payGroupName = payGroupName;
	}
	public String getPayGroupId() {
		return payGroupId;
	}
	public void setPayGroupId(String payGroupId) {
		this.payGroupId = payGroupId;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String[] getType() {
		return type;
	}
	public void setType(String[] type) {
		this.type = type;
	}
}
