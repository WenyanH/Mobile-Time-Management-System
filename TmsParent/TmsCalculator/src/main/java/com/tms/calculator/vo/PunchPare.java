package com.tms.calculator.vo;

import java.util.Date;

public class PunchPare {

	private Date begin;

	private Date beginTime;

	private Date end;

	private Date endTime;
		
	private Date r_begin;

	private Date r_beginTime;

	private Date r_end;

	private Date r_endTime;

	public PunchPare(Date begin, Date beginTime) {
		this.begin = begin;
		this.beginTime = beginTime;
	}

	public PunchPare(Date begin, Date beginTime, Date end, Date endTime) {
		this.begin = begin;
		this.end = end;
		this.beginTime = beginTime;
		this.endTime = endTime;
	}

	public void setEndDay(Date day, Date time) {
		this.end = day;
		this.endTime = time;
	}

	public Date getBegin() {
		return begin;
	}

	public Date getEnd() {
		return end;
	}

	public Date getBeginTime() {
		return beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

}
