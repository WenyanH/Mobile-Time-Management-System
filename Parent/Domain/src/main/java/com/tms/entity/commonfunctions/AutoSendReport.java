package com.tms.entity.commonfunctions;

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
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tms.entity.Department;
import com.tms.entity.customer.ReportType;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class AutoSendReport {
	@Id
	@GenericGenerator(name = "systemUUID", strategy = "uuid2")
	@GeneratedValue(generator = "systemUUID")
	private String id;
	
	private ReportType reportType;
	
	private Date runatTime;
	
	private String sendTo;
	
	private int  sendFrequency;
	
	private String parameter;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "autosendreport")
	@JsonIgnore
	private Set<Department> department = new HashSet<>();

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

	public Date getRunatTime() {
		return runatTime;
	}

	public void setRunatTime(Date runatTime) {
		this.runatTime = runatTime;
	}

	public String getSendTo() {
		return sendTo;
	}

	public void setSendTo(String sendTo) {
		this.sendTo = sendTo;
	}

	public int getSendFrequency() {
		return sendFrequency;
	}

	public void setSendFrequency(int sendFrequency) {
		this.sendFrequency = sendFrequency;
	}

	public String getParameter() {
		return parameter;
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

	public Set<Department> getDepartment() {
		return department;
	}

	public void setDepartment(Set<Department> department) {
		this.department = department;
	}
}
