package com.tms.vo;

import java.util.Date;

import com.tms.entity.tms.DayType;
import com.tms.entity.tms.Schedule;

public class ScheduleVo {
	 	private String id;	
		private String code;
		private String name;
		private Boolean active = true;
		
		private String periodType;
		private Integer periods;	
		private Integer days;
		private Date startDate;
		private Boolean workOnHoliday = false;
		
		private String diffPeriodId;
		
		private Integer dayStart;//day范围 开始
		private Integer dayEnd;//day范围 结束
		private DayType dayStartType; //Previous, Today, NextDay
		private DayType dayEndType; //Previous, Today, NextDay
		
		private ScheduleRuleVo[] scheduleRules;

		public ScheduleVo(){}
		public ScheduleVo(Schedule schedule){
			this.id=schedule.getId();
			this.code=schedule.getCode();
			this.name=schedule.getName();

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
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public Boolean getActive() {
			return active;
		}
		public void setActive(Boolean active) {
			this.active = active;
		}
		public String getPeriodType() {
			return periodType;
		}
		public void setPeriodType(String periodType) {
			this.periodType = periodType;
		}
		public Integer getPeriods() {
			return periods;
		}
		public void setPeriods(Integer periods) {
			this.periods = periods;
		}
		public Integer getDays() {
			return days;
		}
		public void setDays(Integer days) {
			this.days = days;
		}
		public Date getStartDate() {
			return startDate;
		}
		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}
		public Boolean getWorkOnHoliday() {
			return workOnHoliday;
		}
		public void setWorkOnHoliday(Boolean workOnHoliday) {
			this.workOnHoliday = workOnHoliday;
		}
		public String getDiffPeriodId() {
			return diffPeriodId;
		}
		public void setDiffPeriodId(String diffPeriodId) {
			this.diffPeriodId = diffPeriodId;
		}
		public Integer getDayStart() {
			return dayStart;
		}
		public void setDayStart(Integer dayStart) {
			this.dayStart = dayStart;
		}
		public Integer getDayEnd() {
			return dayEnd;
		}
		public void setDayEnd(Integer dayEnd) {
			this.dayEnd = dayEnd;
		}
		public DayType getDayStartType() {
			return dayStartType;
		}
		public void setDayStartType(DayType dayStartType) {
			this.dayStartType = dayStartType;
		}
		public DayType getDayEndType() {
			return dayEndType;
		}
		public void setDayEndType(DayType dayEndType) {
			this.dayEndType = dayEndType;
		}
		public ScheduleRuleVo[] getScheduleRules() {
			return scheduleRules;
		}
		public void setScheduleRules(ScheduleRuleVo[] scheduleRules) {
			this.scheduleRules = scheduleRules;
		}
		
}
