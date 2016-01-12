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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tms.entity.Company;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "code", "name", "company_id" }))
public class PayType {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
	private String id;

	private String code;

	private String name;

	private String exportCode; 

	private boolean active = true;

	private boolean leaveStatus = false;

	private boolean convertToDay = false;

	private double ctDay;

	@ManyToOne
	private Company company;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "payType")
	@JsonIgnore
	private Set<Leave> leave = new HashSet<>();
	

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

	public String getExportCode() {
		return exportCode;
	}

	public void setExportCode(String exportCode) {
		this.exportCode = exportCode;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isLeaveStatus() {
		return leaveStatus;
	}

	public void setLeaveStatus(boolean leaveStatus) {
		this.leaveStatus = leaveStatus;
	}

	public boolean isConvertToDay() {
		return convertToDay;
	}

	public void setConvertToDay(boolean convertToDay) {
		this.convertToDay = convertToDay;
	}

	public Double getCtDay() {
		return ctDay;
	}

	public void setCtDay(Double ctDay) {
		this.ctDay = ctDay;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Set<Leave> getLeave() {
		return leave;
	}

	public void setLeave(Set<Leave> leave) {
		this.leave = leave;
	}
	
}
