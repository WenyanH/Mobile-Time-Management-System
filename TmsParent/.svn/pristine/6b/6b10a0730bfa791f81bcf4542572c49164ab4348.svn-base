package com.tms.dao.paycard;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.commonfunctions.PayCard;

public interface PayCardDao extends IDao<PayCard, String>{
	
	public abstract boolean validateCodeExist(String code, String companyId);
		
	public abstract List<PayCard> findPayCards(String employeeId, String companyId);
	
	public abstract List<PayCard> findPayCardsByTimeRange(String fromDate, String toDate);
}
