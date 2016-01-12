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
import com.tms.entity.User;
import com.tms.entity.UserSource;
import com.tms.entity.commonfunctions.PayCard;
import com.tms.service.employee.EmployeeService;
import com.tms.service.paycard.PayCardService;
import com.tms.service.user.UserService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.PayCardVo;
import com.tms.vo.UserVo;


@Controller
@RequestMapping("/paycard")
public class PayCardController extends BaseController<Object> {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PayCardService payCardService;
	
	@Autowired 
	private EmployeeService employeeService; 	
	
	@RequestMapping("/list")
	public ModelAndView payPayCardList(String employeeId,String fromDate,String toDate, HttpServletResponse response, HttpServletRequest request) throws Exception {
		new ModelAndView();

		ModelAndView view = payPayCardListValue(employeeId,fromDate,toDate,response, request);
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
		
		view.setViewName("common/paycard/paycardlist");
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView payPayCardListValue(String employeeId,String fromDate,String toDate, HttpServletResponse response, HttpServletRequest request)throws Exception {
		ModelAndView view = new ModelAndView();
		String company = SessionUtils.getCompany(request);
		if(StringUtils.isNotEmpty(employeeId)){
			List<PayCard> payCards = payCardService.findPayCards(employeeId,company);
			if(CollectionUtils.isNotEmpty(payCards)){
				List<PayCardVo> payCardVos=new ArrayList<PayCardVo>();
				for(PayCard payCard:payCards){
					payCardVos.add(new PayCardVo(payCard));
				}
				view.getModelMap().put("payCards", payCardVos);
			}
		}else if(StringUtils.isNotEmpty(fromDate)&&StringUtils.isNotEmpty(toDate)){
			Calendar calendar = Calendar.getInstance(); 
			calendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(toDate));
			calendar.set(Calendar.HOUR_OF_DAY, 23);
			calendar.set(Calendar.MINUTE, 59);
			calendar.set(Calendar.SECOND, 59);
			List<PayCard> payCards = payCardService.findPayCardsByTimeRange(fromDate, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime()));
			if(CollectionUtils.isNotEmpty(payCards)){
				List<PayCardVo> payCardVos=new ArrayList<PayCardVo>();
				for(PayCard payCard:payCards){
					payCardVos.add(new PayCardVo(payCard));
				}
				view.getModelMap().put("payCards", payCardVos);
			}
		}
		view.setViewName("common/paycard/paycardlistlisttable");
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
		//分割以","号连接的字符串成字符串数组
		String[] paygroupIds =ProcessSignUtils.getInstance().processComma(ids);
		for (String id : paygroupIds) {
			payCardService.remove(id);
		}
		return view;
	}
}
