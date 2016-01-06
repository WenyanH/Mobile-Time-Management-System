package com.tms.service.resource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.resource.ResourceDao;
import com.tms.entity.Resource;
import com.tms.entity.ResourceType;

/**
 * @author zwq
 *
 */
@Service
@Transactional(readOnly = true)
public class ResourceService {

	@Autowired
	private ResourceDao recourceDao;

	@Transactional
	public Resource save(final Resource resource) {
		return recourceDao.save(resource);
	}

	public Resource findById(final String rid) {
		return recourceDao.find(rid);
	}

	public List<Resource> findAll() {
		return recourceDao.findAll();
	}
	
	public  List<Resource> findAllResourceByType(ResourceType type){
		return recourceDao.findAllResourceByType(type);
	}
}
