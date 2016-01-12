package com.tms.dao.department;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.Department;

/**
 * @author zwq
 *
 */
@Repository
public class DepartmentDaoImpl extends AbsDao<Department, String> implements DepartmentDao {
	
	private static final String FIND_DEPARTMENT = " from Department where company.id = ? order by createTime asc";

	private static final String FIND_DEPARTMENT_BY_LEVEL = " from Department where company.id = ? AND level = ?";

	private static final String VALIDATE_NUMBER = " from Department where company.id = ? AND number = ?";

	private static final String VALIDATE_NAME = " from Department where company.id = ? AND  departmentName = ? AND parent_id = ?";
	
	@Override
	public List<Department> findAllDepartment(String companyId) {
		return find(FIND_DEPARTMENT, new Hints(0), companyId);
	}

	public Boolean validateNumberExist(String companyId, String number) {
		Long count = findCount(" select count(*) " + VALIDATE_NUMBER, companyId, number);
		if (count > 0)
			return true;
		else
			return false;
	}
	public  Boolean validateNameExist(String companyId,String name, String parentId){
		Long count = findCount(" select count(*) " + VALIDATE_NAME,companyId, name, parentId);
		if (count > 0)
			return true;
		else
			return false;
	}
}
