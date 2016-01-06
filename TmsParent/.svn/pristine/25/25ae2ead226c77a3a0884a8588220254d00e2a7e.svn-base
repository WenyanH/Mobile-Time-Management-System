package com.tms.dao.companystructure;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.CompanyStructure;

@Repository
public class CStructureDaoImpl extends AbsDao<CompanyStructure, String> implements CStructureDao{
	private static final String FIND_STRUCTURE = " from CompanyStructure where company.id = ?  order by level desc";
	private static final String FIND_ACTIVE_STRUCTURE = " from CompanyStructure where company.id = ? and isActive = true order by level asc";
	private static final String VALIDATE_NAME = " from CompanyStructure where name= ? and company.id = ? ";
	@Override
	public Boolean validateNameExist(String name, String companyId) {
		 Long count = findCount(" select count(*) " + VALIDATE_NAME, companyId);
		 if (count>0)
		   return true;
           else
			return false;
	}
	@Override
	public List<CompanyStructure> findAllStructures(String companyId) {		
		return find(FIND_STRUCTURE , new Hints(0), companyId);
	}
	
	@Override
	public List<CompanyStructure> findActiveStructures(String companyId) {		
		return find(FIND_ACTIVE_STRUCTURE , new Hints(0), companyId);
	}
}

