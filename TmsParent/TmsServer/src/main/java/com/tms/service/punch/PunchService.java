package com.tms.service.punch;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.punch.PunchRecordDao;
import com.tms.entity.punch.PunchRecord;

@Service
@Transactional(readOnly = true)
public class PunchService {

	@Autowired
	private PunchRecordDao punchRecordDao;

	public List<PunchRecord> findUserRecordByDate(String uid, Date from, Date to) {
		return punchRecordDao.loadPunchRecordByDate(uid, from, to);
	}

}
