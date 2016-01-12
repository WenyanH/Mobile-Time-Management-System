package com.tms.dao.company;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.entity.Company;

@Repository
public class CompanyDaoImpl extends AbsDao<Company, String> implements CompanyDao {
	
	private static final String VALIDATE_NUMBER = " from Company where number = ?";
	private static final String VALIDATE_EMAIL = " from Company where email = ? ";
	public  Boolean validateNumberExist(String Number){
		Long count = findCount(" select count(*) " + VALIDATE_NUMBER,Number);
		if (count>0)
			return true;
		else
			return false;
	}
	public  Boolean validateEmailExist(String email){
		Long count = findCount(" select count(*) " + VALIDATE_EMAIL, email);
		if (count>0)
			return true;
		else
			return false;
	}
}
