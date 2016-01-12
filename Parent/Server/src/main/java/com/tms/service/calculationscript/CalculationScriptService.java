package com.tms.service.calculationscript;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.calculationscript.CalculationScriptDao;
import com.tms.entity.customer.CalculationScript;

@Service
@Transactional(readOnly = true)
public class CalculationScriptService {
	@Autowired
	private CalculationScriptDao calculationScriptDao;
	
	@Transactional
	public CalculationScript save(final CalculationScript calculationScript) {
		return calculationScriptDao.save(calculationScript);
	}
	
	@Transactional
	public void remove(final String id) {
		calculationScriptDao.remove(id);
	}

	public CalculationScript findById(final String id) {
		return calculationScriptDao.find(id);
	}
	@Transactional
	public void update(final CalculationScript calculationScript) {
		 calculationScriptDao.update(calculationScript);
	}

	public List<CalculationScript> findAll(){
		return calculationScriptDao.findAll();
	}
	public  List<CalculationScript> findAllCalculationScript(String companyId) {
		return calculationScriptDao.findAllCalculationScript(companyId);
	}
}
