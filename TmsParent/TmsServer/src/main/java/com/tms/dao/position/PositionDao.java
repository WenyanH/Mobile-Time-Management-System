package com.tms.dao.position;

import java.util.List;

import com.tms.dao.core.Hints;
import com.tms.dao.core.IDao;
import com.tms.entity.tms.Position;
import com.tms.pages.IPageList;

public interface PositionDao extends IDao<Position, String> {
	
	public abstract IPageList<Position> findPositionPage(String searchStr, String companyId, String order, String sort,Hints hints);

	public abstract Boolean validateCodeNamePunchCodeExist(String code, String name, String punchCode, String companyId);

	public abstract List<Position> findAllPosition(String companyId);
}
