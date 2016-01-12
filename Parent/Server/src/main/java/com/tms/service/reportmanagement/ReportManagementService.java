package com.tms.service.reportmanagement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.reportmanagement.ReportManagementDao;
import com.tms.entity.customer.ReportManagement;

@Service
@Transactional(readOnly = true)
public class ReportManagementService {
	@Autowired
	private ReportManagementDao reportManagementDao;

	@Transactional
	public ReportManagement save(final ReportManagement reportManagement) {
		return reportManagementDao.save(reportManagement);
	}

	public ReportManagement findById(final String rid) {
		return reportManagementDao.find(rid);
	}

	public List<ReportManagement> findAll() {
		return reportManagementDao.findAll();
	}
	
}
