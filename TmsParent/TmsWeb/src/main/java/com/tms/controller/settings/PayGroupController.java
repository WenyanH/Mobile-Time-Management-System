package com.tms.controller.settings;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.controller.base.BaseController;
import com.tms.dao.core.Hints;
import com.tms.entity.User;
import com.tms.entity.tms.PayGroup;
import com.tms.entity.tms.PayPeriod;
import com.tms.pages.IPageList;
import com.tms.service.tms.TMSService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;

@Controller
@RequestMapping("/paygroup")
public class PayGroupController extends BaseController<Object> {

	@Autowired
	private TMSService tmsService;

	@RequestMapping("/create")
	public ModelAndView createPaygroup(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		view.getModelMap().put("ptype", PayPeriod.values());
		view.setViewName("tms/paygroup/savepaygroup");
		return view;
	}

	@RequestMapping("/list")
	public ModelAndView paygroupList(HttpServletResponse response, HttpServletRequest request) throws Exception {		
		ModelAndView view = new ModelAndView();
		String company = SessionUtils.getCompany(request);
		IPageList<PayGroup> payGroups = tmsService.findAllPageGroups(
				new Hints(), company);
		view.getModelMap().put("paygroups", payGroups);
		view.setViewName("tms/paygroup/paygrouplist");
		return view;
	}
	
	
	@RequestMapping("/list_nd")
	public ModelAndView paygroupListValue(HttpServletResponse response, HttpServletRequest request)throws Exception {
		ModelAndView view = new ModelAndView();		
		User user = SessionUtils.getUser(request);
		IPageList<PayGroup> payGroups = tmsService.findAllPageGroups(new Hints(), user.getCompany().getId());
		view.getModelMap().put("paygroups", payGroups);
		view.setViewName("tms/paygroup/paygrouplisttable");
		return view;
	}
	
	@RequestMapping("/update")
	public ModelAndView updatePaygroup(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
 		PayGroup paygroup = tmsService.findPayGroupById(id);
 		view.getModel().put("ptype", PayPeriod.values());
		view.getModel().put("paygroup", paygroup);
		view.setViewName("tms/paygroup/savepaygroup");
		return view;
	}
	
	@RequestMapping("/save")
	public ModelAndView savePayGroup(PayGroup payGroup, HttpServletResponse response, HttpServletRequest request)
			throws Exception {		
		ModelAndView view = new ModelAndView();		
		try {
			User user = SessionUtils.getUser(request);
			payGroup.setCompany(user.getCompany());
			if (StringUtils.isEmpty(payGroup.getId())) {
				if (tmsService.validatePayGroupCodeNameExist(payGroup.getCode(),payGroup.getName(), user.getCompany().getId())) {
					view.getModel().put("message", "exist");
					return view;
				} else {
					payGroup.setCreatedOn(new Date());
					tmsService.savePayGroup(payGroup);
				}
			} else {
				PayGroup tmp = tmsService.findPayGroupById(payGroup.getId());
				String code = null;
				String name = null;
				payGroup.setCreatedOn(tmp.getCreatedOn());
				if (tmp.getCode().equals(payGroup.getCode()) && tmp.getName().equals(payGroup.getName())){
					tmsService.updatePayGroup(payGroup);
				} else {
					if (!tmp.getCode().equals(payGroup.getCode())){
						code = payGroup.getCode();
					}
					if (!tmp.getName().equals(payGroup.getName())){
						name = payGroup.getName();
					}
					if (tmsService.validatePayGroupCodeNameExist(code, name, user.getCompany().getId())) {
						view.getModel().put("message", "exist");
						return view;
					} else {
						tmsService.updatePayGroup(payGroup);
					}
				}
				
			}
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}		
		return view;
		
	}
	
	@RequestMapping("/delete")
	public ModelAndView deletePaygroup(String ids,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		String[] paygroupIds = ProcessSignUtils.getInstance().processComma(ids);
		for (String id : paygroupIds) {
			tmsService.removePayGroup(id);
		}
		return view;
	}
	
}
