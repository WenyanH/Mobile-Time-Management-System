package com.tms.utils.report.reportVo;

import java.text.SimpleDateFormat;
import java.util.Date;


import com.tms.entity.Employee;
import com.tms.entity.Role;
import com.tms.entity.User;
import com.tms.utils.report.pdf.AbstractDocumentVo;

public class EmployeeReportVo extends AbstractDocumentVo{

	private String reportTitle;
	
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
	
	private String createTime;
	public EmployeeReportVo(){}
	public EmployeeReportVo(User user,String reportTitle){
		this.reportTitle=reportTitle;
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
		this.email=user.getEmail();
		this.exportDevisions=user.getExportDevisions();
		this.status=user.getStatus().name;
		if(user.getRoles()!=null&&user.getRoles().size()>0){
			Role role=user.getRoles().iterator().next();
			this.roleName = role.getName();
		}
		if(user.getEmployee()!=null&&user.getEmployee().iterator().hasNext()){
			Employee employee=user.getEmployee().iterator().next();
			this.createTime=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			this.employeeId=employee.getId();
			this.fax=employee.getFax();
			this.firstName=employee.getFirstName();
			this.lastName=employee.getLastName();
			this.middleName=employee.getMiddleName();
			this.irdNumber=employee.getIrdNumber();
			this.gender=employee.getGender();
			this.jobNumber=employee.getJobNumber();
			this.mobile=employee.getMobile();
			this.name=employee.getName();
			this.payId=employee.getPayId();
			this.phone=employee.getPhone();
			this.photo=employee.getPhoto();
			this.physicalAddr=employee.getPhysicalAddr();
			this.postalAddr=employee.getPostalAddr();
			this.tel=employee.getTel();
			this.title=employee.getTitle();
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
			this.clockId=employee.getClockId();
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
	@Override
	public String findPrimaryKey() {
		return this.jobNumber;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	
}
