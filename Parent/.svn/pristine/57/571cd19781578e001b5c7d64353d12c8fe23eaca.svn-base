package com.tms.service.employee;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import com.tms.conditions.EmployeeConditions;
import com.tms.core.test.BaseTest;
import com.tms.entity.Company;
import com.tms.entity.Department;
import com.tms.entity.Employee;
import com.tms.service.company.CompanyService;
import com.tms.service.department.DepartmentService;

public class EmployeeTest extends BaseTest {

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private DepartmentService departService;


	@Test
	@Rollback(false)
	public void saveEmployee() {
		
		
		Department department = new Department();
		department.setNumber("001");
		department.setDepartmentName("name1");		
		departService.save(department);
		
		Department department1_1 = new Department();
		department1_1.setNumber("002");
		department1_1.setDepartmentName("name1_1");
		Department newDepartment = departService.findById(department.getId());
		department1_1.setParent(newDepartment);
		departService.save(department1_1);
		
		Department department1_2 = new Department();
		department1_2.setNumber("003");
		department1_2.setDepartmentName("name1_2");		
		department1_2.setParent(newDepartment);
		departService.save(department1_2);
		
		Department department1_1_1 = new Department();
		department1_1_1.setNumber("004");
		department1_1_1.setDepartmentName("name1_1_1");
		Department newDepartment1_1 = departService.findById(department1_1.getId());
		department1_1_1.setParent(newDepartment1_1);
		departService.save(department1_1_1);
		
		
		
		Company company = new Company();
		company.setName("company1");
		companyService.save(company);
		
		
		Employee addemployee = new Employee();
		addemployee.setFirstName("e1");
		addemployee.setCompany(company);
		addemployee.setDepartment(department);
		//addemployee.setStatus(EmployeeStatus.Active);
		employeeService.save(addemployee);
		
		
		Employee addemployee1 = new Employee();
		addemployee1.setFirstName("e2");
		addemployee1.setCompany(company);
		addemployee1.setDepartment(department1_1);
		//addemployee1.setStatus(EmployeeStatus.Active);
		employeeService.save(addemployee1);
		
		
		Employee addemployee2 = new Employee();
		addemployee2.setFirstName("e3");
		addemployee2.setCompany(company);
		addemployee2.setDepartment(department1_2);
		//addemployee2.setStatus(EmployeeStatus.Active);
		employeeService.save(addemployee2);
		
		Employee addemployee3 = new Employee();
		addemployee3.setFirstName("e4");
		addemployee3.setCompany(company);
		addemployee3.setDepartment(department1_1_1);
		//addemployee3.setStatus(EmployeeStatus.Active);
		employeeService.save(addemployee3);
		
		
	}
	
	/**
	 *  本测试类方法临时用，方法中的id从saveEmployee（）方法取
	 */
//	@Test
//	public void findEmployeeByDepartmentCondition() {
//		EmployeeConditions condition = new EmployeeConditions();
//		condition.setCompanyId("5a5c21c3-1960-45fc-a5f3-11ea3501d990");
//		condition.setDepartment("d1aa1c6d-d8f5-466c-bcc5-fb600f63ffcd,c04ea9d6-7db9-4b19-b7db-d8d4bbd173e9");
//		condition.setStatus("Active");
//		
//		List<Employee> list = employeeService.findEmployeeByCondtion(condition);
//		Assert.assertNotNull(list);
//	}
	
	
//	@Test
//	public void findEmployeeByCondition() {
//
//		Company company = new Company();
//		companyService.save(company);
//
//		Department depart = new Department();
//		depart.setName("dept1");
//		depart.setCompany(company);
//		departService.save(depart);
//
//		Employee addemployee = new Employee();
//		addemployee.setFirstName("bb");
//		addemployee.setCompany(company);
//		addemployee.setDepartment(depart);
//		//addemployee.setStatus(EmployeeStatus.Active);
//		employeeService.save(addemployee);
//		
//		
//		EmployeeConditions condition = new EmployeeConditions();
//		condition.setCompanyId(company.getId());
//		condition.setDepartment(depart.getId());
//		condition.setStatus("Active");
//		
//		List<Employee> list = employeeService.findEmployeeByCondtion(condition);
//		Assert.assertNotNull(list);
//	}
	
	
	
}
