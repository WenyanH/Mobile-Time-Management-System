package com.tms.vo;

import java.text.SimpleDateFormat;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.tms.constant.Constants;
import com.tms.entity.Employee;
import com.tms.entity.Resource;
import com.tms.entity.Role;
import com.tms.entity.User;

public class UserVo {
	private String id;

	private String email;
	
	private String status;
	
	private String password;// 用户登录密码

	private String firstName;

	private String lastName;
	
	private String roleId;
	
	private String roleName;
	
	private String employeeId;
	
	private String exportDevisions;
	
	private String[] departments;
	
	private String[] funs;
	
	private Boolean isEmployee;
	
	private Boolean changePassword;
	/**
	 *employee 
	 */
	private String jobNumber;// 工号

	private String middleName;
	
	private String irdNumber;// 税号

	private String departmentId;

	private Boolean isSupervisor;

	private Boolean isExport;
	
	private String hireOnDateValue;// 雇佣时间
	
	private String terminateDateValue;// 终止时间

	private String clockId;

	private String payId;

	private Double dailyHoursValue;
	
	private String paygroupId;
	
	private String timeRoundingId;
	
	private String timeRoundingName;
	
	private String positionId;

	private String jobId;
	
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
	private String contactEmail;
	// 传真
	private String fax;
	//姓名
	private String name;
	//标题
    private String title;    
	
	private String phone;
	
	private String photo;
	
	private String departmentName;

	private String payGroupName;
	
	public UserVo(){}
	public UserVo(User user){
		
		this.isEmployee=user.getIsEmployee();
		
		if(user.getEmployee()!=null&&user.getEmployee().size()>0){
			Employee e = user.getEmployee().iterator().next();
			if(e.getDepartment()!=null){
				this.departmentName = e.getDepartment().getNumber()+" - "+e.getDepartment().getDepartmentName();
			}
		}
		
		if(user.getEmployee()!=null&&user.getEmployee().size()>0){
			Employee e = user.getEmployee().iterator().next();
			if(e.getPayGroup()!=null){
				this.payGroupName = e.getPayGroup().getName();
			}
		}
		
		if(StringUtils.isNotEmpty(user.getId())){
			this.id=user.getId();
		}
		if(StringUtils.isNotEmpty(user.getEmail())){
			this.email=user.getEmail();
		}
		if(StringUtils.isNotEmpty(user.getExportDevisions())){
			this.exportDevisions=user.getExportDevisions();
		}
		if(StringUtils.isNotEmpty(user.getPassword())){
			this.password=user.getPassword();
		}
		this.status=user.getStatus().name;
		if(user.getRoles()!=null&&user.getRoles().size()>0){
			Role role=user.getRoles().iterator().next();
			if(role.getName().equals(Constants.SUPERVISOR)){
				isSupervisor=true;
			}
			this.roleName = role.getName();
		}
		if(CollectionUtils.isNotEmpty(user.getResources())){
			this.funs=new String[user.getResources().size()];
			int index=0;
			for(Resource resource:user.getResources()){
				if(index<user.getResources().size()){
					funs[index]=resource.getId();
					index++;
				}
			}
		}
		if(user.getEmployee()!=null&&user.getEmployee().iterator().hasNext()){
			Employee employee=user.getEmployee().iterator().next();
			if(StringUtils.isNotEmpty(employee.getId())){
				this.employeeId=employee.getId();
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
				timeRoundingName=employee.getTimeRounding().getName();
			}
		}
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
	public String getExportDevisions() {
		return exportDevisions;
	}
	public void setExportDevisions(String exportDevisions) {
		this.exportDevisions = exportDevisions;
	}
	public String[] getDepartments() {
		return departments;
	}
	public void setDepartments(String[] departments) {
		this.departments = departments;
	}
	public String[] getFuns() {
		return funs;
	}
	public void setFuns(String[] funs) {
		this.funs = funs;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJobNumber() {
		return jobNumber;
	}
	public void setJobNumber(String jobNumber) {
		this.jobNumber = jobNumber;
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
	public Double getDailyHoursValue() {
		return dailyHoursValue;
	}
	public void setDailyHoursValue(Double dailyHoursValue) {
		this.dailyHoursValue = dailyHoursValue;
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
	public String getContactEmail() {
		return contactEmail;
	}
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
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
	public Boolean getIsEmployee() {
		return isEmployee;
	}
	public void setIsEmployee(Boolean isEmployee) {
		this.isEmployee = isEmployee;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Boolean getChangePassword() {
		return changePassword;
	}
	public void setChangePassword(Boolean changePassword) {
		this.changePassword = changePassword;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
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
	public String getTimeRoundingName() {
		return timeRoundingName;
	}
	public void setTimeRoundingName(String timeRoundingName) {
		this.timeRoundingName = timeRoundingName;
	}
}
