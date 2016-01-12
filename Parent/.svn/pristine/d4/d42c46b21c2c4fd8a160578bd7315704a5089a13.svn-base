package com.tms.calculator.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class DayPunchPare {

	private Collection<PunchPare> pares = new ArrayList<>();
	
	private Collection<PunchPare> roundedPares = new ArrayList<>();

	private Date day;

	// 未匹配上的打卡记录
	private Date expPunchDay;

	private Date expPunchTime;

	private PunchPare currentPare;
	
	private double dailyHours;	

	public DayPunchPare(Date day) {
		this.day = day;
	}

	public DayPunchPare(Date day, Collection<PunchPare> pares, Date expPunchDay, Date expPunchTime) {
		this.pares = pares;
		this.day = day;
		this.expPunchDay = expPunchDay;
		this.expPunchTime = expPunchTime;
	}

	public boolean isSameDay(Date day) {
		if (day.equals(this.day)) {
			return true;
		}
		return false;
	}

	public void add(Date day, Date time) {
		if (currentPare == null) {
			currentPare = new PunchPare(day, time);
		} else {
			currentPare.setEndDay(day, time);
			pares.add(currentPare);
			currentPare = null;
		}
	}

	public void close() {
		if (currentPare != null) {
			expPunchDay = currentPare.getBegin();
			expPunchTime = currentPare.getBeginTime();
		}
	}

	public Collection<PunchPare> getPares() {
		return pares;
	}

	public Date getDay() {
		return day;
	}

	public Date getExpPunchDay() {
		return expPunchDay;
	}

	public Date getExpPunchTime() {
		return expPunchTime;
	}

	public PunchPare getCurrentPare() {
		return currentPare;
	}

}
