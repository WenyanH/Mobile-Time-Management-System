package com.tms.service.paycard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.paycard.PayCardDao;
import com.tms.entity.commonfunctions.PayCard;

@Service
@Transactional(readOnly = true)
public class PayCardService {
	@Autowired
	private PayCardDao payCardDao;
	
	
	public PayCard findById(String payCardId) {
		return payCardDao.find(payCardId);
	}
	@Transactional
	public PayCard save(PayCard payCard) {
		return payCardDao.save(payCard);
	}

	@Transactional
	public void update(PayCard payCard) {
		payCardDao.update(payCard);
	}
	@Transactional
	public void remove(String payCardId) {
		payCardDao.remove(payCardId);
	}
	public List<PayCard> findPayCards(String employeeId, String companyId) {
		return payCardDao.findPayCards(employeeId,companyId);
	}
	
	public List<PayCard> findPayCardsByTimeRange(String fromDate, String toDate) {
		return payCardDao.findPayCardsByTimeRange(fromDate, toDate);
	}
	
	public boolean validateCodeExist(String code,String companyId) {
		return payCardDao.validateCodeExist(code,companyId);
	}
}
