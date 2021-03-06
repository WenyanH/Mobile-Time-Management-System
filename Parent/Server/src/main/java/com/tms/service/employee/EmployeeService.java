package com.tms.service.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.conditions.EmployeeConditions;
import com.tms.dao.core.Hints;
import com.tms.dao.employee.EmployeeDao;
import com.tms.entity.Employee;
import com.tms.pages.IPageList;

@Service
@Transactional(readOnly = true)
public class EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;

	@Transactional
	public Employee save(final Employee employeeInfo) {
		return employeeDao.save(employeeInfo);
	}
	@Transactional
	public void update(final Employee employeeInfo) {
		 employeeDao.update(employeeInfo);
	}
	public Employee findById(final String employeeId) {
		return employeeDao.find(employeeId);
	}

	public List<Employee> findAll(){
		return employeeDao.findAll();
	}
	@Transactional
	public void remove(final String employeeId){
		 employeeDao.remove(employeeId);
	}
	
	public IPageList<Employee> findEmployeePage(String searchStr, String companyId,String order,String sort, Hints hints){
		
		IPageList<Employee> users = employeeDao.findEmployeePage(searchStr,companyId, order, sort, hints);
		
		return users;
	}
	public Boolean validateExist(String code, String clockId, String companyId){
		return employeeDao.validateExist(code, clockId, companyId);
	}
	public List<Employee> findAllEmployee(String companyId) {
		return employeeDao.findAllEmployee(companyId);
	}
	
	
}
