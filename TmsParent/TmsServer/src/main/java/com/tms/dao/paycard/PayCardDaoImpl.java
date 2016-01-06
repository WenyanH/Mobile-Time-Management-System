package com.tms.dao.paycard;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.commonfunctions.PayCard;

@Repository
public class PayCardDaoImpl extends AbsDao<PayCard, String> implements PayCardDao {

	private static final String FIND_PAY_CARD = " from PayCard where company.id = ?";

	private static final String VALIDATE_CODE_NAME = " from PayCard where code = ? and company.id = ? ";
	
	@Override
	public List<PayCard> findPayCards(String employeeId,String companyId) {
		StringBuffer sqlWhere = new StringBuffer(); 
		if (!StringUtils.isEmpty(employeeId)){
			sqlWhere.append(" and ").append(" employee.id='").append(employeeId).append("'");
		}
		
		return find(FIND_PAY_CARD + sqlWhere.toString() , new Hints(0), companyId);
	}
	@Override
	public boolean validateCodeExist(String code, String companyId) {
		 Long count = findCount(" select count(*) " + VALIDATE_CODE_NAME, code, companyId);
		 if (count>0)
		   return true;
           else
			return false;
	}
	@Override
	public List<PayCard> findPayCardsByTimeRange(String fromDate, String toDate) {
		StringBuffer sqlWhere = new StringBuffer(); 
		if (!StringUtils.isEmpty(fromDate)&&!StringUtils.isEmpty(toDate)){
			sqlWhere.append(" where ").append(" fromDate >= '").append(fromDate).append("'");
			sqlWhere.append(" and ").append(" toDate <= '").append(toDate).append("'");
		}
		return find("from PayCard" + sqlWhere.toString() , new Hints(0));
	}
}
