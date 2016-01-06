package com.tms.dao.punch;

import java.util.Date;
import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.punch.PunchRecord;

public interface PunchRecordDao extends IDao<PunchRecord, String> {

	public abstract List<PunchRecord> loadPunchRecordByDate(String uid, Date from, Date to);

}
