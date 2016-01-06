package com.tms.service.company;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.util.StringUtils;

import com.tms.core.test.BaseTest;
import com.tms.entity.Company;

public class CompanyTest extends BaseTest {

	@Autowired
	private CompanyService companyService;

	@Test
	@Rollback(false)
	public void removeCompany() {
		Company company = new Company();
		company.setNumber("001");
		company.setTradingName("赢在未来科技");
		companyService.save(company);
		List<Company> companys = companyService.findAll();
		for (Company ocompany : companys) {
			if(ocompany.getNumber()!=null){
				if (ocompany.getNumber().equals(company.getNumber())) {
					companyService.remove(ocompany.getId());
					break;
				}	
			}
			
		}
	}
}
