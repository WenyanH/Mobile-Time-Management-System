package com.tms.dao.autosendreport;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.commonfunctions.AutoSendReport;
import com.tms.pages.IPageList;
import com.tms.pages.PageListImpl;

@Repository
public class AutoSendReportDaoImpl extends AbsDao<AutoSendReport, String> implements AutoSendReportDao{
	
	/*private static final String SQL_RESOUECE =
			" from AutoSendReport where (runatTime like ? or sendTo like ?)";
	@Override
	public IPageList<AutoSendReport> findAutoSendPage(String searchStr,
			String order, String sort, Hints hints) {
		if (order == null) {
			order = "runatTime";
		}
		if (sort == null) {
			sort = "absc";
		}
		String param = "%" + searchStr + "%";
		IPageList<AutoSendReport> autosendreports = new PageListImpl<AutoSendReport>();
		autosendreports.setRecords(find(SQL_RESOUECE + sortHQL(order, sort), hints, param, param));
		autosendreports.setRecordTotal(findCount(" select count(*) " + SQL_RESOUECE, param, param));		
		return autosendreports;
	}*/
}
