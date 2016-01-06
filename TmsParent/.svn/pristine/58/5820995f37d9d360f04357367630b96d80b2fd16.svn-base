package com.tms.controller.common;

import java.util.ArrayList;
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
import com.tms.entity.User;
import com.tms.entity.UserSource;
import com.tms.entity.commonfunctions.PayrollTransfer;
import com.tms.service.employee.EmployeeService;
import com.tms.service.payrolltransfer.PayrollTransferService;
import com.tms.service.user.UserService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.PayrollTransferVo;
import com.tms.vo.UserVo;


@Controller
@RequestMapping("/payrolltransfer")
public class PayrollTransferController extends BaseController<Object> {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PayrollTransferService payrollTransferService;
	
	@Autowired 
	private EmployeeService employeeService; 	

	@RequestMapping("/create")
	public ModelAndView createPayrollTransfer(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		if (user.getCompany() != null) {
			UserConditions condition=new UserConditions();
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
		view.setViewName("common/payrolltransfer/savepayrolltransfer");
		return view;
	}
	
	@RequestMapping("/employees")
	public ModelAndView employeeList(HttpServletResponse response, HttpServletRequest request) throws Exception {
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
		
		view.setViewName("common/payrolltransfer/employees");
		return view;
	}

	@RequestMapping("/list")
	public ModelAndView payrollTransferList(String employeeId, HttpServletResponse response, HttpServletRequest request) throws Exception {
		new ModelAndView();

		ModelAndView view = payrollTransferListValue(employeeId, response, request);
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
		
		view.setViewName("common/payrolltransfer/payrolltransferlist");
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView payrollTransferListValue(String employeeId, HttpServletResponse response, HttpServletRequest request)throws Exception {
		ModelAndView view = new ModelAndView();
		String company = SessionUtils.getCompany(request);
		List<PayrollTransfer> payrollTransfers = payrollTransferService.findPayrollTransfers(employeeId,company);
		if(CollectionUtils.isNotEmpty(payrollTransfers)){
			List<PayrollTransferVo> payrollTransferVos=new ArrayList<PayrollTransferVo>();
			for(PayrollTransfer payrollTransfer:payrollTransfers){
				payrollTransferVos.add(new PayrollTransferVo(payrollTransfer));
			}
			view.getModelMap().put("payrollTransfers", payrollTransferVos);
		}
		
		view.setViewName("common/payrolltransfer/payrolltransferlisttable");
		return view;
	}
	
	
	@RequestMapping("/delete")
	public ModelAndView deletePayrollTransfer(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error");
			return view;
		}
		String[] paygroupIds = ProcessSignUtils.getInstance().processComma(ids);		
		for (String id : paygroupIds) {
			payrollTransferService.remove(id);
		}
		return view;
	}
	@RequestMapping("/open")
	public ModelAndView opendPayrollTransfer(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error,ids is empty");
			return view;
		}
		String[] paygroupIds = ProcessSignUtils.getInstance().processComma(ids);		

		for (String id : paygroupIds) {
			PayrollTransfer payrollTransfer=payrollTransferService.findById(id);
			if(payrollTransfer!=null){
				payrollTransfer.setIsClosed(false);
				payrollTransferService.update(payrollTransfer);
			}
		}

		return view;
	}
	@RequestMapping("/close")
	public ModelAndView closePayrollTransfer(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error");
			return view;
		}
		String[] paygroupIds = ProcessSignUtils.getInstance().processComma(ids);
		for (String id : paygroupIds) {
			PayrollTransfer payrollTransfer=payrollTransferService.findById(id);
			if(payrollTransfer!=null){
				payrollTransfer.setIsClosed(true);
				payrollTransferService.update(payrollTransfer);
			}
		}
		return view;
	}
	@RequestMapping("/relcalculate")
	public ModelAndView relcalculatePayrollTransfer(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.getModel().put("message", "success");
		return view;
	}
}
