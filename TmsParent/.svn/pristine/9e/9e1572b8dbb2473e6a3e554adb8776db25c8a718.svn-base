package com.tms.dao.payrolltransfer;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.commonfunctions.PayrollTransfer;

public interface PayrollTransferDao extends IDao<PayrollTransfer, String>{
	
	public abstract boolean validateCodeExist(String code, String companyId);
		
	public abstract List<PayrollTransfer> findPayrollTransfers(String employeeId, String companyId);
}
