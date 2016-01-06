package com.tms.dao.calculationscriptlog;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.customer.CalculationScriptLog;

@Repository
public class CalculationScriptDaoLogImpl extends AbsDao<CalculationScriptLog, String> implements CalculationScriptDaoLog {
	private static final String FIND_CALCULATION_SCRIPT_LOG = " from CalculationScriptLog where calculationScript.scriptKey = ?";
	public  List<CalculationScriptLog> findCalculationScriptLogs(String scriptKey){
		return find(FIND_CALCULATION_SCRIPT_LOG, new Hints(0), scriptKey);
	}
}
