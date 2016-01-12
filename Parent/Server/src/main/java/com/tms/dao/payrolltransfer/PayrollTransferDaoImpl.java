package com.tms.dao.payrolltransfer;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.commonfunctions.PayrollTransfer;

@Repository
public class PayrollTransferDaoImpl extends AbsDao<PayrollTransfer, String> implements PayrollTransferDao {

	private static final String FIND_PAYROLL_TRANSFER = " from PayrollTransfer where company.id = ?";

	private static final String VALIDATE_CODE_NAME = " from PayrollTransfer where code = ? and company.id = ? ";
	@Override
	public List<PayrollTransfer> findPayrollTransfers(String employeeId,String companyId) {
		StringBuffer sqlWhere = new StringBuffer(); 
		if (!StringUtils.isEmpty(employeeId)){
			sqlWhere.append(" and ").append(" employee.id='").append(employeeId).append("'");
		}
		
		return find(FIND_PAYROLL_TRANSFER + sqlWhere.toString() , new Hints(0), companyId);
	}
	@Override
	public boolean validateCodeExist(String code, String companyId) {
		 Long count = findCount(" select count(*) " + VALIDATE_CODE_NAME, code, companyId);
		 if (count>0)
		   return true;
           else
			return false;
	}
}
