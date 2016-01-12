package com.tms.service.resource;


import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.tms.core.test.BaseTest;
import com.tms.entity.Resource;
import com.tms.entity.ResourceType;

public class RresourceTest extends BaseTest{
	
	@Autowired
	private ResourceService resourceService;
	
	@Test	
    public void saveresource(){
		Resource resource=new Resource();
		resource.setId("company");
		resource.setContent("company");
		resource.setType(ResourceType.URL);
		resourceService.save(resource);
		Resource newResource=new Resource();		
		newResource=resourceService.findById("company");
		Assert.assertEquals(resource, newResource);
	}
}
