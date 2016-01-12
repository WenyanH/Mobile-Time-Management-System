package com.tms.service.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.department.DepartmentDao;
import com.tms.entity.Department;

@Service
@Transactional(readOnly = true)
public class DepartmentService {

	@Autowired
	private DepartmentDao departmentDao;

	@Transactional
	public Department save(final Department companyInfo) {
		return departmentDao.save(companyInfo);
	}

	@Transactional
	public void update(final Department companyInfo) {
		departmentDao.update(companyInfo);
	}

	public Department findById(final String departmentId) {
		return departmentDao.find(departmentId);
	}

	public List<Department> findAll() {
		return departmentDao.findAll();
	}

	@Transactional
	public void remove(final String companyId) {
		departmentDao.remove(companyId);
	}

	public List<Department> findAllDepartment(final String companyId) {
		return departmentDao.findAllDepartment(companyId);
	}

	public Boolean validateNumberExist(String companyId, String number) {
		return departmentDao.validateNumberExist(companyId, number);
	}
	public Boolean validateNameExist(String companyId, String name,String parentId) {
		return departmentDao.validateNameExist(companyId, name,parentId);
	}
}
