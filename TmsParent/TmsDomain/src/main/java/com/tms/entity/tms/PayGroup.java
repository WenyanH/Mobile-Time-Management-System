package com.tms.entity.tms;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.tms.entity.Company;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@Table(uniqueConstraints = @UniqueConstraint(columnNames = { "code", "name", "company_id" }))
public class PayGroup {

	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid2")
	private String id;

	private String code;

	private String name;

	private double dailyHours;

	private Date createdOn;

	private boolean acceptEA = false;

	private boolean acceptLD = false;

	private boolean checkLA = false;

	private boolean checkED = false;

	private boolean supervisorMAOT = false;

	private boolean active = true;

	private PayPeriod payPeriod = PayPeriod.Weekly;
	
	private Date startTime = new Date();

	@Lob
	private String Memo;

	@ManyToOne
	private Company company;
	
//	@ManyToOne
//	private Company bindCompany;

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

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public double getDailyHours() {
		return dailyHours;
	}

	public void setDailyHours(double dailyHours) {
		this.dailyHours = dailyHours;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public boolean isAcceptEA() {
		return acceptEA;
	}

	public void setAcceptEA(boolean acceptEA) {
		this.acceptEA = acceptEA;
	}

	public boolean isAcceptLD() {
		return acceptLD;
	}

	public void setAcceptLD(boolean acceptLD) {
		this.acceptLD = acceptLD;
	}

	public boolean isCheckLA() {
		return checkLA;
	}

	public void setCheckLA(boolean checkLA) {
		this.checkLA = checkLA;
	}

	public boolean isCheckED() {
		return checkED;
	}

	public void setCheckED(boolean checkED) {
		this.checkED = checkED;
	}

	public boolean isSupervisorMAOT() {
		return supervisorMAOT;
	}

	public void setSupervisorMAOT(boolean supervisorMAOT) {
		this.supervisorMAOT = supervisorMAOT;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMemo() {
		return Memo;
	}

	public void setMemo(String memo) {
		Memo = memo;
	}

	public PayPeriod getPayPeriod() {
		return payPeriod;
	}

	public void setPayPeriod(PayPeriod payPeriod) {
		this.payPeriod = payPeriod;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

//	public Company getBindCompany() {
//		return bindCompany;
//	}
//
//	public void setBindCompany(Company bindCompany) {
//		this.bindCompany = bindCompany;
//	}
//	
//	
}
