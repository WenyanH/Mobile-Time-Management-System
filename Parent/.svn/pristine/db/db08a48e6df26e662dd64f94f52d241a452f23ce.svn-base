package com.tms.entity.customer;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.tms.entity.CalStates;
import com.tms.entity.Company;
import com.tms.entity.ScriptEngineEnum;

/**
 *脚本
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class CalculationScript {
	@Id
	private String scriptKey;
	private String title;
	@Lob
	private String scriptContext;
	private ScriptEngineEnum type;
	private CalStates state;
	@Lob
	private String description;
	private Date updateTime;
	
	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, orphanRemoval = true, mappedBy = "calculationScript")
	private Set<CalculationScriptLog> calculationScriptLogs = new HashSet<>();
	@ManyToOne
	private Company company;
	
	public String getScriptKey() {
		return scriptKey;
	}
	public void setScriptKey(String scriptKey) {
		this.scriptKey = scriptKey;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getScriptContext() {
		return scriptContext;
	}
	public void setScriptContext(String scriptContext) {
		this.scriptContext = scriptContext;
	}
	public ScriptEngineEnum getType() {
		return type;
	}
	public void setType(ScriptEngineEnum type) {
		this.type = type;
	}
	public CalStates getState() {
		return state;
	}
	public void setState(CalStates state) {
		this.state = state;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Set<CalculationScriptLog> getCalculationScriptLogs() {
		return calculationScriptLogs;
	}
	public void setCalculationScriptLogs(
			Set<CalculationScriptLog> calculationScriptLogs) {
		this.calculationScriptLogs = calculationScriptLogs;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
}
