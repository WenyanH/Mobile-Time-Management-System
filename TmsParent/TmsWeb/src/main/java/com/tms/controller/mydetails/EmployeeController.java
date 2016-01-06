package com.tms.controller.mydetails;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Encoder;

import com.tms.conditions.UserConditions;
import com.tms.constant.Constants;
import com.tms.controller.base.BaseController;
import com.tms.entity.Company;
import com.tms.entity.CompanyStructure;
import com.tms.entity.Department;
import com.tms.entity.Employee;
import com.tms.entity.Resource;
import com.tms.entity.ResourceType;
import com.tms.entity.Role;
import com.tms.entity.User;
import com.tms.entity.UserSource;
import com.tms.entity.UserStatus;
import com.tms.entity.tms.PayGroup;
import com.tms.entity.tms.TimeRounding;
import com.tms.service.company.CompanyService;
import com.tms.service.department.DepartmentService;
import com.tms.service.employee.EmployeeService;
import com.tms.service.resource.ResourceService;
import com.tms.service.role.RoleService;
import com.tms.service.tms.TMSService;
import com.tms.service.user.UserService;
import com.tms.utils.DepartmentUtil;
import com.tms.utils.MD5;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.UserVo;

/**
 * 
 * EmployeeController
 */ 
@Controller
@RequestMapping("/employee") 
public class EmployeeController extends BaseController<Object>{
	
	@Autowired 
	private EmployeeService employeeService; 	
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private TMSService tmsService;
	
	@Autowired 
	private DepartmentService departmentService;
	
	@Autowired
	private RoleService roleService;

	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private CompanyService companyService; 	
	
	@RequestMapping("/list")
	public ModelAndView employeeList(UserConditions condition, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		ModelAndView view = employeeListValue(condition, response, request);
		view.setViewName("mydetail/employee/employeelist");
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			List<Department> departmentList = departmentService.findAllDepartment(user.getCompany().getId());
			view.getModelMap().put("departmentList", departmentList);
		}		
		view.getModelMap().put("employeeStatus", UserStatus.values());
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView employeeListValue(UserConditions condition,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		
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
		view.setViewName("mydetail/employee/employeelisttable");
		return view;
	}
	
	@RequestMapping("/departlist_nd")
	public ModelAndView searchemployeeList(UserConditions condition,
			HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		condition.setCompanyId(user.getCompany().getId());
		if(StringUtils.isNotEmpty(condition.getDepartment())){
			view.getModelMap().put("department", condition.getDepartment());
			Department department = departmentService.findById(condition.getDepartment());				
			String newDepartment=DepartmentUtil.getInstance().getAllChilDepartmentList(department);
			condition.setDepartment(newDepartment);
			condition.setSource(UserSource.Employee);
		}
		List<User> users = userService.findByConditions(condition);
		if (CollectionUtils.isNotEmpty(users)) {
			List<UserVo> userVos = new ArrayList<UserVo>();
			for (User tempUser : users) {
				userVos.add(new UserVo(tempUser));
			}
			view.getModelMap().put("users", userVos);
		}
		
		List<Department> departmentList = departmentService.findAllDepartment(user.getCompany().getId());
		view.getModelMap().put("departmentList", departmentList);
		view.getModelMap().put("employeeStatus", UserStatus.values());
		view.setViewName("mydetail/employee/employeesearchtable");
		return view;
	}
	
	
	
