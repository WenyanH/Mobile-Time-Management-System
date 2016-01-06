package com.tms.dao.paytype;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.PayType;
import org.springframework.util.StringUtils;

@Repository

public class PayTypeDaoImpl extends AbsDao<PayType, String> implements PayTypeDao{

	private static final String FIND_ALL_PAYTYPES = " from PayType where company.id = ?";
	private static final String VALIDATE_CODE_NAME = " from PayType where company.id = ? ";
	
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
	public List<PayType> findPayTypes(String companyId) {
		return find(FIND_ALL_PAYTYPES , new Hints(0), companyId);
	}

}


	

	

