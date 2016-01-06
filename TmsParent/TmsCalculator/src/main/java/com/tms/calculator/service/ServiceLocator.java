package com.tms.calculator.service;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ServiceLocator {
	
	private static ServiceLocator serviceLocator = new ServiceLocator();
	
	private ApplicationContext appContext;

	private ServiceLocator() {
		appContext = new ClassPathXmlApplicationContext("classpath:spring-beans.xml");
	}

	public static final ServiceLocator getInstance() {
		return serviceLocator;
	}

	public <T> T loadService(Class<T> c) {
		return appContext.getBean(c);
	}

}
