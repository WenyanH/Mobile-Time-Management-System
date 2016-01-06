package com.tms.dao.resource;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.Resource;
import com.tms.entity.ResourceType;

/**
 * @author zwq
 *
 */
public interface ResourceDao extends IDao<Resource, String>{
	public abstract List<Resource> findAllResourceByType(ResourceType type);
}
