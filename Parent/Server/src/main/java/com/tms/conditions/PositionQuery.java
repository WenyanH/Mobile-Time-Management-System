package com.tms.conditions;

public class PositionQuery {
	
	private String id;
	
	private String code;
	
	private Boolean active = true;
	
	private String name;
	
	private String punchCode;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPunchCode() {
		return punchCode;
	}

	public void setPunchCode(String punchCode) {
		this.punchCode = punchCode;
	}
	
	
}
