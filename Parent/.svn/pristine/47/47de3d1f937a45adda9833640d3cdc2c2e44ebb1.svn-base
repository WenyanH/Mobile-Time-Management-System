package com.tms.dao.leave;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.Leave;

@Repository

public class LeaveDaoImpl extends AbsDao<Leave, String> implements LeaveDao{
	
	private static final String FIND_LEAVE = " from Leave where company.id = ?";
    private static final String VALIDATE_CODE = " from Leave where employee_id = ? and company.id = ?";
	
    private static final String FIND_LEAVE_BY_EMPLOYEE = " from Leave where employee_id = ?";
	@Override
	public Boolean validateCodeExist(String employeeID, String companyId) {
		 Long count = findCount(" select count(*) " + VALIDATE_CODE, employeeID, companyId);
		 if (count>0)
		   return true;
           else
			return false;
	}
	@Override
	public  List<Leave> findLeavesByEmployeeId(String employeeId){
		return find(FIND_LEAVE_BY_EMPLOYEE , new Hints(0), employeeId);
	}
	@Override
	public List<Leave> findLeaves(String companyId) {		
		return find(FIND_LEAVE , new Hints(0), companyId);
	}
	
}
	