package com.tms.user;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import com.tms.core.test.BaseTest;
import com.tms.entity.Company;
import com.tms.entity.Role;
import com.tms.entity.User;
import com.tms.service.company.CompanyService;
import com.tms.service.role.RoleService;
import com.tms.service.user.UserService;

public class UserTest extends BaseTest {
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;

	@Test
	public void saveUser() {
		User user = new User();
		user.setEmail("xinyu955@163.com");
		user.setPassword("123456");
		userService.save(user);
		User newUser = new User();
		newUser = userService.findByUId(user.getId());
		Assert.assertEquals(user, newUser);
	}

	@Test
	public void updateUser() {
		User user = new User();
		user.setEmail("xinyu955@163.com");
		user.setPassword("123456");
		userService.save(user);
		// user.setAddress("新西兰");
		userService.update(user);
		User newUser = new User();
		newUser = userService.findByUId(user.getId());
		// Assert.assertEquals(user.getAddress(), newUser.getAddress());
	}

	@Test
	public void findUserByRoleTest() {

		Company company = new Company();
		company.setId("company1");
		
		companyService.save(company);

		Role role = new Role();
		role.setId("role1");
		role.setName("role1");
		roleService.save(role);

		User user = new User();
		user.setCompany(company);
		user.getRoles().add(role);
		user.setPassword("password");		
		company.getUser().add(user);
		role.getUsers().add(user);
		userService.save(user);
		Assert.assertNotNull(user.getId());

		List<User> users = userService.findUserByRole(role.getId(), company.getId());
		Assert.assertTrue(users.size() == 1);
		
	}
}
