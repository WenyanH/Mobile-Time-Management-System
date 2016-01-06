package com.tms.dao.paygroup;

import java.util.List;

import com.tms.dao.core.Hints;
import com.tms.dao.core.IDao;
import com.tms.entity.tms.PayGroup;
import com.tms.pages.IPageList;

public interface PayGroupDao extends IDao<PayGroup, String> {

	public abstract IPageList<PayGroup> findPayGroups(Hints hints,String company);
	
	public abstract List<PayGroup> findPayGroups(String companyId);
	
	public abstract Boolean validateCodeNameExist(String code, String name, String companyId);
}
