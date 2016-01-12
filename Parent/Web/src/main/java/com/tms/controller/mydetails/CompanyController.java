package com.tms.controller.mydetails;

import java.io.IOException;
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

import com.tms.controller.base.BaseController;
import com.tms.entity.Company;
import com.tms.entity.CompanyStructure;
import com.tms.entity.Department;
import com.tms.entity.User;
import com.tms.entity.customer.TimeZone;
import com.tms.entity.tms.Job;
import com.tms.entity.tms.PayGroup;
import com.tms.entity.tms.Position;
import com.tms.entity.tms.TimeRounding;
import com.tms.service.company.CompanyService;
import com.tms.service.department.DepartmentService;
import com.tms.service.timezone.TimeZoneService;
import com.tms.service.tms.TMSService;
import com.tms.service.user.UserService;
import com.tms.utils.SessionUtils;
import com.tms.vo.CompanyVo;
import com.tms.vo.ZTreeNode;


@RequestMapping("/mydetail")
@Controller
public class CompanyController extends BaseController<Object> {

	@Autowired
	private UserService userService; 	
	@Autowired
	private CompanyService companyService; 	
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private TMSService tmsService;
	@Autowired
	private TimeZoneService timeZoneService;
	
	private static final String COMPANY_PROFILES_LI = "company_profiles_li";

