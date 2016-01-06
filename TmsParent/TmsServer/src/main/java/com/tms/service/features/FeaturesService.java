package com.tms.service.features;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.features.FeaturesDao;
import com.tms.entity.customer.Features;


@Service
@Transactional(readOnly = true)
public class FeaturesService {
	@Autowired
	private FeaturesDao featuresDao;

	@Transactional
	public Features save(final Features features) {
		return featuresDao.save(features);
	}

	public Features findById(final String rid) {
		return featuresDao.find(rid);
	}

	public List<Features> findAll() {
		return featuresDao.findAll();
	}
	
}
