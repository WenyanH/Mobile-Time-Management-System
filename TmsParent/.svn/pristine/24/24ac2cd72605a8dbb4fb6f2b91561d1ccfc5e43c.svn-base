package com.tms.entity.punch;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class PunchRecord {

	@Id
	@GenericGenerator(name = "systemUUID", strategy = "uuid2")
	@GeneratedValue(generator = "systemUUID")
	private String id;
	
	private String puid;
	
	private PunchType type;

	private String code;
		
	private Date punchDay;
	
	private Date punchTime;

	private AuthType authType;

	private String workcode;

	private String status;
	
	//补卡人员UID
	private String uid;
		
	//补卡原因
	private String reason;
	
	// 补卡时间
	private Date date;
	
	// 考勤机序列号（目前这期没有设备管理功能暂不需要）
	private String machineSer;
	
	// 考勤机名称（目前这期没有设备管理功能暂不需要）
	private String machineName;
	
	// 考勤机所在地（目前这期没有设备管理功能暂不需要）
	private String machineLocation;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public PunchType getType() {
		return type;
	}

	public void setType(PunchType type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getPunchTime() {
		return punchTime;
	}

	public void setPunchTime(Date punchTime) {
		this.punchTime = punchTime;
	}

	public AuthType getAuthType() {
		return authType;
	}

	public void setAuthType(AuthType authType) {
		this.authType = authType;
	}

	public String getWorkcode() {
		return workcode;
	}

	public void setWorkcode(String workcode) {
		this.workcode = workcode;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getMachineSer() {
		return machineSer;
	}

	public void setMachineSer(String machineSer) {
		this.machineSer = machineSer;
	}

	public String getMachineName() {
		return machineName;
	}

	public void setMachineName(String machineName) {
		this.machineName = machineName;
	}

	public String getMachineLocation() {
		return machineLocation;
	}

	public void setMachineLocation(String machineLocation) {
		this.machineLocation = machineLocation;
	}

	public String getPuid() {
		return puid;
	}

	public void setPuid(String puid) {
		this.puid = puid;
	}

	public Date getPunchDay() {
		return punchDay;
	}

	public void setPunchDay(Date punchDay) {
		this.punchDay = punchDay;
	}

}
