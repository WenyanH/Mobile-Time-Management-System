package com.tms.controller.mydetails;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
import com.tms.entity.CompanyStructureLevel;
import com.tms.entity.Department;
import com.tms.entity.User;
import com.tms.entity.customer.TimeZone;
import com.tms.entity.tms.TimeRounding;
import com.tms.service.company.CompanyService;
import com.tms.service.department.DepartmentService;
import com.tms.service.timezone.TimeZoneService;
import com.tms.service.tms.TMSService;
import com.tms.utils.DepartmentUtil;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.DepartmentVo;


@Controller
@RequestMapping("/department") 
public class DepartmentController extends BaseController<Object>{
	
	@Autowired 
	private DepartmentService departmentService; 	
	@Autowired
	private TMSService tmsService;
	@Autowired
	private CompanyService companyService; 	
	@Autowired
	private TimeZoneService timeZoneService;
	
	@RequestMapping("/create")
	public ModelAndView createDepartment(String id,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView t_view = new ModelAndView();
		Department parent=departmentService.findById(id);
		User user = SessionUtils.getUser(request);
		t_view.addObject("parent", parent);
		if(parent==null){
			Company company=companyService.findById(user.getCompany().getId());
			CompanyStructure companyStructure=getCompanyStructure(company,CompanyStructureLevel.values().length-1);
			if(companyStructure!=null){
				t_view.getModelMap().put("structureName", companyStructure.getLabelName());
				if (companyStructure.getTimeZone()!=null)
					t_view.getModelMap().put("timeZoneId", companyStructure.getTimeZone().getId());
			}
		}else{
			if(parent.getCompanyStructure()!=null){
				Company company=companyService.findById(user.getCompany().getId());
				CompanyStructure companyStructure=getCompanyStructure(company,parent.getCompanyStructure().getLevel().getLevel()-1);
				if(companyStructure!=null){
					t_view.getModelMap().put("structureName", companyStructure.getLevel().name());
					if (companyStructure.getTimeZone()!=null)
						t_view.getModelMap().put("timeZoneId", companyStructure.getTimeZone().getId());
				}
			}
		}
		
		List<TimeZone> timeZones = timeZoneService.findAll();//时区
		t_view.getModelMap().put("timeZones", timeZones);
		
//		List<PayGroup> payGroups=tmsService.findAllPageGroups(user.getCompany().getId());
//		t_view.getModelMap().put("payGroups", payGroups);
//		
//		List<Job> jobs=tmsService.findAllJobs(user.getCompany().getId());
//		t_view.getModelMap().put("jobs", jobs);
//		
//		List<Position> positions=tmsService.findAllPosition(user.getCompany().getId());
//		t_view.getModelMap().put("positions", positions);
		
		List<TimeRounding> timeRoundings=tmsService.findAllTimeRoundingsByCompanyId(user.getCompany().getId());
//		List<CompanyStructure> companyStructureList = tmsService.findActiveStructures(user.getCompany().getId());
//		
//		t_view.getModelMap().put("companyStructureList", companyStructureList);
		t_view.getModelMap().put("timeRoundings", timeRoundings);
		t_view.setViewName("mydetail/company/savedepartment");
		return t_view;
	}
	
