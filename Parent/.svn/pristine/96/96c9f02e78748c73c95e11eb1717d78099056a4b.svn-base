package com.tms.controller.settings;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.controller.base.BaseController;
import com.tms.entity.Company;
import com.tms.entity.CompanyStructure;
import com.tms.entity.Department;
import com.tms.entity.User;
import com.tms.entity.customer.TimeZone;
import com.tms.service.company.CompanyService;
import com.tms.service.department.DepartmentService;
import com.tms.service.timezone.TimeZoneService;
import com.tms.service.tms.TMSService;
import com.tms.utils.SessionUtils;
import com.tms.vo.CompanyStructureVo;


@RequestMapping("/structure")
@Controller
public class CompanyStructureController extends BaseController<Object> {

	@Autowired
	private TMSService tmsService; 	
	@Autowired
	private CompanyService companyService; 	
	@Autowired 
	private DepartmentService departmentService; 	
	@Autowired
	private TimeZoneService timeZoneService;
	
	@RequestMapping("/setting")
	public ModelAndView structureList(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = structureListValue(response, request);
		view.setViewName("tms/structure/structurelist");
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView structureListValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		
		User user = SessionUtils.getUser(request);
		List<CompanyStructure> structures =tmsService.findAllStructures(user.getCompany().getId());
		List<TimeZone> timeZones = timeZoneService.findAll();//时区
		
		view.getModelMap().put("timeZones", timeZones);
		view.getModelMap().put("structures", structures);
		view.setViewName("tms/structure/structurelist");
		return view;
	}	
	
	@RequestMapping("/update")
	public ModelAndView updateStructure(@RequestBody CompanyStructureVo[] structures, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		ModelAndView view = new ModelAndView();
		try {
			User user = SessionUtils.getUser(request);
			List<Department> departments= null;
			if(user.getCompany()!=null){
				departments= departmentService.findAllDepartment(user.getCompany().getId());
			}
			List<CompanyStructure> changeCompanyStructures=new ArrayList<CompanyStructure>();
			for (CompanyStructureVo s : structures) {
				CompanyStructure structure = tmsService.findStructureById(s.getId());		
				if(StringUtils.isNotEmpty(s.getLabelName())){
					structure.setLabelName(s.getLabelName());
				}
				if(CollectionUtils.isNotEmpty(departments)&&!structure.getIsActive().equals(s.getIsActive())){
					changeCompanyStructures.add(structure);
				}
				structure.setIsActive(s.getIsActive());
				TimeZone timeZone =  timeZoneService.findById(s.getTimeZone());
				structure.setTimeZone(timeZone);
				tmsService.updateStructure(structure);
			}
			if(CollectionUtils.isNotEmpty(departments)&&CollectionUtils.isNotEmpty(changeCompanyStructures)){
				int index=0;
				for(CompanyStructure changeCompanyStructure:changeCompanyStructures){
					if(index>0&&changeCompanyStructures.size()>1){//一次修改两个以上包括两个需要重新请求department
						departments= departmentService.findAllDepartment(user.getCompany().getId());
					}
					if(changeCompanyStructure.getIsActive()){
						List<Department> data= isActive(departments,changeCompanyStructure.getLevel().getLevel());
						if(CollectionUtils.isNotEmpty(data)){
							modifyDepartment(user.getCompany(),data,changeCompanyStructure);
						}
					}else{
						isNoActive(departments,changeCompanyStructure.getLevel().getLevel());
					}
					index++;
				}
			}
			
			view.getModel().put("message", "success");
		
		}catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
				
		return view;					
	}
	/**
	 * 可用状态下修改department父子关系
	 * @param company
	 * @param departments
	 * @param s
	 */
	private void modifyDepartment(Company company,List<Department> departments,CompanyStructure s){
		if(CollectionUtils.isEmpty(departments)) return ;
		Department parentDep=new Department();
		List<String>  containId=new ArrayList<String>();
		for(Department department:departments){
			if(department.getParent()!=null){
				if(!containId.contains(department.getParent().getId())){
					parentDep=new Department();
					parentDep.setNumber(createDepartmentNum(company.getId()));
					parentDep.setCompany(company);
					parentDep.setCompanyStructure(s);
					if (s.getTimeZone()!=null){
						parentDep.getTimeZone().add(s.getTimeZone());
					}
					if(StringUtils.isEmpty(s.getLabelName())){
						parentDep.setDepartmentName(s.getLevel().name()+"(system)");
					}else{
						parentDep.setDepartmentName(s.getLabelName()+"(system)");
					}
					parentDep.setParent(department.getParent());//原父节点作为新节点的父
					parentDep.setCreateTime(new Date());
					departmentService.save(parentDep);
					containId.add(department.getParent().getId());
				}
				department.setParent(parentDep);
				departmentService.update(department);
			}else{
				if(StringUtils.isEmpty(parentDep.getId())){
					parentDep.setNumber(createDepartmentNum(company.getId()));
					parentDep.setCompany(company);
					parentDep.setCompanyStructure(s);
					if (s.getTimeZone()!=null){
						parentDep.getTimeZone().add(s.getTimeZone());
					}
					if(StringUtils.isEmpty(s.getLabelName())){
						parentDep.setDepartmentName(s.getLevel().name()+"(system)");
					}else{
						parentDep.setDepartmentName(s.getLabelName()+"(system)");
					}
					departmentService.save(parentDep);
				}
				department.setParent(parentDep);
				departmentService.update(department);
			}
		}
	}
	private String createDepartmentNum(String companyId){
		String departmentNum=Math.abs(new Random().nextInt() % 1000)+"";
		if (departmentService.validateNumberExist(companyId,departmentNum)) {
			return createDepartmentNum(companyId);
		}
		return departmentNum;
	}
	/**
	 * 设置可用状态时获取子部门
	 * @param departments
	 * @param level
	 * @return
	 */
	private List<Department> isActive(List<Department> departments,int level){
		if(level<1) return null;
		if(CollectionUtils.isEmpty(departments)) return null;
		List<Department> result=new ArrayList<Department>();
		for(Department department:departments){
			if(department.getCompanyStructure()==null) continue;
			if(department.getCompanyStructure().getLevel().getLevel()==level-1){
				result.add(department);
			}
		}
		if(CollectionUtils.isEmpty(result)){
			List<Department> data=isActive(departments,level-1);
			if(CollectionUtils.isNotEmpty(data)){
				result.addAll(data);
			}
		}
		return result;
	}
	private void isNoActive(List<Department> departments,int level){
		if(level<1) return ;
		if(CollectionUtils.isEmpty(departments)) return ;
		List<Department> result=new ArrayList<Department>();
		for(Department department:departments){
			if(department.getCompanyStructure()==null) continue;
			if(department.getCompanyStructure().getLevel().getLevel()==level){
				result.add(department);
			}
		}
		if(CollectionUtils.isNotEmpty(result)){
			for(Department department:result){
				if(CollectionUtils.isNotEmpty(department.getSubs())){
					for(Department subDepartment:department.getSubs()){
						subDepartment.setParent(department.getParent());
						departmentService.update(subDepartment);
					}
				}
				departmentService.remove(department.getId());
			}
		}
	}
}