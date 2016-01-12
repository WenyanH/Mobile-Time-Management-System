package com.tms.service.payrolltransfer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.payrolltransfer.PayrollTransferDao;
import com.tms.entity.commonfunctions.PayrollTransfer;

@Service
@Transactional(readOnly = true)
public class PayrollTransferService {
	@Autowired
	private PayrollTransferDao payrollTransferDao;
	
	
	public PayrollTransfer findById(String payrollTransferId) {
		return payrollTransferDao.find(payrollTransferId);
	}
	@Transactional
	public PayrollTransfer save(PayrollTransfer payrollTransfer) {
		return payrollTransferDao.save(payrollTransfer);
	}

	@Transactional
	public void update(PayrollTransfer payrollTransfer) {
		payrollTransferDao.update(payrollTransfer);
	}
	@Transactional
	public void remove(String payrollTransferId) {
		payrollTransferDao.remove(payrollTransferId);
	}
	public List<PayrollTransfer> findPayrollTransfers(String employeeId, String companyId) {
		return payrollTransferDao.findPayrollTransfers(employeeId,companyId);
	}
	
	public boolean validateCodeExist(String code,String companyId) {
		return payrollTransferDao.validateCodeExist(code,companyId);
	}
}
