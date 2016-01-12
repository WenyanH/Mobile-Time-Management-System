package com.tms.calculator.context;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tms.calculator.service.ServiceLocator;
import com.tms.entity.Company;
import com.tms.service.company.CompanyService;
import com.tms.service.tms.TMSService;

public class Context {

	private static final Context context = new Context();

	private Map<String, CompanyContext> companyContext = new HashMap<>();

	private Context() {
		init();
	}

	/**
	 * Load Company related settings
	 */
	private void init() {

		// Load All companies
		CompanyService companyService = ServiceLocator.getInstance().loadService(CompanyService.class);
		List<Company> companies = companyService.findAll();

		TMSService tmsService = ServiceLocator.getInstance().loadService(TMSService.class);

		for (Company company : companies) {

			// Load TimeRounding
			CompanyContext context = new CompanyContext(company);
			context.setRounding(company.getBindTimeRounding());

			// Load company holidays
			context.addHolidays(tmsService.findAllHoliday(company.getId()));

			// Cache company context
			companyContext.put(company.getId(), context);
		}

	}

	public static final Context getInstance() {
		return context;
	}

	public CompanyContext getComanyContext(String companyId) {
		return companyContext.get(companyId);
	}

}
