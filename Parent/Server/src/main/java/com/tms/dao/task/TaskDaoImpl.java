package com.tms.dao.task;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.Task;


@Repository
public class TaskDaoImpl extends AbsDao<Task, String> implements TaskDao{
	private static final String FIND_TASK = " from Task where company.id = ?";
private static final String VALIDATE_CODE_NAME_PUNCHCODE = " from Task where company.id = ? ";
	
	@Override
	public Boolean validateCodeNamePunchCodeExist(String code, String name, String punchCode, String companyId) {
		StringBuffer sqlWhere = new StringBuffer(); 
		
		if (!StringUtils.isEmpty(code)|| !StringUtils.isEmpty(name) || !StringUtils.isEmpty(punchCode)){
			
			
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
			
			if (!StringUtils.isEmpty(punchCode)){
				if (sqlWhere.length()==0){
					sqlWhere.append(" and (").append(" punchCode='").append(punchCode).append("'");
				}else{
					sqlWhere.append(" or punchCode='").append(punchCode).append("'");
				}
			}
			
			sqlWhere.append(")");
		}
		

		Long count = findCount(" select count(*) " + VALIDATE_CODE_NAME_PUNCHCODE + sqlWhere.toString(), companyId);
		if (count>0)
			return true;
		else
			return false;
			
	}
	
	@Override
	public List<Task> findAllTasks(String companyId) {		
		return find(FIND_TASK , new Hints(0), companyId);
	}
}
