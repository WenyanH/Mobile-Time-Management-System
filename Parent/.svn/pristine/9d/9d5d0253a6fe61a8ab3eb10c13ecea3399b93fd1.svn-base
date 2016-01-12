package com.tms.dao.department;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.Department;

/**
 * @author zwq
 *
 */
public interface DepartmentDao extends IDao<Department, String> {

	public abstract List<Department> findAllDepartment(String companyId);

	public abstract Boolean validateNumberExist(String companyId, String number);
	
	public abstract Boolean validateNameExist(String companyId,String name, String parentId);
}
