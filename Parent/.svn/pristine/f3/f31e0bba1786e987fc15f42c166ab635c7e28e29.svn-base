package com.tms.dao.employeeholiday;

import java.util.Date;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.EmployeeHoliday;

public interface EHolidayDao extends IDao<EmployeeHoliday, String>{

	public abstract EmployeeHoliday findHolidayByDate(Date date, String companyId);
	
	public abstract void removeHolidayByDate(Date date, String companyId);
}