	@RequestMapping("/divisioninfo_nd")
	public ModelAndView divisionInfo(String departmentId,HttpServletRequest request) throws Exception {
		ModelAndView t_view = new ModelAndView();
		Department department=departmentService.findById(departmentId);
		User user = SessionUtils.getUser(request);
		if(department.getCompanyStructure()!=null){
			if(department.getCompanyStructure()!=null){
				t_view.getModelMap().put("structureName", department.getCompanyStructure().getLabelName());
			}
		}
		if(department!=null){
			t_view.addObject("department", department);
//			if(department.getPayGroup()!=null&&department.getPayGroup().size()>0){
//				t_view.getModelMap().put("payGroupId", department.getPayGroup().iterator().next().getId());
//			}
//			if(department.getJob()!=null&&department.getJob().size()>0){
//				t_view.getModelMap().put("jobId", department.getJob().iterator().next().getId());
//			}
//			if(department.getPosition()!=null&&department.getPosition().size()>0){
//				t_view.getModelMap().put("positionId", department.getPosition().iterator().next().getId());
//			}
			if(CollectionUtils.isNotEmpty(department.getTimeRoundings())){
				t_view.getModelMap().put("timeRoundingId", department.getTimeRoundings().iterator().next().getId());
			}
			if(CollectionUtils.isNotEmpty(department.getTimeZone())){
				t_view.getModelMap().put("timeZoneId", department.getTimeZone().iterator().next().getId());
			}
		}
		if(user.getCompany()!=null){
//			List<PayGroup> payGroups=tmsService.findAllPageGroups(user.getCompany().getId());
//			t_view.getModelMap().put("payGroups", payGroups);
//			
//			List<Job> jobs=tmsService.findAllJobs(user.getCompany().getId());
//			t_view.getModelMap().put("jobs", jobs);
//			
//			List<Position> positions=tmsService.findAllPosition(user.getCompany().getId());
//			t_view.getModelMap().put("positions", positions);
			
			List<TimeZone> timeZones = timeZoneService.findAll();//时区
			t_view.getModelMap().put("timeZones", timeZones);
			
			List<TimeRounding> timeRoundings=tmsService.findAllTimeRoundingsByCompanyId(user.getCompany().getId());
			t_view.getModelMap().put("timeRoundings", timeRoundings);
		}
		
		t_view.setViewName("mydetail/company/divisioninfo");
		return t_view;
	}
	@RequestMapping("/save")
	public ModelAndView saveDepartment(DepartmentVo departmentVo,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		try {
			User user = SessionUtils.getUser(request);
			Department department=new Department();
			if (StringUtils.isEmpty(departmentVo.getId())) {
				if(departmentVo.getParent()!=null){
					Department ParentDepartment=departmentService.findById(departmentVo.getParent());
					Company company=companyService.findById(user.getCompany().getId());
					if(company==null){
						view.getModel().put("message", "noCompany");
						return view;
					}
					if(ParentDepartment!=null&&ParentDepartment.getCompanyStructure()!=null){
						if(!isCreateDepartment(company,ParentDepartment.getCompanyStructure().getLevel().getLevel()-1)){
							view.getModel().put("message", "noCompanyStructure");
							return view;
						}
						CompanyStructure companyStructure=getCompanyStructure(company,ParentDepartment.getCompanyStructure().getLevel().getLevel()-1);
						if(companyStructure==null){
							view.getModel().put("message", "noCompanyStructure");
							return view;
						}
						department.setCompanyStructure(companyStructure);
					}else{
						CompanyStructure companyStructure=getCompanyStructure(company,CompanyStructureLevel.values().length-1);
						if(companyStructure==null){
							view.getModel().put("message", "noCompanyStructure");
							return view;
						}
						department.setCompanyStructure(companyStructure);
					}
				}
			}
			if (StringUtils.isNotEmpty(departmentVo.getId())) {
				department=departmentService.findById(departmentVo.getId());
				if(!department.getDepartmentName().equals(departmentVo.getDepartmentName())){
					if(departmentService.validateNameExist(user.getCompany().getId(),departmentVo.getDepartmentName(),departmentVo.getParent())){
						view.getModel().put("message", "existName");
						return view;
					}
				}
			}else{
				/**
				 * 创建时候校验Number
				 */
				if (departmentService.validateNumberExist(user.getCompany().getId(),departmentVo.getNumber())) {
					view.getModel().put("message", "existNumber");
					return view;
				}
				if(departmentService.validateNameExist(user.getCompany().getId(),departmentVo.getDepartmentName(),departmentVo.getParent())){
					view.getModel().put("message", "existName");
					return view;
				}
				department.setCompany(user.getCompany());
			}
			
			
			
			if(StringUtils.isNotEmpty(departmentVo.getNumber())){
				department.setNumber(departmentVo.getNumber());
			}
			if(StringUtils.isNotEmpty(departmentVo.getDepartmentName())){
				department.setDepartmentName(departmentVo.getDepartmentName());
			}
			department.setStatus(departmentVo.isStatus());
//			if(StringUtils.isNotEmpty(departmentVo.getPaygroupId())){
//				PayGroup payGroup=tmsService.findPayGroupById(departmentVo.getPaygroupId());
//				if(payGroup!=null){
//					Set<PayGroup> payGroups = new HashSet<PayGroup>();
//					payGroups.add(payGroup);
//					department.setPayGroup(payGroups);
//				}
//			}
//			if(StringUtils.isNotEmpty(departmentVo.getPositionId())){
//				Position position=tmsService.findPositionById(departmentVo.getPositionId());
//				if(position!=null){
//					Set<Position> positions = new HashSet<Position>();
//					positions.add(position);
//					department.setPosition(positions);
//				}
//			}
			
			if(StringUtils.isNotEmpty(departmentVo.getTimeZoneId())){
				TimeZone timeZone=timeZoneService.findById(departmentVo.getTimeZoneId());
				if(timeZone!=null){
					Set<TimeZone> timeZones = new HashSet<TimeZone>();
					timeZones.add(timeZone);
					department.setTimeZone(timeZones);
				}
			}
				
				
			if(StringUtils.isNotEmpty(departmentVo.getTimeRoundingId())){
				TimeRounding timeRounding=tmsService.findTimeRoundingbyId(departmentVo.getTimeRoundingId());
				if(timeRounding!=null){
					Set<TimeRounding> timeRoundings = new HashSet<TimeRounding>();
					timeRoundings.add(timeRounding);
					department.setTimeRoundings(timeRoundings);
				}
			}
//			if(StringUtils.isNotEmpty(departmentVo.getJobId())){
//				Job job=tmsService.findJobByid(departmentVo.getJobId());
//				if(job!=null){
//					Set<Job> jobs = new HashSet<Job>();
//					jobs.add(job);
//					department.setJob(jobs);
//				}
//			}
			if(StringUtils.isNotEmpty(departmentVo.getParent())){
				Department parentDepartment=departmentService.findById(departmentVo.getParent());
				if(parentDepartment!=null){department.setParent(parentDepartment);}
			}
			if (StringUtils.isEmpty(department.getId())) {
				department.setCreateTime(new Date());
				departmentService.save(department);
			} else {
				departmentService.update(department);
			}
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
		return view;
	}
	/**
	 * 是否允许创建部门
	 * @param company
	 * @param level
	 * @return
	 */
	private boolean isCreateDepartment(Company company,int level){
		if(company==null) return false;
		if(company.getCompanyStructure()==null||company.getCompanyStructure().size()==0) return false;
		if(level<0)return false;//叶子节点下不能再次创建节点
		if(level==0) return true;//叶子节点
		Set<CompanyStructure> companyStructures= company.getCompanyStructure();
		for(CompanyStructure companyStructure:companyStructures){
			if(companyStructure.getIsActive()&&level<companyStructure.getLevel().getLevel()){
				return true;
			}
		}
		return false;
	}
	/**
	 * 递归查询合适的DEPARTMENT
	 * @param company
	 * @param level
	 * @return
	 */
	private CompanyStructure getCompanyStructure(Company company,int level){
		if(level<0) return null;
		Set<CompanyStructure> companyStructures= company.getCompanyStructure();
		for(CompanyStructure companyStructure:companyStructures){
			if(companyStructure.getIsActive()&&level==companyStructure.getLevel().getLevel()){
				return companyStructure;
			}
		}
		return getCompanyStructure(company,level-1);
	}

	@RequestMapping("/delete")
	public ModelAndView deleteDepartment(String ids,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		String[] departmentIds = ProcessSignUtils.getInstance().processComma(
				ids);
		for (String id : departmentIds) {
			Department department = departmentService.findById(id);
			if (department != null) {
				if (department.getSubs() != null
						&& department.getSubs().size() > 0
						|| department.getEmployee().size() > 0) {
					view.getModel().put("message", "children");
					return view;
				}
			}
			departmentService.remove(id);
		}
		view.getModel().put("message", "success");
		return view;
	}
	
	@RequestMapping("/ischoose")
	public ModelAndView ischooseParent(String id, String parentId)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Department department = departmentService.findById(id);
		if (department != null) {
			List<Department> subs = DepartmentUtil.getInstance()
					.getChilDepartments(department);
			if (CollectionUtils.isNotEmpty(subs)) {
				for (Department sub : subs) {
					if (sub.getId().equals(parentId)) {
						view.getModel().put("message", "error");
						return view;
					}
				}
			}
		}
		view.getModel().put("message", "success");
		return view;
	}
}
