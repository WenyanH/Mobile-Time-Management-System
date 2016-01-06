package com.tms.vo;

import java.text.SimpleDateFormat;

import com.tms.entity.tms.Leave;

public class LeaveVo {
	private String id;
	private String description;
	private double duration;
	private String fromLeaveTime;
	private String toLeaveTime;
	private boolean byWorkHours = false;
	private String fromDate;
	private String toDate;
	private String employeeId;
	private String typeId;
	
	public  LeaveVo(){}
	public  LeaveVo(Leave leave){
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		this.id=leave.getId();
		this.description=leave.getDescription();
		this.duration=leave.getDuration();
		this.fromLeaveTime=leave.getFromLeaveTime();
		this.toLeaveTime=leave.getToLeaveTime();
		if(leave.getFromDate()!=null){
			this.fromDate=sdf.format(leave.getFromDate());
		}
		if(leave.getToDate()!=null){
			this.toDate=sdf.format(leave.getToDate());
		}
		if(leave.getPayType()!=null){
			this.typeId=leave.getPayType().getId();
    	}
    	if(leave.getEmployee()!=null){
			this.employeeId=leave.getEmployee().getId();
    	}
    	this.byWorkHours=leave.isByWorkHours();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getDuration() {
		return duration;
	}
	public void setDuration(double duration) {
		this.duration = duration;
	}
	public String getFromLeaveTime() {
		return fromLeaveTime;
	}
	public void setFromLeaveTime(String fromLeaveTime) {
		this.fromLeaveTime = fromLeaveTime;
	}
	public String getToLeaveTime() {
		return toLeaveTime;
	}
	public void setToLeaveTime(String toLeaveTime) {
		this.toLeaveTime = toLeaveTime;
	}
	public boolean isByWorkHours() {
		return byWorkHours;
	}
	public void setByWorkHours(boolean byWorkHours) {
		this.byWorkHours = byWorkHours;
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
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
}