	/**
	 * @param departmentId
	 * @param flag   employee(从员工页面新增) company (从公司页面新增)
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/create")
	public ModelAndView createEmployee(String departmentId,String flag, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			Company company=companyService.findById(user.getCompany().getId());
			Set<CompanyStructure> companyStructures= company.getCompanyStructure();
			for(CompanyStructure companyStructure:companyStructures){
				if(companyStructure.getIsActive()&&0==companyStructure.getLevel().getLevel()){
					view.getModelMap().put("structureName", companyStructure.getLabelName());
					break;
				}
			}
//			List<Position>  positionList=tmsService.findAllPosition(user.getCompany().getId());
//			List<Job> jobList=tmsService.findAllJobs(user.getCompany().getId());
			List<PayGroup> paygroupList=tmsService.findAllPageGroups(user.getCompany().getId());
			List<TimeRounding> timeRoundingList=tmsService.findAllTimeRoundingsByCompanyId(user.getCompany().getId());
			
			List<Department> departmentList=departmentService.findAllDepartment(user.getCompany().getId());
//			view.getModelMap().put("positionList", positionList);
//			view.getModelMap().put("jobList", jobList);
			view.getModelMap().put("paygroupList", paygroupList);
			view.getModelMap().put("timeRoundingList", timeRoundingList);
			view.getModelMap().put("departmentList", departmentList);
		}
		view.getModelMap().put("employeeStatus", UserStatus.values());
		view.getModel().put("departmentId", departmentId);
		view.getModel().put("flag", flag);
		
		List<Resource> resources = resourceService.findAllResourceByType(ResourceType.URL);
		if (resources != null && resources.size() > 0) {
			view.getModelMap().put("resources", resources);
		}
		view.setViewName("mydetail/employee/saveemployee");
		return view;
	}
	
	/**
	 * @param id
	 * @param flag employee(从员工页面新增) company (从公司页面新增)
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/update")
	public ModelAndView updateEmployee(String id,String flag, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Employee employee = employeeService.findById(id);
		
		if(employee!=null){
			
			//String positionId="";
//			if(employee.getPosition()!=null){
//				positionId=employee.getPosition().getId();
//			}	
			String timeRoundingId="";
			if(employee.getTimeRounding()!=null){
				timeRoundingId=employee.getTimeRounding().getId();
			}
			String paygroupId="";
			if(employee.getPayGroup()!=null){
				paygroupId=employee.getPayGroup().getId();
			}	
			if(employee.getDepartment()!=null){
				view.getModel().put("department", employee.getDepartment());
				view.getModel().put("departmentId", employee.getDepartment().getId());
			}
//			String jobId="";
//			if(employee.getJob()!=null){
//				jobId=	employee.getJob().getId();
//			}					
			view.getModel().put("employee", employee);
			//view.getModel().put("positionId", positionId);
			view.getModel().put("timeRoundingId", timeRoundingId);
			view.getModel().put("paygroupId", paygroupId);
			//view.getModel().put("jobId", jobId);	
		}		
		User user = SessionUtils.getUser(request);
		Company company=companyService.findById(user.getCompany().getId());
		Set<CompanyStructure> companyStructures= company.getCompanyStructure();
		for(CompanyStructure companyStructure:companyStructures){
			if(companyStructure.getIsActive()&&0==companyStructure.getLevel().getLevel()){
				view.getModelMap().put("structureName", companyStructure.getLabelName());
				break;
			}
		}
//		List<Position>  positionList=tmsService.findAllPosition(user.getCompany().getId());
//		List<Job> jobList=tmsService.findAllJobs(user.getCompany().getId());
		List<PayGroup> paygroupList=tmsService.findAllPageGroups(user.getCompany().getId());
		List<TimeRounding> timeRoundingList=tmsService.findAllTimeRoundingsByCompanyId(user.getCompany().getId());
		
		//view.getModelMap().put("positionList", positionList);
		//view.getModelMap().put("jobList", jobList);
		view.getModelMap().put("paygroupList", paygroupList);
		view.getModelMap().put("timeRoundingList", timeRoundingList);
		view.getModelMap().put("employeeStatus", UserStatus.values());
		view.getModel().put("flag", flag);
		User employeeUser=employee.getUser();
		if(employeeUser!=null){
			view.getModelMap().put("user", new UserVo(employeeUser));
			Set<Department> userDepartments = employeeUser.getManagement();
			if (CollectionUtils.isNotEmpty(userDepartments)) {
				StringBuffer departmentStr = new StringBuffer();
				int index = 0;
				for (Department userDepartment : userDepartments) {
					departmentStr.append(userDepartment.getId());
					if (index < userDepartments.size() -1) {
						departmentStr.append(",");
					}
					index++;
				}
				view.getModelMap().put("userDepartments", departmentStr.toString());
			}
		}
		List<Resource> resources = resourceService.findAllResourceByType(ResourceType.URL);
		if (resources != null && resources.size() > 0) {
			view.getModelMap().put("resources", resources);
		}
		view.setViewName("mydetail/employee/saveemployee");
		return view;
	}
	
	/** 修改员工状态信息页面
	 * @param id
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateStatus")
	public ModelAndView updateStatus(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Employee employee = employeeService.findById(id);
		User user=employee.getUser();
		//view.getModel().put("employee", employee);
		view.getModel().put("user", user);
		view.getModelMap().put("userStatus", UserStatus.values());
		
		view.setViewName("mydetail/employee/updateemployeestatus");
		return view;
	}
	/** 保存员工状态
	 * @param employee 页面对象
	 * @param response
	 * @param request
	 * @return  ModelAndView
	 * @throws Exception 异常
	 */
	@RequestMapping("/saveStatus")
	public ModelAndView saveStatus(User user, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		try {
			if (StringUtils.isNotEmpty(user.getId())) {
				User temp = userService.findByUId(user.getId());
				temp.setStatus(user.getStatus());
				userService.update(temp);
			}
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
		return view;
	}
	@RequestMapping("/save")
	public ModelAndView saveEmployee(@RequestParam(value = "fileUpload", required = false) MultipartFile file, UserVo userVo, HttpServletResponse response, HttpServletRequest request)throws Exception {
		ModelAndView view = new ModelAndView();
		
		User loginUser = SessionUtils.getUser(request);
		if(loginUser.getCompany()==null){
			view.getModel().put("message", "noCompany");
			return view;
		}
		Boolean userIsExist = userService.validateEmailExist(userVo.getEmail());
		User user = new User();
		if (StringUtils.isEmpty(userVo.getId())) {
			if (userIsExist) {
				view.getModel().put("message", "userEmailExit");
				return view;
			}
			if (userVo.getJobNumber() != null && employeeService.validateExist(userVo.getJobNumber(), userVo.getClockId(), loginUser.getCompany().getId())) {
				view.getModel().put("message", "employeeNumerExit");
				return view;
			}
			user.setCompany(loginUser.getCompany());
		} else {
			user = userService.findByUId(userVo.getId());
			if (!user.getEmail().equals(userVo.getEmail()) && userIsExist) {
				view.getModel().put("message", "userEmailExit");
				return view;
			}
			Employee ey = new Employee();
			if (user.getEmployee().iterator().hasNext()){
				ey = user.getEmployee().iterator().next();
				String jobNumber = null;
				String clockId = null;
				
				if (StringUtils.isNotEmpty(userVo.getJobNumber())&& !userVo.getJobNumber().equals(ey.getJobNumber())){
					jobNumber = userVo.getJobNumber();
				}
				if (StringUtils.isNotEmpty(userVo.getClockId()) && !userVo.getClockId().equals(ey.getClockId())){
					clockId = userVo.getClockId();
				}
				
				if (StringUtils.isNotEmpty(jobNumber) || StringUtils.isNotEmpty(clockId)){
					if (employeeService.validateExist(jobNumber, clockId, loginUser.getCompany().getId())) {
						view.getModel().put("message", "employeeNumerExit");
						return view;
					}
				}
				
			}
		}
		
		
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		try {
			
			Employee employee=new Employee();
					
			
			if (StringUtils.isNotEmpty(userVo.getEmployeeId())) {
				employee = employeeService.findById(userVo.getEmployeeId());
			}
			employee.setCompany(loginUser.getCompany());
			
			if (file != null) {
				if (file.getSize() > 200000) {
					view.getModel().put("message", "photoBigError");
					return view;
				}
				String userPhoto = new BASE64Encoder().encode(file.getBytes());
				employee.setPhoto(userPhoto);
			}
						
			 if(StringUtils.isNotEmpty(userVo.getJobNumber())){
	            employee.setJobNumber(userVo.getJobNumber());
			}
			 if(StringUtils.isNotEmpty(userVo.getStatus())){
		          
			}
			 if(StringUtils.isNotEmpty(userVo.getFirstName())){
		           employee.setFirstName(userVo.getFirstName());
			}
			 if(StringUtils.isNotEmpty(userVo.getLastName())){
		           employee.setLastName(userVo.getLastName());
			}
			
		    employee.setMiddleName(userVo.getMiddleName());
			
			if(StringUtils.isNotEmpty(userVo.getIrdNumber())){
		           employee.setIrdNumber(userVo.getIrdNumber());
			}
            if(StringUtils.isNotEmpty(userVo.getHireOnDateValue())){
            	Date hireOnDate=sdf.parse(userVo.getHireOnDateValue());
            	employee.setHireOnDate(hireOnDate);
			}
            if(StringUtils.isNotEmpty(userVo.getClockId())){
		           employee.setClockId(userVo.getClockId());
			}
            if(StringUtils.isNotEmpty(userVo.getPayId())){
		           employee.setPayId(userVo.getPayId());
			}
            
            if (userVo.getIsExport()==null){
            	employee.setIsExport(false);
            } else{
            	employee.setIsExport(userVo.getIsExport());
            }
            
            
           
            if(StringUtils.isNotEmpty(userVo.getTerminateDateValue())){
            	Date terminateDate=sdf.parse(userVo.getTerminateDateValue());
            	employee.setTerminateDate(terminateDate);
			}
			if(StringUtils.isNotEmpty(userVo.getDepartmentId())){
				Department department=departmentService.findById(userVo.getDepartmentId());
				employee.setDepartment(department);
			}
			
//			if(StringUtils.isNotEmpty(userVo.getPositionId())){
//				Position position=tmsService.findById(userVo.getPositionId());
//				employee.setPosition(position);
//			}
			
			if(StringUtils.isNotEmpty(userVo.getTimeRoundingId())){
				TimeRounding timeRounding=tmsService.findTimeRoundingbyId(userVo.getTimeRoundingId());
				employee.setTimeRounding(timeRounding);
			}
			
			if (StringUtils.isNotEmpty(userVo.getPaygroupId())) {
				PayGroup paygroup = tmsService.findPayGroupById(userVo.getPaygroupId());
				employee.setPayGroup(paygroup);
				if (userVo.getDailyHoursValue()==null) {
					employee.setDailyHours(paygroup.getDailyHours());
				}
			}
			
//			if(userVo.getDailyHoursValue()>0.0){
//				employee.setDailyHours(userVo.getDailyHoursValue());
//		    }
			
//			if(StringUtils.isNotEmpty(userVo.getJobId())){
//				Job job=tmsService.findJobByid(userVo.getJobId());
//				employee.setJob(job);
//			}	
			if(userVo.getName()!=null){
				employee.setName(userVo.getName());
			}
			if(userVo.getTitle()!=null){
				employee.setTitle(userVo.getTitle());
			}
			if(userVo.getMobile()!=null){
				employee.setMobile(userVo.getMobile());
			}
			if(userVo.getPhone()!=null){
				employee.setPhone(userVo.getPhone());
			}
			if(userVo.getFax()!=null){
				employee.setFax(userVo.getFax());
			}
			if(userVo.getPhysicalAddr()!=null){
				employee.setPhysicalAddr(userVo.getPhysicalAddr());
			}
			if(userVo.getPostalAddr()!=null){
				employee.setPostalAddr(userVo.getPostalAddr());
			}
			
			if(StringUtils.isNotEmpty(userVo.getEmail())){
				employee.setEmail(userVo.getEmail());
			}
			
			if (StringUtils.isNotEmpty(userVo.getId())) {
				user = userService.findByUId(userVo.getId());
			}
			
			Set<Role> roles = new HashSet<Role>();
			List<Role> roleList = roleService.findAll();
			if (userVo.getIsSupervisor()!=null && userVo.getIsSupervisor()){
				if (userVo.getDepartments() != null) {
					Set<Department> departmentSet = new HashSet<Department>();
					for (String departmentId : userVo.getDepartments()) {
						Department department = departmentService.findById(departmentId);
						departmentSet.add(department);
					}
					user.setManagement(departmentSet);
				}
				if (userVo.getFuns() != null) {
					Set<Resource> resourceSet = new HashSet<Resource>();
					for (String resourceId : userVo.getFuns()) {
						Resource resource = resourceService.findById(resourceId);
						if (resource == null) {
							continue;
						}
						resourceSet.add(resource);
					}
					user.setResources(resourceSet);
				}
				for (Role role : roleList) {
					if (role.getName().equalsIgnoreCase(Constants.SUPERVISOR)) {
						roles.add(role);
						break;
					}
				}
			} else {
				for (Role role : roleList) {
					if (role.getName().equalsIgnoreCase(Constants.EMPLOYEE)) {
						roles.add(role);
						break;
					}
				}
			}
			
			user.setRoles(roles);
			user.setEmail(userVo.getEmail());
			user.setIsEmployee(true);
			
			if (StringUtils.isEmpty(userVo.getId())) {
				user.setPassword(MD5.digest(userVo.getPassword()));
				//employee.setStatus(EmployeeStatus.Active);
				employee.setCreateTime(new Date());
				user.setCreateTime(new Date());
				user.setSys(false);
				user.setIsEmployee(true);//设置user为employee
				employee.setUser(user);
				user.getEmployee().add(employee);
				user.setSource(UserSource.Employee);
				userService.save(user);
			} else {
				if(userVo.getChangePassword()!=null&&userVo.getChangePassword()){//编辑时需要判断PASSWROD是否选中修改
					user.setPassword(MD5.digest(userVo.getPassword()));
				}
				
				user.getEmployee().clear();
				employee.setUser(user);
				user.getEmployee().add(employee);
				userService.update(user);
			}
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
		return view;
	}
	
	
	@RequestMapping("/delete")
	public ModelAndView deleteEmployee(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();	
		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error");
			return view;
		}
		//分割以","号连接的字符串成字符串数组
		String[] employeeIds = ProcessSignUtils.getInstance().processComma(ids);		
		for (String id : employeeIds) {
			Employee employee=employeeService.findById(id);
			employeeService.remove(id);
			if(employee!=null){
				User user=employee.getUser();
				if(user!=null&&!user.isSys()){//删除非系统用户
					userService.remove(user.getId());
				}
			}
		}
		view.getModel().put("message", "success");
		return view;
	}
}
