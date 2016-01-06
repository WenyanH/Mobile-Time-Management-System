package com.tms.entity.tms;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.tms.entity.Department;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class WorkSection {
	
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
	private String id;
	
	private String startTime;//开始时间 HH:mm
	private String endTime;//结束时间  HH:mm
	
	private String startTimeType; //Previous, Today, NextDay
	private String endTimeType; //Previous, Today, NextDay
	
	@ManyToOne
	private ScheduleRule scheduleRule;
	
	@ManyToOne
	private Department department;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getStartTimeType() {
		return startTimeType;
	}

	public void setStartTimeType(String startTimeType) {
		this.startTimeType = startTimeType;
	}

	public String getEndTimeType() {
		return endTimeType;
	}

	public void setEndTimeType(String endTimeType) {
		this.endTimeType = endTimeType;
	}

	public ScheduleRule getScheduleRule() {
		return scheduleRule;
	}

	public void setScheduleRule(ScheduleRule scheduleRule) {
		this.scheduleRule = scheduleRule;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
	
}
