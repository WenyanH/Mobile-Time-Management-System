package com.tms.dao.resource;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.Resource;
import com.tms.entity.ResourceType;

@Repository
public class ResourceDaoImpl extends AbsDao<Resource, String> implements ResourceDao {

	private static final String FIND_RESOURCE_BY_TYPE = " from Resource where  type = ?";
	public  List<Resource> findAllResourceByType(ResourceType type){
		return find(FIND_RESOURCE_BY_TYPE , new Hints(0), type);
	}
}
