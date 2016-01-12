package com.tms.vo;

public class JobVo {

private String id;
	
	private String code;
	
	private String name;
	
	private String description;
	
	private String punchCode;
	
	private boolean active = true;
	
	private boolean usePunchCode = false;
	
	private String[] taskID;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPunchCode() {
		return punchCode;
	}

	public void setPunchCode(String punchCode) {
		this.punchCode = punchCode;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isUsePunchCode() {
		return usePunchCode;
	}

	public void setUsePunchCode(boolean usePunchCode) {
		this.usePunchCode = usePunchCode;
	}

	public String[] getTaskID() {
		return taskID;
	}

	public void setTaskID(String[] taskID) {
		this.taskID = taskID;
	}
	
	
	
}
