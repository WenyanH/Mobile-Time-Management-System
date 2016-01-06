package com.tms.dao.company;

import com.tms.dao.core.IDao;
import com.tms.entity.Company;

/**
 * @author zwq
 *
 */
public interface CompanyDao  extends IDao<Company, String>{
	public abstract Boolean validateNumberExist(String Number);
	public abstract Boolean validateEmailExist(String email);
}
