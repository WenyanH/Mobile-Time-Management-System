package com.tms.entity.tms;

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

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class ScheduleRule {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
	private String id;
	
	private String title;
	private Boolean isOffDay;
	
	private Integer breakTime;
	private Integer order;
	
	@ManyToOne
	private Schedule schedule;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, orphanRemoval = true, mappedBy = "scheduleRule") 
	@JsonIgnore
	private Set<WorkSection> workSections = new HashSet<>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public void setWorkSections(Set<WorkSection> workSections) {
		this.workSections = workSections;
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

	public Schedule getSchedule() {
		return schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Set<WorkSection> getWorkSections() {
		return workSections;
	}

	public void setWorkSection(Set<WorkSection> workSections) {
		this.workSections = workSections;
	}

	
}
