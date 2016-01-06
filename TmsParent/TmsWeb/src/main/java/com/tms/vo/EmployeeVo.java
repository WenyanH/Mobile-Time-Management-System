package com.tms.vo;

import java.text.SimpleDateFormat;

import org.apache.commons.lang.StringUtils;

import com.tms.constant.Constants;
import com.tms.entity.Employee;
import com.tms.entity.Role;

public class EmployeeVo {
	
	private String id;

	private String password;// 用户登录密码

	private String jobNumber;// 工号

	private String firstName;

	private String lastName;

	private String middleName;
	
	private String irdNumber;// 税号

	private String departmentId;

	private String status;

	private Boolean isSupervisor;

	private Boolean isExport;
	
	private String hireOnDateValue;// 雇佣时间
	
	private String terminateDateValue;// 终止时间

	private String clockId;

	private String payId;

	private Double dailyHoursValue;
	
	private String paygroupId;
	
	private String timeRoundingId;
	
	private String positionId;

	private String jobId;
	
	private String photo;
	// Contact
	// 实际地址
	private String physicalAddr;
	// 邮寄地址
	private String postalAddr;
	// 性别
	private String gender;
	// 电话
	private String tel;
	// 手机
	private String mobile;
	// 邮箱
	private String email;
	// 传真
	private String fax;
	//姓名
	private String name;
	//标题
    private String title;    
	
	private String phone;
	
	private String departmentName;

	private String payGroupName;
	//角色
	private String roleName;
	
	public EmployeeVo(){}
	public EmployeeVo(Employee employee){
		if(StringUtils.isNotEmpty(employee.getId())){
			this.id=employee.getId();
		}
		if(StringUtils.isNotEmpty(employee.getFax())){
			this.fax=employee.getFax();
		}
		if(StringUtils.isNotEmpty(employee.getFirstName())){
			this.firstName=employee.getFirstName();
		}
		if(StringUtils.isNotEmpty(employee.getLastName())){
			this.lastName=employee.getLastName();
		}
		if(StringUtils.isNotEmpty(employee.getMiddleName())){
			this.middleName=employee.getMiddleName();
		}
		if(StringUtils.isNotEmpty(employee.getIrdNumber())){
			this.irdNumber=employee.getIrdNumber();
		}
		if(StringUtils.isNotEmpty(employee.getGender())){
			this.gender=employee.getGender();
		}
		if(StringUtils.isNotEmpty(employee.getJobNumber())){
			this.jobNumber=employee.getJobNumber();
		}
		if(StringUtils.isNotEmpty(employee.getMobile())){
			this.mobile=employee.getMobile();
		}
		if(StringUtils.isNotEmpty(employee.getName())){
			this.name=employee.getName();
		}
		if(StringUtils.isNotEmpty(employee.getPayId())){
			this.payId=employee.getPayId();
		}
		if(StringUtils.isNotEmpty(employee.getPhone())){
			this.phone=employee.getPhone();
		}
		if(StringUtils.isNotEmpty(employee.getPhoto())){
			this.photo=employee.getPhoto();
		}
		if(StringUtils.isNotEmpty(employee.getPhysicalAddr())){
			this.physicalAddr=employee.getPhysicalAddr();
		}
		if(StringUtils.isNotEmpty(employee.getPostalAddr())){
			this.postalAddr=employee.getPostalAddr();
		}
		if(StringUtils.isNotEmpty(employee.getTel())){
			this.tel=employee.getTel();
		}
		if(StringUtils.isNotEmpty(employee.getTitle())){
			this.title=employee.getTitle();
		}
		this.dailyHoursValue=employee.getDailyHours();
		if(employee.getDepartment()!=null){
			this.departmentId=employee.getDepartment().getId();
		}
		if(employee.getUser()!=null&&employee.getUser().getRoles()!=null&&employee.getUser().getRoles().size()>0){
			Role role=employee.getUser().getRoles().iterator().next();
			if(role.getName().equals(Constants.SUPERVISOR)){
				this.isSupervisor=true;
			}
		}
		this.isExport=employee.getIsExport();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		if(employee.getHireOnDate()!=null){
			this.hireOnDateValue=sdf.format(employee.getHireOnDate());
		}
		if(employee.getTerminateDate()!=null){
			this.terminateDateValue=sdf.format(employee.getTerminateDate());
		}
		if(StringUtils.isNotEmpty(employee.getClockId())){
			this.clockId=employee.getClockId();
		}
		if(employee.getPayGroup()!=null){
			this.paygroupId=employee.getPayGroup().getId();
		}
		if(employee.getPosition()!=null){
			this.positionId=employee.getPosition().getId();
		}
		if(employee.getJob()!=null){
			this.jobId=employee.getJob().getId();
		}
		if(employee.getTimeRounding()!=null){
			this.timeRoundingId=employee.getTimeRounding().getId();
		}
		if(employee.getDepartment()!=null){
			departmentName=employee.getDepartment().getDepartmentName();
		}
		if(employee.getPayGroup()!=null){
			payGroupName=employee.getPayGroup().getName();
		}
//		if(employee.getStatus()!=null){
//			this.status=employee.getStatus().name();
//		}
		if(employee.getUser()!=null){
			if(employee.getUser().getRoles()!=null&&employee.getUser().getRoles().size()>0){
				this.roleName=employee.getUser().getRoles().iterator().next().getName();
			}
			this.email=employee.getUser().getEmail();
		}
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJobNumber() {
		return jobNumber;
	}

	public void setJobNumber(String jobNumber) {
		this.jobNumber = jobNumber;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getIrdNumber() {
		return irdNumber;
	}

	public void setIrdNumber(String irdNumber) {
		this.irdNumber = irdNumber;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getIsSupervisor() {
		return isSupervisor;
	}

	public void setIsSupervisor(Boolean isSupervisor) {
		this.isSupervisor = isSupervisor;
	}

	public Boolean getIsExport() {
		return isExport;
	}

	public void setIsExport(Boolean isExport) {
		this.isExport = isExport;
	}

	public String getClockId() {
		return clockId;
	}

	public void setClockId(String clockId) {
		this.clockId = clockId;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public String getPaygroupId() {
		return paygroupId;
	}

	public void setPaygroupId(String paygroupId) {
		this.paygroupId = paygroupId;
	}

	public String getTimeRoundingId() {
		return timeRoundingId;
	}

	public void setTimeRoundingId(String timeRoundingId) {
		this.timeRoundingId = timeRoundingId;
	}

	public String getPositionId() {
		return positionId;
	}

	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHireOnDateValue() {
		return hireOnDateValue;
	}

	public void setHireOnDateValue(String hireOnDateValue) {
		this.hireOnDateValue = hireOnDateValue;
	}

	public String getTerminateDateValue() {
		return terminateDateValue;
	}

	public void setTerminateDateValue(String terminateDateValue) {
		this.terminateDateValue = terminateDateValue;
	}

	public Double getDailyHoursValue() {
		return dailyHoursValue;
	}

	public void setDailyHoursValue(Double dailyHoursValue) {
		this.dailyHoursValue = dailyHoursValue;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getPayGroupName() {
		return payGroupName;
	}
	public void setPayGroupName(String payGroupName) {
		this.payGroupName = payGroupName;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
