package com.tms.dao.paygroup;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.PayGroup;
import com.tms.pages.IPageList;
import com.tms.pages.PageListImpl;

@Repository
public class PayGroupDaoImpl extends AbsDao<PayGroup, String> implements PayGroupDao {

	private static final String FIND_PAY_GROUPS = " from PayGroup where company.id = ?";

	private static final String FIND_PAY_GROUP_COUNT = " select count(*) from PayGroup where company.id = ? ";
	
	private static final String VALIDATE_CODE_NAME = " from PayGroup where company.id = ? ";

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
	public IPageList<PayGroup> findPayGroups(Hints hints, String company) {

		IPageList<PayGroup> groups = new PageListImpl<>();
		long count = findCount(FIND_PAY_GROUP_COUNT, company);
		if (count > 0) {
			groups.setRecords(findPaged(FIND_PAY_GROUPS, hints, company));
		}
		groups.setRecordTotal(count);
		return groups;
	}
	
	@Override
	public List<PayGroup> findPayGroups(String companyId) {
		return find(FIND_PAY_GROUPS , new Hints(0), companyId);
	}
}
