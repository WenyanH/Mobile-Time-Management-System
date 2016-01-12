package com.tms.service.commonsfunctions;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.autosendreport.AutoSendReportDao;
import com.tms.entity.commonfunctions.AutoSendReport;

@Service
@Transactional(readOnly = true)
public class AutoSendReportService {
	
	@Autowired
	private AutoSendReportDao autosendreportDao;
	
	@Transactional
	public AutoSendReport save(final AutoSendReport autosend) {
		return autosendreportDao.save(autosend);
	}
	
	@Transactional
	public void update(final AutoSendReport autosend) {
		 autosendreportDao.update(autosend);
	}
	public AutoSendReport findById(final String id) {
		return autosendreportDao.find(id);
	}

	public List<AutoSendReport> findAll() {
		return autosendreportDao.findAll();
	}
	
	/*public IPageList<AutoSendReport> findAutoSendPage(String searchStr,  String order, String sort, Hints hints) {
		IPageList<AutoSendReport> sendReport = autosendreportDao.findAutoSendPage(searchStr, order, sort, hints);
		return sendReport;
	}*/
	
	@Transactional
	public void remove(final String sendId) {
		autosendreportDao.remove(sendId);
	}
	
}
