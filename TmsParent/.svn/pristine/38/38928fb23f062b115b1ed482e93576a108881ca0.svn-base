package com.tms.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.tms.conditions.UserConditions;
import com.tms.dao.core.AbsDao;
import com.tms.dao.core.Hints;
import com.tms.entity.User;
import com.tms.entity.UserStatus;
import com.tms.pages.IPageList;
import com.tms.pages.PageListImpl;
import com.tms.utils.ProcessSignUtils;

@Repository
public class UserDaoImpl extends AbsDao<User, String> implements UserDao {

	private static final String LOGIN = " from User where email = ? and password = ?";

	private static final String SQL_RESOUECE = " from User where (email like ? or firstName like ? or lastName like ?) and company.id = ? ";

	private static final String VALIDATE_CODE = " from User where email = ?";

	private static final String FIND_ALL_USER = " from User where company.id = ? order by createTime desc";

	private static final String FIND_USER = " select user from User user join user.roles role where user.company.id = ? and role.name = ? or role.name = ? or role.name = ? order by user.createTime desc";
	
	private static final String FIND_USER_BY_ROLE = " select user from User user join user.roles role where role.name = ? and user.company.id = ? order by user.createTime desc";
	
	private static final String FIND_USER_BY_CONDITION = " select u from User u join u.employee e join u.roles r where u.company.id = ? ";
	
	private static final String FIND_USER_BY_ROLE2 = " select user from User user join user.roles role where role.name = ? order by user.createTime desc";
	
	@Override
	public List<User> findByConditions(UserConditions condition) {
		String sqlWhere = "";
		if (!StringUtils.isEmpty(condition.getFirstName())) {
			sqlWhere += " and u.firstName like '%" + condition.getFirstName() + "%'";
		}

		if (!StringUtils.isEmpty(condition.getLastName())) {
			sqlWhere += " and u.lastName like '%" + condition.getLastName() + "%'";
		}

		if (!StringUtils.isEmpty(condition.getMiddleName())) {
			sqlWhere += " and u.middleName like '%" + condition.getMiddleName() + "%'";
		}
		
		if (!StringUtils.isEmpty(condition.getDepartment())) {
			sqlWhere += " and (";
			try {
				String[] departmentIds = ProcessSignUtils.getInstance()
						.processComma(condition.getDepartment());

				for (String id : departmentIds) {
					sqlWhere += " e.department.id ='" + id + "' or";
				}
			} catch (Exception e) {

			}
			sqlWhere = sqlWhere.substring(0, sqlWhere.length() - 2);
			sqlWhere += " )";
		}
		
		if (!StringUtils.isEmpty(condition.getUserStatus())) {
			UserStatus status = Enum.valueOf(UserStatus.class, condition.getUserStatus());
			if (status != null) {
				sqlWhere += " and u.status ='" + status.ordinal() + "'";
			}
		}
		
		
		
		if (condition.getSource() != null) {
			if (condition.getIsEmployee()!=null && condition.getIsEmployee()) {
				sqlWhere += " and (u.source ='" + condition.getSource().ordinal() + "' or u.isEmployee =" + condition.getIsEmployee()+")";
			} else {
				sqlWhere += " and u.source ='" + condition.getSource().ordinal() + "'";
			}
			
		}
		/*
		if (condition.getIsEmployee()!=null) {
			sqlWhere += " and u.isEmployee =" + condition.getIsEmployee();
		}*/
		
	
		if (StringUtils.isEmpty(condition.getOrder())){
			sqlWhere += " order by u.createTime desc";
		} else {
			sqlWhere += " order by "+condition.getOrder()+" "+ condition.getSort();
		}
		
		return find(FIND_USER_BY_CONDITION + sqlWhere, new Hints(0), condition.getCompanyId());
	}
	
	@Override
	public User login(String user, String password) {
		return findUnique(LOGIN, new Hints(), user, password);
	}
	
	@Override
	public List<User> findCompanyUser(String company) {
		return find(FIND_USER, new Hints(), company, "admin", "supervisor", "payroll");
	}

	@Override
	public List<User> findUserByRole(String role, String company) {
		List<User> users = find(FIND_USER_BY_ROLE, new Hints(), role, company);
		return users;
	}
	
	@Override
	public List<User> findUserByRole(String role) {
		List<User> users = find(FIND_USER_BY_ROLE2, new Hints(), role);
		return users;
	}

	@Override
	public IPageList<User> findUserPage(String searchStr, String companyId, String order, String sort, Hints hints) {
		if (order == null) {
			order = "createTime";
		}
		if (sort == null) {
			sort = "desc";
		}
		String param = "%" + searchStr + "%";
		IPageList<User> users = new PageListImpl<User>();
		users.setRecords(find(SQL_RESOUECE + sortHQL(order, sort), hints, param, param, param, companyId));
		users.setRecordTotal(findCount(" select count(*) " + SQL_RESOUECE, param, param, param, companyId));
		return users;
	}

	@Override
	public Boolean validateEmailExist(String email) {
		Long count = findCount(" select count(*) " + VALIDATE_CODE, email);
		if (count > 0)
			return true;
		else
			return false;
	}

	public List<User> findAllUser(String companyId) {
		return find(FIND_ALL_USER, new Hints(0), companyId);
	}

	public List<User> findUserByEmail(String email) {
		return find(VALIDATE_CODE, new Hints(0), email);
	}

	@Override
	public User findUserByUID(String uid) {
		return find(uid);
	}

}
