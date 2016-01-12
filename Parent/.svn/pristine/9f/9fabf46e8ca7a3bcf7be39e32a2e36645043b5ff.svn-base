package com.tms.dao.employeeholiday;

import java.util.Date;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.EmployeeHoliday;

@Repository
public class EHolidayDaoImpl extends AbsDao<EmployeeHoliday, String> implements EHolidayDao {

	private static final String FIND_HOLIDAY = " from EmployeeHoliday where date = ? and company.id = ?";

	@Override
	public EmployeeHoliday findHolidayByDate(Date date, String companyId) {
		return findUnique(FIND_HOLIDAY, new Hints(), date, companyId);
	}

	@Override
	public void removeHolidayByDate(Date date, String companyId) {
		EmployeeHoliday holiday = findUnique(FIND_HOLIDAY, new Hints(), date, companyId);
		if (holiday != null) {
			remove(holiday.getId());
		}
	}
	
	

}
