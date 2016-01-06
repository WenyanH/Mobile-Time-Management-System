package com.tms.dao.timerounding;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.TimeRounding;
import com.tms.pages.IPageList;
import com.tms.pages.PageListImpl;

@Repository
public class TimeRoundingDaoImpl extends AbsDao<TimeRounding, String> implements TimeRoundingDao {

	private static final String FIND_TIMEROUNDINGS = " from TimeRounding where company.id = ? ";

	private static final String FIND_TIMEROUNDINGS_COUNT = " select count(*) " + FIND_TIMEROUNDINGS;

	private static final String VALIDATE_CODE_NAME = " from TimeRounding where company.id = ? ";
	
	@Override
	public IPageList<TimeRounding> findTimeRoundings(String company, Hints hints) {
		IPageList<TimeRounding> roundings = new PageListImpl<TimeRounding>();
		long count = findCount(FIND_TIMEROUNDINGS_COUNT, company);
		if (count > 0) {
			roundings.setRecords(findPaged(FIND_TIMEROUNDINGS, hints, company));
		}
		return roundings;
	}
	
	@Override
	public List<TimeRounding> findAllTimeRoundings(String companyId) {
		return find(FIND_TIMEROUNDINGS , new Hints(0), companyId);
	}

	@Override
	public Boolean validateCodeNameExist(String code, String name, String companyId) {
		StringBuffer sqlWhere = new StringBuffer(); 
		
		if (!StringUtils.isEmpty(code)|| !StringUtils.isEmpty(name)){
			
			
			if (!StringUtils.isEmpty(code)){
				if (sqlWhere.length()==0){
					sqlWhere.append(" and (").append(" code='").append(code).append("'");
				}else{
					sqlWhere.append(" or code='").append(code).append("'");
				}
			}
			
			if (!StringUtils.isEmpty(name)){
				if (sqlWhere.length()==0){
					sqlWhere.append(" and (").append(" name='").append(name).append("'");
				}else{
					sqlWhere.append(" or name='").append(name).append("'");
				}
			}
						
			
			sqlWhere.append(")");
		}
		

		Long count = findCount(" select count(*) " + VALIDATE_CODE_NAME + sqlWhere.toString(), companyId);
		if (count>0)
			return true;
		else
			return false;
			
	}
	
}
