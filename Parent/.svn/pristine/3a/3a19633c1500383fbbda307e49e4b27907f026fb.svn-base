package com.tms.dao.schedule;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.Schedule;

@Repository
public class ScheduleDaoImpl extends AbsDao<Schedule, String> implements ScheduleDao{
	private static final String FIND_SCHEDULE = " from Schedule where company.id = ?";
	
	private static final String VALIDATE_CODE_NAME = " from Schedule where company.id = ? ";
	
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
	
	@Override
	public List<Schedule> findSchedules(String companyId) {
		return find(FIND_SCHEDULE , new Hints(0), companyId);
	}
	
}

	

	
	
	
	
