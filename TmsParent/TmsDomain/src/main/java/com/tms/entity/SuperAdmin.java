package com.tms.entity;

public enum SuperAdmin {
	NO(0, "NO"), YES(1,"YES");
	public int key;
	public String value;
	private SuperAdmin(int key, String value) {
		this.key = key;
		this.value = value;
	}
	public static SuperAdmin get(int key) {
		SuperAdmin[] values = SuperAdmin.values();
		for (SuperAdmin object : values) {
			if (object.key == key) {
				return object;
			}
		}
		return null;
	}
}
