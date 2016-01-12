package com.tms.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.tms.conditions.UserConditions;
import com.tms.dao.core.Hints;
import com.tms.dao.user.UserDao;
import com.tms.entity.User;
import com.tms.pages.IPageList;
import com.tms.utils.MD5;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserDao userDao;

	@Transactional
	public User save(final User userInfo) {
		return userDao.save(userInfo);
	}

	@Transactional
	public void update(final User userInfo) {
		
		userDao.update(userInfo);
	}

	public List<User> findCompanyUser(String company) {
		return userDao.findCompanyUser(company);
	}
	
	public List<User> findUserByRole(String role, String company) {
		return userDao.findUserByRole(role, company);
	}
	
	public List<User> findUserByRole(String role) {
		return userDao.findUserByRole(role);
	}

	public User findByUId(final String userId) {
		return userDao.findUserByUID(userId);
	}

	public User userLogin(final String userId, final String password) {
		return userDao.login(userId, MD5.digest(password));
	}

	public List<User> findAll() {
		return userDao.findAll();
	}

	@Transactional
	public void remove(final String userId) {
		userDao.remove(userId);
	}

	public IPageList<User> findUserPage(String searchStr, String companyId, String order, String sort, Hints hints) {
		IPageList<User> users = userDao.findUserPage(searchStr, companyId, order, sort, hints);
		return users;
	}

	public Boolean validateEmailExist(String email) {
		return userDao.validateEmailExist(email);
	}

	public List<User> findAllUser(String companyId) {
		return userDao.findAllUser(companyId);
	}

	public List<User> findUserByEmail(String email) {
		return userDao.findUserByEmail(email);
	}
	
	public List<User> findByConditions(UserConditions condition) {
		return userDao.findByConditions(condition);
	}
}
