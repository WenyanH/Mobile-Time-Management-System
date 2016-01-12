package com.tms.dao.schedule;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.Schedule;

public interface ScheduleDao extends IDao<Schedule, String> {
	public abstract List<Schedule> findSchedules(String companyId);
	public abstract Boolean validateCodeNameExist(String code,String name, String companyId);
}