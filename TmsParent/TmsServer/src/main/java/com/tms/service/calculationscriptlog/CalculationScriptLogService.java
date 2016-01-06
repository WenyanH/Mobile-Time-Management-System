package com.tms.service.calculationscriptlog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.calculationscriptlog.CalculationScriptDaoLog;
import com.tms.entity.customer.CalculationScriptLog;

@Service
@Transactional(readOnly = true)
public class CalculationScriptLogService {
	@Autowired
	private CalculationScriptDaoLog calculationScriptDaolog;
	
	@Transactional
	public CalculationScriptLog save(final CalculationScriptLog calculationScriptLog) {
		return calculationScriptDaolog.save(calculationScriptLog);
	}
	
	public CalculationScriptLog findById(final String id) {
		return calculationScriptDaolog.find(id);
	}

	public List<CalculationScriptLog> findAll(){
		return calculationScriptDaolog.findAll();
	}
	public  List<CalculationScriptLog> findCalculationScriptLogs(String scriptKey){
		return calculationScriptDaolog.findCalculationScriptLogs(scriptKey);
	}
}
