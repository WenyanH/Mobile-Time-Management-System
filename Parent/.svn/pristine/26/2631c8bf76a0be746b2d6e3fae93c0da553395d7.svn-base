package com.tms.controller.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.conditions.UserConditions;
import com.tms.controller.base.BaseController;
import com.tms.entity.Employee;
import com.tms.entity.User;
import com.tms.entity.UserSource;
import com.tms.entity.UserStatus;
import com.tms.entity.commonfunctions.PayCard;
import com.tms.service.employee.EmployeeService;
import com.tms.service.paycard.PayCardService;
import com.tms.service.user.UserService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.PayCardVo;
import com.tms.vo.UserVo;


@Controller
@RequestMapping("/recalculate")
public class RecalculateController extends BaseController<Object> {
	
	@Autowired
	private UserService userService;
	
	
	@Autowired 
	private EmployeeService employeeService; 	

	
	@RequestMapping("/condition")
	public ModelAndView condition(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		List<Employee> employees = employeeService.findAllEmployee(user.getCompany().getId());
		view.getModelMap().put("employees", employees);
		view.setViewName("common/recalculate/recalculate");
		return view;
	}
}
