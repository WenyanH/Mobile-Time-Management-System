package com.tms.service.timezone;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.timezone.TimeZoneDao;
import com.tms.entity.customer.TimeZone;

@Service
@Transactional(readOnly = true)
public class TimeZoneService {
	@Autowired
	private TimeZoneDao timeZoneDao;

	@Transactional
	public TimeZone save(final TimeZone timeZone) {
		return timeZoneDao.save(timeZone);
	}

	public TimeZone findById(final String rid) {
		return timeZoneDao.find(rid);
	}

	public List<TimeZone> findAll() {
		return timeZoneDao.findAll();
	}
}
