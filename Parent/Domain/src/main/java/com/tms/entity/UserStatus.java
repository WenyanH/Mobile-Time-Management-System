package com.tms.entity;

public enum UserStatus {
	Active("Active"),
	Closed("Closed"),
	Inactive("Inactive");
	public  String name;
	private UserStatus(String name){
		this.name=name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
