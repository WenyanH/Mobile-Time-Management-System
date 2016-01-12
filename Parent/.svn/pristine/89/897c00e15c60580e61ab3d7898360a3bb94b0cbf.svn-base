package com.tms.dao.companystructure;

import java.util.List;

import com.tms.dao.core.IDao;
import com.tms.entity.CompanyStructure;

public interface CStructureDao extends IDao<CompanyStructure, String>{
	public abstract List<CompanyStructure>findAllStructures(String companyId);
	public abstract Boolean validateNameExist(String name, String companyId);
	public abstract List<CompanyStructure> findActiveStructures(String companyId);		
}


	
