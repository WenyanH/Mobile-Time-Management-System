package com.tms.dao.timerounding;

import java.util.List;

import com.tms.dao.core.Hints;
import com.tms.dao.core.IDao;
import com.tms.entity.tms.TimeRounding;
import com.tms.pages.IPageList;

public interface TimeRoundingDao extends IDao<TimeRounding, String> {

	public abstract IPageList<TimeRounding> findTimeRoundings(String company, Hints hints);
	public abstract List<TimeRounding> findAllTimeRoundings(String companyId);
	public abstract Boolean validateCodeNameExist(String code, String name, String companyId);
}
