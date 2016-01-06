package com.tms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.annotation.Auth;
import com.tms.conditions.UserConditions;
import com.tms.controller.base.BaseController;
import com.tms.entity.Resource;
import com.tms.entity.ResourceType;
import com.tms.entity.Role;
import com.tms.entity.User;
import com.tms.entity.UserSource;
import com.tms.service.resource.ResourceService;
import com.tms.service.role.RoleService;
import com.tms.service.user.UserService;
import com.tms.utils.SessionUtils;
import com.tms.vo.UserVo;

@Controller
public class WebSiteController extends BaseController<Object> {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private ResourceService resourceService;

	@Auth(verifyLogin = true, verifyURL = false)
	@RequestMapping("/dashboard")
	public ModelAndView dashboard(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		
		UserConditions condition = new UserConditions();
		User user = SessionUtils.getUser(request);
		if (user.getCompany() != null) {
			condition.setIsEmployee(true);
			condition.setCompanyId(user.getCompany().getId());
			condition.setSource(UserSource.Employee);
			List<User> users = userService.findByConditions(condition);
			if (CollectionUtils.isNotEmpty(users)) {
				List<UserVo> userVos = new ArrayList<UserVo>();
				for (User tempUser : users) {
					userVos.add(new UserVo(tempUser));
				}
				view.getModelMap().put("users", userVos);
			}
		}
		
		
		
		view.setViewName("dashboard");
		return view;
	}

	@Auth(verifyLogin = false, verifyURL = false)
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, String errorMessage) throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		if (user != null) {
			view.setViewName("redirect:/dashboard");
		} else {
			view.setViewName("login");			
		}
		return view;
	}
	@Auth(verifyLogin = false, verifyURL = false)
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		SessionUtils.removeUser(request);
		ModelAndView t_view = new ModelAndView();
		t_view.setViewName("redirect:/login");
		return t_view;
	}

	@Auth(verifyLogin = false, verifyURL = false)
	@RequestMapping("/signin")
	public ModelAndView signin(HttpServletRequest request,
			final HttpServletResponse response, String userId, String password)
			throws Exception {
		ModelAndView view = new ModelAndView();
		User user = userService.userLogin(userId, password);
		if (user != null) {
			// 设置User到Session
			SessionUtils.setUser(request, user);
			buildDate(request);			
		} else {
			view.getModelMap().addAttribute("message", "error");			
		}
		return view;
	}

	private void buildDate(HttpServletRequest request) {
		// 能够访问的url列表
		List<String> accessUrls = new ArrayList<String>();
		User user = SessionUtils.getUser(request);
		Set<Role> roles = user.getRoles();
		if(!roles.isEmpty()){
			Role role = roles.iterator().next();
			Set<Resource> resources = role.getResources();
			// 菜单对应的按钮
			Map<String, List> menuBtnMap = new HashMap<String, List>();
			Set<Resource> userRources=user.getResources();
			if(userRources!=null&&userRources.size()>0){
				resources=userRources;
			}
			if (CollectionUtils.isNotEmpty(resources)) {
				for (Resource resource : resources) {
					if(resource.getType().equals(ResourceType.URL)){
						accessUrls.add(resource.getId());
					}
				}
			}
			SessionUtils.setAccessUrl(request, accessUrls);// 设置可访问的URL
			SessionUtils.setMemuBtnMap(request, menuBtnMap); // 设置可用的按钮
		}
	}

	@Auth(verifyLogin = false, verifyURL = false)
	@RequestMapping("/forgotpassword")
	public ModelAndView forgotpassword(HttpServletRequest request) throws Exception {
		ModelAndView t_view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		if (user != null) {
			t_view.setViewName("redirect:/dashboard");
		}else{
			t_view.setViewName("forgotpassword");
		}
		return t_view;
	}
}