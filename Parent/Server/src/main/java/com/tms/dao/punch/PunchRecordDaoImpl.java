package com.tms.dao.punch;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.punch.PunchRecord;


@Repository
public class PunchRecordDaoImpl extends AbsDao<PunchRecord, String> implements PunchRecordDao {

	private static final String LOAD_RECORD = " from PunchRecord pr where pr.puid = ?1 and pr.punchDay between ?2 and ?3 order by pr.punchTime ";

	@Override
	public List<PunchRecord> loadPunchRecordByDate(String uid, Date from, Date to) {
		return find(LOAD_RECORD, new Hints(), uid, from, to);
	}

}
