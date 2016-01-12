package com.tms.vo;

import com.tms.entity.tms.ScheduleRule;
import com.tms.entity.tms.WorkSection;


public class ScheduleRuleVo {
	private String id;
	
	private String title;
	private Boolean isOffDay;
	
	private Integer breakTime;
	private Integer order;
	
	private WorkSection[] workSections;
	
	public ScheduleRuleVo(){}
	public ScheduleRuleVo(ScheduleRule scheduleRule){
		this.id=scheduleRule.getId();
		
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Boolean getIsOffDay() {
		return isOffDay;
	}
	public void setIsOffDay(Boolean isOffDay) {
		this.isOffDay = isOffDay;
	}
	public Integer getBreakTime() {
		return breakTime;
	}
	public void setBreakTime(Integer breakTime) {
		this.breakTime = breakTime;
	}
	public WorkSection[] getWorkSections() {
		return workSections;
	}
	public void setWorkSections(WorkSection[] workSections) {
		this.workSections = workSections;
	}
	public Integer getOrder() {
		return order;
	}
	public void setOrder(Integer order) {
		this.order = order;
	}

}
