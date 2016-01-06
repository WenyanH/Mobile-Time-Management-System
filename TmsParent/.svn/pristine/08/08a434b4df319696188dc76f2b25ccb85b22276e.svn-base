package com.tms.service.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.report.ReportDao;
import com.tms.entity.customer.Report;

@Service
@Transactional(readOnly = true)
public class ReportService {
	@Autowired
	private ReportDao reportDao;
	
	@Transactional
	public Report save(final Report reportLog) {
		return reportDao.save(reportLog);
	}
	
	@Transactional
	public void remove(final String id) {
		reportDao.remove(id);
	}

	public Report findById(final String id) {
		return reportDao.find(id);
	}
	@Transactional
	public void update(final Report reportLog) {
		 reportDao.update(reportLog);
	}

	public List<Report> findAllReport(String companyId){
		return reportDao.findAllReport(companyId);
	}
}
