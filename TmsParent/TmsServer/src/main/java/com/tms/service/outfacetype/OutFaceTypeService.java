package com.tms.service.outfacetype;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.outfacetype.OutFaceTypeDao;
import com.tms.entity.customer.OutFaceType;

@Service
@Transactional(readOnly = true)
public class OutFaceTypeService {
	@Autowired
	private OutFaceTypeDao outFaceTypeDao;

	@Transactional
	public OutFaceType save(final OutFaceType outFaceType) {
		return outFaceTypeDao.save(outFaceType);
	}

	public OutFaceType findById(final String rid) {
		return outFaceTypeDao.find(rid);
	}

	public List<OutFaceType> findAll() {
		return outFaceTypeDao.findAll();
	}
	
}