	@RequestMapping("/company")
	public ModelAndView company(HttpServletRequest request) throws Exception {
		ModelAndView t_view = new ModelAndView();
		t_view.addObject("menuId", COMPANY_PROFILES_LI);
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			List<CompanyStructure> companyStructureList = tmsService.findActiveStructures(user.getCompany().getId());
			t_view.getModelMap().put("companyStructureList", companyStructureList);
		}
		t_view.setViewName("mydetail/company/company");
		return t_view;
	}
	@RequestMapping("/tree")
	public void getTree(Boolean iscompany,HttpServletRequest request,HttpServletResponse response){
		User loginUser = SessionUtils.getUser(request);
		if(loginUser.getCompany()!=null){
			List<Department> departments=departmentService.findAllDepartment(loginUser.getCompany().getId());
			List<ZTreeNode> zTreeNodes=new ArrayList<ZTreeNode>();
			if(iscompany==null){
				zTreeNodes.add(new ZTreeNode(loginUser.getCompany().getId(),"0",loginUser.getCompany().getTradingName(),0,true));
			}else{
				if(iscompany){
					zTreeNodes.add(new ZTreeNode(loginUser.getCompany().getId(),"0",loginUser.getCompany().getTradingName(),0,true));
				}
			}
			if(CollectionUtils.isNotEmpty(departments)){
				 for(Department department:departments){
					 if(department.getParent()!=null){
						 zTreeNodes.add(new ZTreeNode(department,department.getParent().getId(),true));
					}else{
						 zTreeNodes.add(new ZTreeNode(department,loginUser.getCompany().getId(),true));
					}
				 }
			}
			try {
				response.getWriter().write(toJson(zTreeNodes));
			} catch (IOException e) {
				e.printStackTrace();				
			}
		}
	}
	@RequestMapping("/companyinfo_nd")
	public ModelAndView companyInfo(HttpServletRequest request) throws Exception {
		ModelAndView t_view = new ModelAndView();
		User loginUser = SessionUtils.getUser(request);
		if(loginUser.getCompany()!=null){
			Company company=companyService.findById(loginUser.getCompany().getId());
			if(company!=null){
				t_view.addObject("company", company);
//				if(company.getBindPayGroup()!=null){
//					t_view.getModelMap().put("payGroupId", company.getBindPayGroup().getId());
//				}
//				if(company.getBindJob()!=null){
//					t_view.getModelMap().put("jobId", company.getBindJob().getId());
//				}
//				if(company.getBindPosition()!=null){
//					t_view.getModelMap().put("positionId", company.getBindPosition().getId());
//				}
				if(company.getBindTimeRounding()!=null){
					t_view.getModelMap().put("timeRoundingId", company.getBindTimeRounding().getId());
				}
				if(company.getTimeZone()!=null){
					t_view.getModelMap().put("timeZoneId", company.getTimeZone().getId());
				}
			}
//			List<PayGroup> payGroups=tmsService.findAllPageGroups(company.getId());
//			t_view.getModelMap().put("payGroups", payGroups);
			
//			List<Job> jobs=tmsService.findAllJobs(company.getId());
//			t_view.getModelMap().put("jobs", jobs);
			
//			List<Position> positions=tmsService.findAllPosition(company.getId());
//			t_view.getModelMap().put("positions", positions);
			
			List<TimeRounding> timeRoundings=tmsService.findAllTimeRoundingsByCompanyId(company.getId());
			t_view.getModelMap().put("timeRoundings", timeRoundings);
			List<TimeZone> timeZones = timeZoneService.findAll();//时区
			t_view.getModelMap().put("timeZones", timeZones);
		}
		
		t_view.setViewName("mydetail/company/companyinfo");
		return t_view;
	}
	/**
	 * 此页面仅仅支持更新
	 * @param customerVo
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public ModelAndView saveCustomer(CompanyVo customerVo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		try {
			if(StringUtils.isEmpty(customerVo.getId())){view.getModel().put("message", "error"); return view; }
			Company tmp = companyService.findById(customerVo.getId());
			if(StringUtils.isNotEmpty(customerVo.getPaygroupId())){
				PayGroup payGroup=tmsService.findPayGroupById(customerVo.getPaygroupId());
				if(payGroup!=null){
					tmp.setBindPayGroup(payGroup);
				}
			}
			if(StringUtils.isNotEmpty(customerVo.getPositionId())){
				Position position=tmsService.findPositionById(customerVo.getPositionId());
				if(position!=null){
					tmp.setBindPosition(position);
				}
			}
			if(StringUtils.isNotEmpty(customerVo.getTimeRoundingId())){
				TimeRounding timeRounding=tmsService.findTimeRoundingbyId(customerVo.getTimeRoundingId());
				if(timeRounding!=null){
					tmp.setBindTimeRounding(timeRounding);
				}
			}
			if(StringUtils.isNotEmpty(customerVo.getJobId())){
				Job job=tmsService.findJobByid(customerVo.getJobId());
				if(job!=null){
					tmp.setBindJob(job);
				}
			}
			if(StringUtils.isNotEmpty(customerVo.getToken())){
				tmp.setToken(customerVo.getToken());
			}
			if(StringUtils.isNotEmpty(customerVo.getName())){
				tmp.setName(customerVo.getName());
			}
			if(StringUtils.isNotEmpty(customerVo.getTitle())){
				tmp.setTitle(customerVo.getTitle());
			}
			if(StringUtils.isNotEmpty(customerVo.getEmail())){
				tmp.setEmail(customerVo.getEmail());
			}
			if(StringUtils.isNotEmpty(customerVo.getMobile())){
				tmp.setMobile(customerVo.getMobile());
			}
			if(StringUtils.isNotEmpty(customerVo.getPhone())){
				tmp.setPhone(customerVo.getPhone());
			}
			if(StringUtils.isNotEmpty(customerVo.getFax())){
				tmp.setFax(customerVo.getFax());
			}
			if(StringUtils.isNotEmpty(customerVo.getPhysicalAddr())){
				tmp.setPhysicalAddr(customerVo.getPhysicalAddr());
			}
			if(StringUtils.isNotEmpty(customerVo.getPostalAddr())){
				tmp.setPostalAddr(customerVo.getPostalAddr());
			}
			if(StringUtils.isNotEmpty(customerVo.getTimeZoneId())){
				TimeZone timeZone=timeZoneService.findById(customerVo.getTimeZoneId());
				if(timeZone!=null){
					tmp.setTimeZone(timeZone);
				}
			}
			
			companyService.update(tmp);
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
		return view;
	}
}