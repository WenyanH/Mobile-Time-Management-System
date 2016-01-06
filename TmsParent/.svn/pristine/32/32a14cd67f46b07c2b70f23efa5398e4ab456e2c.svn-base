package com.tms.vo;

import java.text.SimpleDateFormat;

import com.tms.entity.customer.CalculationScript;
import com.tms.entity.customer.CalculationScriptLog;


public class CalculationScriptVo {
	private String id;
	private String scriptKey;
	private String title;
	private String scriptContext;
	private String type;
	private String description;
	private String companyId;
	private String companyName;
	private String updateTime;
	private String state;
	public CalculationScriptVo(){}
	public CalculationScriptVo(CalculationScript calculationScript){
		this.scriptKey=calculationScript.getScriptKey();
		this.title=calculationScript.getTitle();
		this.scriptContext=calculationScript.getScriptContext();
		if(calculationScript.getType()!=null){
			this.type=calculationScript.getType().toString();
		}
		if(calculationScript.getState()!=null){
			this.state=calculationScript.getState().toString();
		}
		if(calculationScript.getCompany()!=null){
			this.companyId=calculationScript.getCompany().getId();
			this.companyName=calculationScript.getCompany().getTradingName();
		}
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(calculationScript.getUpdateTime()!=null){
			this.updateTime=sdf.format(calculationScript.getUpdateTime());
		}
	}
	public CalculationScriptVo(CalculationScriptLog calculationScript){
		this.id=calculationScript.getId();
		this.scriptKey=calculationScript.getScriptKey();
		this.title=calculationScript.getTitle();
		if(calculationScript.getType()!=null){
			this.type=calculationScript.getType().toString();
		}
		if(calculationScript.getState()!=null){
			this.state=calculationScript.getState().toString();
		}
		if(calculationScript.getCompany()!=null){
			this.companyId=calculationScript.getCompany().getId();
			this.companyName=calculationScript.getCompany().getTradingName();
		}
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(calculationScript.getUpdateTime()!=null){
			this.updateTime=sdf.format(calculationScript.getUpdateTime());
		}
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
	public void setTitle(String title) {
		this.title = title;
	}
	public String getScriptContext() {
		return scriptContext;
	}
	public void setScriptContext(String scriptContext) {
		this.scriptContext = scriptContext;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
