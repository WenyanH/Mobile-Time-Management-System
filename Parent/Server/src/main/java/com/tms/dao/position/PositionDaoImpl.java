package com.tms.dao.position;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.tms.Position;
import com.tms.pages.IPageList;
import com.tms.pages.PageListImpl;

@Repository
public class PositionDaoImpl extends AbsDao<Position, String> implements PositionDao {
	
	private static final String FIND_ALL_POSITION = " from Position where company.id = ? order by createTime desc";
	private static final String FIND_POSITION_PAGE = " from Position where (code like ? or name like ?) and company.id = ? ";
	private static final String VALIDATE_CODE_NAME_PUNCHCODE = " from Position where (code = ? or name= ? or punchCode= ?)  and company.id = ? ";

	@Override
	public Boolean validateCodeNamePunchCodeExist(String code, String name, String punchCode, String companyId) {	
			Long count = findCount(" select count(*) " + VALIDATE_CODE_NAME_PUNCHCODE, code, name, punchCode, companyId);
			if (count>0)
				return true;
			else
				return false;
		
	}

	@Override
	public List<Position> findAllPosition(String companyId) {
		return find(FIND_ALL_POSITION , new Hints(0), companyId);
	}
	
	@Override
	public IPageList<Position> findPositionPage(String searchStr, String companyId, String order, String sort, Hints hints) {
		
		
		if (order==null){
			order = "createTime";
		}
		if (sort==null){
			sort="desc";
		}
		String param = "%" + searchStr + "%";
		IPageList<Position> position = new PageListImpl<Position>();
		position.setRecords(find(FIND_POSITION_PAGE + sortHQL(order, sort), hints, param, param, companyId));
		position.setRecordTotal(findCount(" select count(*) " + FIND_POSITION_PAGE, param, param, companyId));
		return position;
	}	
	
	
	
}
