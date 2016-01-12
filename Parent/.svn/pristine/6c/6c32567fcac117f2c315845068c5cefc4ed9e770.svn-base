package com.tms.dao.holiday;
import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.Holiday;


public interface HolidayDao extends IDao<Holiday, String>{

	public abstract Boolean validateCodeExist(String code, String companyId);

	public abstract List<Holiday> findAllHoliday(String companyId);

	
}
