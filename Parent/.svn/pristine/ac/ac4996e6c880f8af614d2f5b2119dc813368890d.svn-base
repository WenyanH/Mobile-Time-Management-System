package com.tms.dao.holiday;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.Holiday;

@Repository

public class HolidayDaoImpl extends AbsDao<Holiday, String> implements HolidayDao{
	
	private static final String FIND_ALL_HOLIDAY = " from Holiday where company.id = ? order by createTime desc";
	private static final String VALIDATE_CODE = " from Holiday where code = ?  and company.id = ? ";
	
	@Override
	public Boolean validateCodeExist(String code, String companyId) {
		Long count = findCount(" select count(*) " + VALIDATE_CODE, code, companyId);
		if (count>0)
			return true;
		else
			return false;
	}

	@Override
	public List<Holiday> findAllHoliday(String companyId) {
		return find(FIND_ALL_HOLIDAY , new Hints(0), companyId);
	}

}
