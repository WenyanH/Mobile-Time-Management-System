package com.tms.calculator.context;

import java.util.ArrayList;
import java.util.Collection;

import com.tms.entity.Company;
import com.tms.entity.tms.Holiday;
import com.tms.entity.tms.TimeRounding;

public class CompanyContext {

	private Company company;

	private TimeRounding rounding;

	private Collection<Holiday> holidays = new ArrayList<>();

	public CompanyContext(Company company) {
		this.company = company;
	}

	public TimeRounding getRounding() {
		return rounding;
	}

	public void setRounding(TimeRounding rounding) {
		this.rounding = rounding;
	}

	public void addHolidays(Collection<Holiday> holidays) {
		this.holidays.addAll(holidays);
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Collection<Holiday> getHolidays() {
		return holidays;
	}

}