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
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class User {

	@Id
	@GenericGenerator(name = "systemUUID", strategy = "uuid2")
	@GeneratedValue(generator = "systemUUID")
	private String id;

	private UserStatus status = UserStatus.Active;
	// 用户登录密码
	private String password;

	private Boolean isEmployee;

	// 登录邮箱
	private String email;

	@ManyToOne
	private Company company;

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL}, orphanRemoval = true, mappedBy = "user")
	@JsonIgnore
	private Set<Employee> employee = new HashSet<>();

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<Department> management = new HashSet<>();// user可以管理部门

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<Role> roles = new HashSet<>();

	@ManyToMany(fetch = FetchType.LAZY, cascade = { CascadeType.MERGE })
	@JsonIgnore
	private Set<Resource> resources = new HashSet<>();

	private Date createTime = new Date();

	private boolean isSys;// 公司默认用户 true
	
	private UserSource source;

	@Lob
	private String exportDevisions;

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	public Set<Department> getManagement() {
		return management;
	}

	public void setManagement(Set<Department> management) {
		this.management = management;
	}

	public Set<Employee> getEmployee() {
		return employee;
	}

	public void setEmployee(Set<Employee> employee) {
		this.employee = employee;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}

	public boolean isSys() {
		return isSys;
	}

	public void setSys(boolean isSys) {
		this.isSys = isSys;
	}

	public String getExportDevisions() {
		return exportDevisions;
	}

	public void setExportDevisions(String exportDevisions) {
		this.exportDevisions = exportDevisions;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Boolean getIsEmployee() {
		return isEmployee;
	}

	public void setIsEmployee(Boolean isEmployee) {
		this.isEmployee = isEmployee;
	}

	public UserSource getSource() {
		return source;
	}

	public void setSource(UserSource source) {
		this.source = source;
	}
	
	

}
