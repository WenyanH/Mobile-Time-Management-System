package com.tms.entity.tms;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tms.entity.Company;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)

public class Schedule {
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
    private String id;	
	private String code;
	private String name;
	private Boolean active = true;
	
	@ManyToOne
	private Schedule schedule;
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, mappedBy = "schedule")
	@JsonIgnore
	private Set<Schedule> diffPeriod = new HashSet<>();
	
	private SchedulePeriod periodType = SchedulePeriod.Weekly;
	
	private Integer periods;	
	private Integer days;
	private Date startDate;
	private Boolean workOnHoliday = false;
	
	private Integer dayStart;//day范围 开始
	private Integer dayEnd;//day范围 结束
	private DayType dayStartType; //Previous, Today, NextDay
	private DayType dayEndType; //Previous, Today, NextDay
	
	
	@ManyToOne
	private Company company;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, orphanRemoval = true, mappedBy = "schedule")
	private Set<ScheduleRule> scheduleRules = new HashSet<>();

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

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Set<Schedule> getDiffPeriod() {
		return diffPeriod;
	}

	public void setDiffPeriod(Set<Schedule> diffPeriod) {
		this.diffPeriod = diffPeriod;
	}

	public SchedulePeriod getPeriodType() {
		return periodType;
	}

	public void setPeriodType(SchedulePeriod periodType) {
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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Set<ScheduleRule> getScheduleRules() {
		return scheduleRules;
	}

	public void setScheduleRules(Set<ScheduleRule> scheduleRules) {
		this.scheduleRules = scheduleRules;
	}
	

	
}
