package com.tms.service.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tms.dao.role.RoleDao;
import com.tms.entity.Role;

/**
 * @author zwq
 *
 */
@Service
@Transactional(readOnly = true)
public class RoleService {

	@Autowired
	private RoleDao roleDao;

	@Transactional
	public Role save(final Role role) {
		return roleDao.save(role);
	}

	public Role findById(final String roleId) {
		return roleDao.find(roleId);
	}

	public List<Role> findAll() {
		return roleDao.findAll();
	}
}
