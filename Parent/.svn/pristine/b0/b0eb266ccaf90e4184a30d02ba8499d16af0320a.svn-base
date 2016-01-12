package com.tms.dao.paytype;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.PayType;

public interface PayTypeDao extends IDao<PayType, String> {

public abstract List<PayType> findPayTypes(String companyId);
	
public abstract Boolean validateCodeNameExist(String code,String name, String companyId);

}
