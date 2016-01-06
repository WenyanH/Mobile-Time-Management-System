package com.tms.dao.report;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.customer.Report;

@Repository
public class ReportLogImpl extends AbsDao<Report, String> implements ReportDao {
	private static final String FIND_REPORT = " from Report where company.id = ? order by updateTime asc";
	@Override
	public List<Report> findAllReport(String companyId) {
		return find(FIND_REPORT, new Hints(0), companyId);
	}
}
