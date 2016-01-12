package com.tms.dao.calculationscript;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.customer.CalculationScript;

@Repository
public class CalculationScriptDaoImpl extends AbsDao<CalculationScript, String> implements CalculationScriptDao {
	private static final String FIND_ALL_CALCULATIONSCRIPT = " from CalculationScript where company.id = ?";
	
	@Override
	public  List<CalculationScript> findAllCalculationScript(String companyId) {
		return find(FIND_ALL_CALCULATIONSCRIPT, new Hints(0), companyId);
	}
}
