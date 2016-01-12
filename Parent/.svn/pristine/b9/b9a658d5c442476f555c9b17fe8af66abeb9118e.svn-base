package com.tms.service.department;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.tms.core.test.BaseTest;
import com.tms.entity.Department;
import com.tms.entity.Employee;
import com.tms.service.employee.EmployeeService;

public class DepartmentTest extends BaseTest {

	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private EmployeeService employeeService;

	@Test
	public void saveDepartment() {

		Department department = new Department();
		department.setNumber("001");
		department.setDepartmentName("科技部");

		departmentService.save(department);

		Department newDepartment = departmentService.findById(department.getId());
		Assert.assertEquals(department, newDepartment);
	}

	@Test
	public void updateDepartment() {

		Department department = new Department();
		department.setNumber("001");
		department.setDepartmentName("科技");
		departmentService.save(department);
		department.setEmail("yingzaiweilai@163.com");
		departmentService.update(department);

		Department newDepartment = new Department();
		newDepartment = departmentService.findById(department.getId());
		Assert.assertEquals(department.getEmail(), newDepartment.getEmail());
	}

	@Test
	public void removeDepartment() {

		Department department = new Department();
		department.setNumber("001");
		department.setDepartmentName("赢在未来科技");
		departmentService.save(department);
		
		Employee e = new Employee();
		e.setName("e1");
		e.setDepartment(department);
		employeeService.save(e);

		departmentService.remove(department.getId());
		Department newDepartment = new Department();
		newDepartment = departmentService.findById(department.getId());
		Assert.assertEquals(null, newDepartment);

		Employee tmp = employeeService.findById(e.getId());
		Assert.assertNotNull(tmp);
	}

}
