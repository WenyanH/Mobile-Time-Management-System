package com.tms.tmsprofile;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import com.tms.core.test.BaseTest;
import com.tms.dao.core.Hints;
import com.tms.entity.Company;
import com.tms.entity.Employee;
import com.tms.entity.tms.EmployeeHoliday;
import com.tms.entity.tms.PayGroup;
import com.tms.entity.tms.TimeRounding;
import com.tms.entity.tms.TimeRoundingRule;
import com.tms.pages.IPageList;
import com.tms.service.company.CompanyService;
import com.tms.service.employee.EmployeeService;
import com.tms.service.tms.TMSService;

@RunWith(SpringJUnit4ClassRunner.class)
public class TMSServiceTest extends BaseTest {

	@Autowired
	private TMSService tmsService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private EmployeeService employeeService;

	private Company company;

	@Before
	public void before() {
		company = new Company();
		company.setId("001");
	}

	@Test
	public void eholidayTest() {

		Date date = new Date();

		companyService.save(company);

		Employee e = new Employee();
		e.setName("e1");
		e.setCompany(company);

		Employee e1 = new Employee();
		e1.setName("e2");
		e1.setCompany(company);

		employeeService.save(e);
		employeeService.save(e1);

		EmployeeHoliday holiday = new EmployeeHoliday();
		holiday.setCompany(company);
		holiday.setDate(date);
		holiday.getUsers().add(e);

	}

	@Test
	public void createPayGroup() {
		PayGroup group = new PayGroup();
		group.setCode("001");
		group.setCompany(company);
		tmsService.savePayGroup(group);
		Assert.notNull(group.getId());
	}

	@Test
	public void payGroupTest() {

		companyService.save(company);

		PayGroup group = new PayGroup();
		group.setCode("002");
		group.setCompany(company);
		tmsService.savePayGroup(group);

		IPageList<PayGroup> groups = tmsService.findAllPageGroups(new Hints(), company.getId());
		Assert.notEmpty(groups.getRecords());
	}

	@Test
	public void timeRoundingTest() {

		TimeRounding tr = new TimeRounding();
		tr.setCode("001");
		tr.setName("tr-001");
		tr.setCompany(company);

		TimeRoundingRule rule = new TimeRoundingRule();
		rule.setFromTime(5);
		rule.setToT(10);
		rule.setValue(10);

		tr.getRules().add(rule);

		tmsService.saveTimeRounding(tr);

		Assert.notEmpty(tr.getRules());

		tr.setName("name 001");

		TimeRoundingRule rule2 = new TimeRoundingRule();
		rule2.setFromTime(15);
		rule2.setToT(20);
		rule2.setValue(18);

		tr.getRules().add(rule2);
		tmsService.updateTimeRounding(tr);

		tr = tmsService.findTimeRoundingbyId(tr.getId());
		Assert.isTrue(tr.getRules().size() == 2);

		TimeRoundingRule rule3 = new TimeRoundingRule();
		rule3.setFromTime(20);
		rule3.setToT(22);
		rule3.setValue(11);

		tr.getRules().clear();
		tr.getRules().add(rule3);

		tmsService.updateTimeRounding(tr);

		tr = tmsService.findTimeRoundingbyId(tr.getId());
		Assert.isTrue(tr.getRules().size() == 1);

		tr.getRules().clear();
		tmsService.updateTimeRounding(tr);

		tr = tmsService.findTimeRoundingbyId(tr.getId());
		Assert.isTrue(tr.getRules().size() == 0);

		tmsService.removeTimeRounding(tr.getId());

		tr = tmsService.findTimeRoundingbyId(tr.getId());
		Assert.isNull(tr);
	}

}
