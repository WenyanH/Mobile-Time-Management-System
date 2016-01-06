package com.tms.service.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.company.CompanyDao;
import com.tms.entity.Company;

/**
 * @author  zwq
 *
 */
@Service
@Transactional(readOnly = true)
public class CompanyService {
	
	@Autowired
	private  CompanyDao compnayDao;
	
	@Transactional
	public Company save(final Company compnay) {
		return compnayDao.save(compnay);
	}
	
	@Transactional
	public void remove(final String compnayId) {
		compnayDao.remove(compnayId);
	}

	public Company findById(final String compnayId) {
		return compnayDao.find(compnayId);
	}
	@Transactional
	public void update(final Company compnay) {
		 compnayDao.update(compnay);
	}

	public List<Company> findAll(){
		return compnayDao.findAll();
	}

	public  Boolean validateEmailExist(String email){
		return compnayDao.validateEmailExist(email);
	}
	public  Boolean validateNumberExist(String number){
		return compnayDao.validateNumberExist(number);
	}
}
