package com.tms.dao.timezone;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.entity.customer.TimeZone;

@Repository
public class TimeZoneDaoImpl extends AbsDao<TimeZone, String> implements TimeZoneDao{

}
