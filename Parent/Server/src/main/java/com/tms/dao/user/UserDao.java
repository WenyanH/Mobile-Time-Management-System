package com.tms.dao.user;

import java.util.List;

import com.tms.conditions.UserConditions;
import com.tms.dao.core.Hints;
import com.tms.dao.core.IDao;
import com.tms.entity.User;
import com.tms.pages.IPageList;

public interface UserDao extends IDao<User, String> {

	public abstract User login(String user, String password);

	public abstract IPageList<User> findUserPage(String searchStr, String companyId, String order, String sort, Hints hints);

	public abstract Boolean validateEmailExist(String email);

	public abstract List<User> findAllUser(String companyId);

	public abstract List<User> findUserByEmail(String email);

	public abstract User findUserByUID(String uid);

	public abstract List<User> findUserByRole(String role, String company);
	
	public abstract List<User> findUserByRole(String role);
	
	public abstract List<User> findCompanyUser(String company);

	public abstract List<User> findByConditions(UserConditions condition);
}
