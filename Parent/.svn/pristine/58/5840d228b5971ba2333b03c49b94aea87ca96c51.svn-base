package com.tms.entity;

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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.tms.entity.commonfunctions.PayrollTransfer;
import com.tms.entity.customer.CalculationScript;
import com.tms.entity.customer.Features;
import com.tms.entity.customer.OutFaceType;
import com.tms.entity.customer.ReportManagement;
import com.tms.entity.customer.TimeZone;
import com.tms.entity.tms.Holiday;
import com.tms.entity.tms.Job;
import com.tms.entity.tms.Leave;
import com.tms.entity.tms.PayGroup;
import com.tms.entity.tms.PayType;
import com.tms.entity.tms.Position;
import com.tms.entity.tms.Schedule;
import com.tms.entity.tms.TimeRounding;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Company {

	@Id
	@GenericGenerator(name = "systemUUID", strategy = "uuid2")
	@GeneratedValue(generator = "systemUUID")
	private String id;
	
	private String number;
	// 公司名称
	private String tradingName;

	private String domain;

	private Long licenses;

	private String token;

	private Date createdOn;

	private Date openedOn;

	private Date closedOn;

	// 公司实际地址
	private String physicalAddr;
	// 邮寄地址
	private String postalAddr;

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<User> user = new HashSet<>();

	private String name;
	private String title;
	private String email;// 邮箱
	private String phone;// 电话
	private String mobile;// 手机
	private String fax;// 传真

	private boolean pause = false;

	private boolean payrollEnabled = false;// 是否支持Payroll

	private boolean teamEnabled = false;// 是否支持Team

	private CompanyStatus status = CompanyStatus.Active;

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<Holiday> holiday = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<Position> position = new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<Job> job = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<PayGroup> payGroup = new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<PayType> payType = new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<TimeRounding> timeRounding = new HashSet<>();

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<Leave> leave = new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<Schedule> schedule = new HashSet<>();
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<Features> features = new HashSet<>();

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<OutFaceType> outFaceTypes = new HashSet<>();

	@ManyToOne
	private TimeZone timeZone;

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<ReportManagement> reportManagements = new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<CompanyStructure> companyStructure = new HashSet<>();
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, orphanRemoval = true, mappedBy = "company")
	@JsonIgnore
	private Set<PayrollTransfer> payrollTransfer = new HashSet<>();
	
	private String dayEnd;
	private String dayBegin;
	
	private boolean perviousDay = false;	
	private boolean nextDay = false;
	
	
	@ManyToOne
	@JsonIgnore
	private Position bindPosition = null;
	
	@ManyToOne
	@JsonIgnore
	private Job bindJob = null;

	@ManyToOne
	@JsonIgnore
	private PayGroup bindPayGroup = null;
	
	@ManyToOne
	@JsonIgnore
	private TimeRounding bindTimeRounding =null;
	


	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<CalculationScript> calculationScripts = new HashSet<>();
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTradingName() {
		return tradingName;
	}

	public void setTradingName(String tradingName) {
		this.tradingName = tradingName;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getPhysicalAddr() {
		return physicalAddr;
	}

	public void setPhysicalAddr(String physicalAddr) {
		this.physicalAddr = physicalAddr;
	}

	public String getPostalAddr() {
		return postalAddr;
	}

	public void setPostalAddr(String postalAddr) {
		this.postalAddr = postalAddr;
	}

	public Set<User> getUser() {
		return user;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public boolean isPause() {
		return pause;
	}

	public void setPause(boolean pause) {
		this.pause = pause;
	}

	public CompanyStatus getStatus() {
		return status;
	}

	public void setStatus(CompanyStatus status) {
		this.status = status;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Long getLicenses() {
		return licenses;
	}

	public void setLicenses(Long licenses) {
		this.licenses = licenses;
	}

	public Set<Position> getPosition() {
		return position;
	}

	public void setPosition(Set<Position> position) {
		this.position = position;
	}

	public Set<Holiday> getHoliday() {
		return holiday;
	}

	public void setHoliday(Set<Holiday> holiday) {
		this.holiday = holiday;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public Date getOpenedOn() {
		return openedOn;
	}

	public void setOpenedOn(Date openedOn) {
		this.openedOn = openedOn;
	}

	public Date getClosedOn() {
		return closedOn;
	}

	public void setClosedOn(Date closedOn) {
		this.closedOn = closedOn;
	}

	public boolean isPayrollEnabled() {
		return payrollEnabled;
	}

	public void setPayrollEnabled(boolean payrollEnabled) {
		this.payrollEnabled = payrollEnabled;
	}

	public boolean isTeamEnabled() {
		return teamEnabled;
	}

	public void setTeamEnabled(boolean teamEnabled) {
		this.teamEnabled = teamEnabled;
	}

	public Set<Features> getFeatures() {
		return features;
	}

	public void setFeatures(Set<Features> features) {
		this.features = features;
	}

	public Set<OutFaceType> getOutFaceTypes() {
		return outFaceTypes;
	}

	public void setOutFaceTypes(Set<OutFaceType> outFaceTypes) {
		this.outFaceTypes = outFaceTypes;
	}

	public TimeZone getTimeZone() {
		return timeZone;
	}

	public void setTimeZone(TimeZone timeZone) {
		this.timeZone = timeZone;
	}

	public Set<ReportManagement> getReportManagements() {
		return reportManagements;
	}

	public void setReportManagements(Set<ReportManagement> reportManagements) {
		this.reportManagements = reportManagements;
	}

	public String getDayBegin() {
		return dayBegin;
	}

	public void setDayBegin(String dayBegin) {
		this.dayBegin = dayBegin;
	}

	public boolean isPerviousDay() {
		return perviousDay;
	}

	public void setPerviousDay(boolean perviousDay) {
		this.perviousDay = perviousDay;
	}

	public String getDayEnd() {
		return dayEnd;
	}

	public void setDayEnd(String dayEnd) {
		this.dayEnd = dayEnd;
	}

	public boolean isNextDay() {
		return nextDay;
	}

	public void setNextDay(boolean nextDay) {
		this.nextDay = nextDay;
	}

	public Set<PayGroup> getPayGroup() {
		return payGroup;
	}

	public void setPayGroup(Set<PayGroup> payGroup) {
		this.payGroup = payGroup;
	}

	public Set<PayType> getPayType() {
		return payType;
	}

	public void setPayType(Set<PayType> payType) {
		this.payType = payType;
	}

	public Set<Job> getJob() {
		return job;
	}

	public void setJob(Set<Job> job) {
		this.job = job;
	}

	public Set<Leave> getLeave() {
		return leave;
	}

	public void setLeave(Set<Leave> leave) {
		this.leave = leave;
	}

	public Position getBindPosition() {
		return bindPosition;
	}

	public void setBindPosition(Position bindPosition) {
		this.bindPosition = bindPosition;
	}

	public Job getBindJob() {
		return bindJob;
	}

	public void setBindJob(Job bindJob) {
		this.bindJob = bindJob;
	}

	public TimeRounding getBindTimeRounding() {
		return bindTimeRounding;
	}

	public void setBindTimeRounding(TimeRounding bindTimeRounding) {
		this.bindTimeRounding = bindTimeRounding;
	}

	public void setBindPayGroup(PayGroup bindPayGroup) {
		this.bindPayGroup = bindPayGroup;
	}

	public PayGroup getBindPayGroup() {
		return bindPayGroup;
	}

	public Set<TimeRounding> getTimeRounding() {
		return timeRounding;
	}

	public void setTimeRounding(Set<TimeRounding> timeRounding) {
		this.timeRounding = timeRounding;
	}

	public Set<Schedule> getSchedule() {
		return schedule;
	}

	public void setSchedule(Set<Schedule> schedule) {
		this.schedule = schedule;
	}

	public Set<CompanyStructure> getCompanyStructure() {
		return companyStructure;
	}

	public void setCompanyStructure(Set<CompanyStructure> companyStructure) {
		this.companyStructure = companyStructure;
	}

	public Set<PayrollTransfer> getPayrollTransfer() {
		return payrollTransfer;
	}

	public void setPayrollTransfer(Set<PayrollTransfer> payrollTransfer) {
		this.payrollTransfer = payrollTransfer;
	}

	public Set<CalculationScript> getCalculationScripts() {
		return calculationScripts;
	}

	public void setCalculationScripts(Set<CalculationScript> calculationScripts) {
		this.calculationScripts = calculationScripts;
	}
	
}
