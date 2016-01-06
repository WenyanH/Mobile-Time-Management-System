package com.tms.calculator.actors.msg;

import java.util.Date;

public class CalMsg {

	private String uid;

	private Date from;

	private Date to;

	public CalMsg(String uid, Date from, Date to) {
		this.uid = uid;
		this.from = from;
		this.to = to;
	}

	public String getUid() {
		return uid;
	}

	public Date getFrom() {
		return from;
	}

	public Date getTo() {
		return to;
	}
	
}