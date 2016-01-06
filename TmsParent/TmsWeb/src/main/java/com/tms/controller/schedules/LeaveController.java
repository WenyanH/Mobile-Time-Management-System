package com.tms.controller.schedules;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.controller.base.BaseController;
import com.tms.entity.Employee;
import com.tms.entity.User;
import com.tms.entity.tms.Leave;
import com.tms.entity.tms.PayType;
import com.tms.service.employee.EmployeeService;
import com.tms.service.leave.LeaveService;
import com.tms.service.tms.TMSService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.LeaveVo;

@Controller
@RequestMapping("/leave")

public class LeaveController extends BaseController<Object> {
	@Autowired
	private LeaveService leaveService;
	
	@Autowired
	private TMSService tmsService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/list")
	public ModelAndView leaveList(String employeeId,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = leaveListValue(employeeId,response, request);
		view.setViewName("empschedule/leave/leavelist");
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView leaveListValue(String employeeId,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		
		User user = SessionUtils.getUser(request);
		List<Leave> leaves =null;
		if(StringUtils.isNotEmpty(employeeId)){
			leaves =leaveService.findLeavesByEmployeeId(employeeId);
			
		}else{
			leaves =leaveService.findLeaves(user.getCompany().getId());
		}
		view.getModelMap().put("leaves", leaves);
		view.setViewName("empschedule/leave/leavelisttable");
		return view;
	}
	@RequestMapping("/createEmployee")
	public ModelAndView createEmployee(String employeeId,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		Employee employee = employeeService.findById(employeeId);
		if(employee!=null){
			view.getModelMap().put("employeeName", employee.getFirstName()+employee.getLastName());
			view.getModelMap().put("employeeId", employeeId);
		}
		
		List<PayType> paytypeList=tmsService.findPayTypes(user.getCompany().getId());
		view.getModelMap().put("paytypeList", paytypeList);
		
		view.setViewName("mydetail/employee/saveemployeeleave");
		return view;
	}
	@RequestMapping("/create")
	public ModelAndView createLeave(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		List<Employee> employeeList = employeeService.findAllEmployee(user.getCompany().getId());
		view.getModelMap().put("employeeList", employeeList);
		
		List<PayType> paytypeList=tmsService.findPayTypes(user.getCompany().getId());
		view.getModelMap().put("paytypeList", paytypeList);
		
		view.setViewName("empschedule/leave/saveleave");
		return view;
	}
	
	@RequestMapping("/update")
	public ModelAndView updateLeave(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Leave leave = leaveService.findById(id);
	    User user = SessionUtils.getUser(request);
		List<Employee> employeeList = employeeService.findAllEmployee(user.getCompany().getId());
		view.getModelMap().put("employeeList", employeeList);		
		List<PayType> paytypeList=tmsService.findPayTypes(user.getCompany().getId());
		view.getModelMap().put("paytypeList", paytypeList);		
		view.getModel().put("leave", new LeaveVo(leave));
		view.setViewName("empschedule/leave/saveleave");
		return view;
	}
	
	@RequestMapping("/save")
	public ModelAndView saveLeave(LeaveVo leaveVo,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		ModelAndView view = new ModelAndView();
		try {
			User user = SessionUtils.getUser(request);
			Leave leave=new Leave();
			//处理页面参数为后台实体对象
			leave = getSaveLeveByVO(leaveVo, leave);
			if (StringUtils.isEmpty(leave.getId())) {
				leave.setCompany(user.getCompany());
				leaveService.save(leave);
			 } 
			else {
				leaveService.update(leave);
			}
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
		return view;
	}

	/**
	 * 处理页面参数为后台实体对象
	 * @param leaveVo
	 * @param leave
	 * @return Leave 
	 * @throws ParseException
	 */
	private Leave getSaveLeveByVO(LeaveVo leaveVo, Leave leave)
			throws Exception {
		try {
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
			if(StringUtils.isNotEmpty(leaveVo.getId())){
				leave=leaveService.findById(leaveVo.getId());
			}
			if(StringUtils.isNotEmpty(leaveVo.getEmployeeId())){
				Employee employee=employeeService.findById(leaveVo.getEmployeeId());
				leave.setEmployee(employee);
				employee.getLeave().add(leave);
			}
			if(StringUtils.isNotEmpty(leaveVo.getTypeId())){
				PayType payType=tmsService.findPayTypeById(leaveVo.getTypeId());
				leave.setPayType(payType);	
				payType.getLeave().add(leave);
			}
			if(StringUtils.isNotEmpty(leaveVo.getFromDate())){
				leave.setFromDate(sdf.parse(leaveVo.getFromDate()));
			}
			if(StringUtils.isNotEmpty(leaveVo.getToDate())){
				leave.setToDate(sdf.parse(leaveVo.getToDate()));
			}
			
			if(StringUtils.isNotEmpty(leaveVo.getFromLeaveTime())){
				leave.setFromLeaveTime(leaveVo.getFromLeaveTime());
			}
			if(StringUtils.isNotEmpty(leaveVo.getToLeaveTime())){
				leave.setToLeaveTime(leaveVo.getToLeaveTime());
			}
			leave.setDescription(leaveVo.getDescription());
			leave.setByWorkHours(leaveVo.isByWorkHours());
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return leave;
	}
	

	@RequestMapping("/delete")
	public ModelAndView deleteLeave(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();	
		//分割以","号连接的字符串成字符串数组
		String[] leaveIds = ProcessSignUtils.getInstance().processComma(ids);		
		for (String id : leaveIds) {
			leaveService.remove(id);
		}
		return view;
	}
	
}
