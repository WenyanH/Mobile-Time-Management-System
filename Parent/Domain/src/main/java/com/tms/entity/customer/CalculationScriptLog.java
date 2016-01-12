package com.tms.entity.customer;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

import com.tms.entity.CalStates;
import com.tms.entity.Company;
import com.tms.entity.ScriptEngineEnum;
import com.tms.entity.User;


/**
 *脚本
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class CalculationScriptLog {
	
	@Id
	@GenericGenerator(name = "systemUUID", strategy = "uuid2")
	@GeneratedValue(generator = "systemUUID")
	private String id;
	private String scriptKey;
	private String title;
	@Lob
	private String scriptContext;
	private ScriptEngineEnum type;
	private CalStates state;
	@Lob
	private String description;
	private Date updateTime;
	
	@ManyToOne
	private CalculationScript calculationScript;
	@ManyToOne
	private User user;
	@ManyToOne
	private Company company;
	
	public CalculationScriptLog(){}
	public CalculationScriptLog(CalculationScript calculationScript){
		this.scriptKey=calculationScript.getScriptKey();
		this.title=calculationScript.getTitle();
		this.scriptContext=calculationScript.getScriptContext();
		this.type=calculationScript.getType();
		this.state=calculationScript.getState();
		this.description=calculationScript.getDescription();
		this.updateTime=new Date();
		this.calculationScript=calculationScript;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getScriptKey() {
		return scriptKey;
	}
	public void setScriptKey(String scriptKey) {
		this.scriptKey = scriptKey;
	}
	public String getTitle() {
		return title;
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
	public void setTitle(String title) {
		this.title = title;
	}
	public String getScriptContext() {
		return scriptContext;
	}
	public void setScriptContext(String scriptContext) {
		this.scriptContext = scriptContext;
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
	public CalculationScript getCalculationScript() {
		return calculationScript;
	}
	public void setCalculationScript(CalculationScript calculationScript) {
		this.calculationScript = calculationScript;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
}
