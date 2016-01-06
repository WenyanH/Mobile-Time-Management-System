package com.tms.dao.employee;

import java.util.List;

import com.tms.conditions.EmployeeConditions;
import com.tms.dao.core.Hints;
import com.tms.dao.core.IDao;
import com.tms.entity.Employee;
import com.tms.pages.IPageList;

/**
 * @author zwq
 *
 */
public interface EmployeeDao extends IDao<Employee, String>{
	public abstract IPageList<Employee> findEmployeePage(String searchStr, String companyId,String order, String sort,Hints hints);
	public abstract Boolean validateExist(String code, String clockId, String companyId);
	public abstract List<Employee> findAllEmployee(String companyId);
	
}
