package com.tms.entity.customer;

public enum ReportType {
	TimeCardReport("TimeCard Report"),
	TimeCardDetailsReport("TimeCard Details Report"),
	EmployeesListReport("Employees List Report"),
	ExceptionsReport("Exceptions Report"),
	OnsiteReport("Onsite Report"),
	LeaveReport("Leave Report"),
	JobHoursSummaryReport("Job Hours Summary Report"),
	JobHoursDetailsReport("Job Hours Details Report"),
	AuditingReport("Auditing Report");
	private String name;
	
	public String getName() {
		return name;
	}
	
	private ReportType(String name){
		this.name=name;
	}
}
