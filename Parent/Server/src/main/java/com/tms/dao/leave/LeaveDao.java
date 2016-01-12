package com.tms.dao.leave;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.tms.Leave;

public interface LeaveDao extends IDao<Leave, String> {

	public abstract List<Leave> findLeaves(String companyId);
	public abstract List<Leave> findLeavesByEmployeeId(String employeeId);
	public abstract Boolean validateCodeExist(String employeeID, String companyId);
}
