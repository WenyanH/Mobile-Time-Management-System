package com.tms.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.controller.base.BaseController;
import com.tms.entity.User;
import com.tms.entity.customer.ExcetpitonTypes;
import com.tms.entity.customer.Report;
import com.tms.entity.customer.ReportType;
import com.tms.entity.tms.PayGroup;
import com.tms.service.report.ReportService;
import com.tms.service.tms.TMSService;
import com.tms.service.user.UserService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.utils.report.pdf.DocumentGeneratingException;
import com.tms.utils.report.pdf.DocumentVo;
import com.tms.utils.report.pdf.HtmlGenerator;
import com.tms.utils.report.pdf.PdfDocumentGenerator;
import com.tms.utils.report.reportVo.EmployeeReportVo;
import com.tms.vo.ReportVo;
import com.tms.vo.TimeCardReportVo;

import freemarker.template.Template;
import freemarker.template.TemplateException;

@RequestMapping("/report")
@Controller
public class ReportController  extends BaseController<Object> {
	@Autowired
	private ReportService reportLogService;
	@Autowired
	private TMSService tmsService;
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/view")
	public ModelAndView view(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("admin/report/view");
		return view;
	}
	
	
	@RequestMapping("/condition")
	public ModelAndView condition(ReportType type,HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			List<PayGroup>  payGroups=	tmsService.findAllPageGroups(user.getCompany().getId());
			view.getModelMap().put("payGroupList", payGroups);
		}
		
		if (ReportType.TimeCardReport.getName().equals(type.getName())){
			view.setViewName("admin/report/timecard");
		}
		
		if (ReportType.TimeCardDetailsReport.getName().equals(type.getName())){
			view.setViewName("admin/report/timecarddetails");
		}
		if (ReportType.EmployeesListReport.getName().equals(type.getName())){
			view.setViewName("admin/report/employeelist");
		}
		if (ReportType.ExceptionsReport.getName().equals(type.getName())){
			view.getModelMap().put("types", ExcetpitonTypes.values());
			view.setViewName("admin/report/exceptions");
		}
		if (ReportType.OnsiteReport.getName().equals(type.getName())){
			view.setViewName("admin/report/onsite");
		}
		if (ReportType.LeaveReport.getName().equals(type.getName())){
			view.setViewName("admin/report/leave");
		}
		if (ReportType.JobHoursSummaryReport.getName().equals(type.getName())){
			view.setViewName("admin/report/jobhourssummary");
		}
		if (ReportType.JobHoursDetailsReport.getName().equals(type.getName())){
			view.setViewName("admin/report/jobhoursdetails");
		}
		if (ReportType.AuditingReport.getName().equals(type.getName())){
			view.setViewName("admin/report/auditing");
		}
		
		
		return view;
	}
	
	
	@RequestMapping("/list")
	public ModelAndView reportlist(String searchStr, String order, String sort, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = reportlistValue(response, request);
		view.setViewName("admin/report/reportlist");
		return view;
	}
	@RequestMapping("/list_nd")
	public ModelAndView reportlistValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			List<Report> reports = reportLogService.findAllReport(user.getCompany().getId());
			if(reports!=null){
				List<ReportVo> reportVos=new ArrayList<ReportVo>();
				for(Report report:reports){
					reportVos.add(new ReportVo(report));
				}
				view.getModelMap().put("reports", reportVos);
			}
		}
		view.setViewName("admin/report/reportlisttable");
		return view;
	}
	@RequestMapping("/create")
	public ModelAndView createPaytype(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			List<PayGroup>  payGroups=	tmsService.findAllPageGroups(user.getCompany().getId());
			view.getModelMap().put("payGroupList", payGroups);
		}
		view.getModelMap().put("reportTypeList", ReportType.values());
		List<String>  pagings=new ArrayList<String>();
		pagings.add("Postion");
		pagings.add("Employee");
		view.getModelMap().put("pagingList", pagings);
		
		List<String>  sorts=new ArrayList<String>();
		sorts.add("Surname");
		sorts.add("Firstname");
		sorts.add("Employee No");
		view.getModelMap().put("sortList", sorts);
		
		view.setViewName("admin/report/savereport");
		return view;
	}

	@RequestMapping("/update")
	public ModelAndView updatePaytype(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Report report = reportLogService.findById(id);
		User user = SessionUtils.getUser(request);
		if(user!=null&&user.getCompany()!=null){
			List<PayGroup>  payGroups=	tmsService.findAllPageGroups(user.getCompany().getId());
			view.getModelMap().put("payGroupList", payGroups);
		}
		view.getModelMap().put("reportTypeList", ReportType.values());
		List<String>  pagings=new ArrayList<String>();
		pagings.add("Postion");
		pagings.add("Employee");
		view.getModelMap().put("pagingList", pagings);
		
		List<String>  sorts=new ArrayList<String>();
		sorts.add("surname");
		sorts.add("Firstname");
		sorts.add("Employee No");
		view.getModelMap().put("sortList", sorts);
		view.getModel().put("report", new ReportVo(report));
		view.setViewName("admin/report/savereport");
		return view;
	}
	@RequestMapping("/save")
	public ModelAndView saveReport(ReportVo reportVo, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		User user = SessionUtils.getUser(request);
		ModelAndView view = new ModelAndView();	
		Report report=new Report();
		if(StringUtils.isNotEmpty(reportVo.getId())){
			report=reportLogService.findById(reportVo.getId());
		}
		if(StringUtils.isNotEmpty(reportVo.getPaging())){
			report.setPaging(reportVo.getPaging());
		}
		if(StringUtils.isNotEmpty(reportVo.getSort())){
			report.setSort(reportVo.getSort());
		}
		if(StringUtils.isNotEmpty(reportVo.getPayGroupId())){
			PayGroup payGroup=tmsService.findPayGroupById(reportVo.getPayGroupId());
			if(payGroup!=null){
				report.setPayGroup(payGroup);
			}
		}
		if(StringUtils.isNotEmpty(reportVo.getReportType())){
			report.setReportType(ReportType.valueOf(reportVo.getReportType()));
		}
		report.setUpdateTime(new Date());
		if(StringUtils.isNotEmpty(reportVo.getId())){
			reportLogService.update(report);
		}else{
			report.setUser(user);
			report.setCompany(user.getCompany());
			reportLogService.save(report);
		}
		view.getModel().put("message", "success");
		return view;
	}
	
	@RequestMapping("/delete")
	public ModelAndView deleteReport(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error");
			return view;
		}	
		String[] paytypeIds = ProcessSignUtils.getInstance().processComma(ids);	
		for (String id : paytypeIds) {
			reportLogService.remove(id);
		}
		return view;
	}
	 @RequestMapping("download")    
	 public void download(ReportVo reportVo,HttpServletResponse response, HttpServletRequest request) throws IOException {    
		 if(reportVo!=null){
			 String template = "config/templates/"+reportVo.getReportType()+".html";
			 PdfDocumentGenerator pdfGenerator = new PdfDocumentGenerator();
			 List<User>  users=userService.findAll();
			 if(users!=null){
				 List<DocumentVo> employeeReportVos=new ArrayList<DocumentVo>();
				 for(User user:users){
					 EmployeeReportVo employeeReportVo= new EmployeeReportVo(user,reportVo.getReportType());
					 if(employeeReportVo.getIsEmployee()!=null&&employeeReportVo.getIsEmployee()){
						 employeeReportVos.add(employeeReportVo);
					 }
				 }
				 try {
					 if(reportVo.getReportType().equals(ReportType.TimeCardReport.name())||reportVo.getReportType().equals(ReportType.ExceptionsReport.name())){
						 try {
							pdfGenerator.generate(createTimeCardReport(reportVo,employeeReportVos),response.getOutputStream());
						} catch (Exception e) {
							e.printStackTrace();
						}
					 }else{
						 pdfGenerator.generate(template, employeeReportVos, response.getOutputStream());
					 }
					
				} catch (DocumentGeneratingException e) {
					e.printStackTrace();
				}
			 }
		 }
	 }
	 private String createTimeCardReport(ReportVo reportVo,List<DocumentVo> documentVos){
		 if(documentVos==null) return "";
		 HtmlGenerator htmlGenerator=new HtmlGenerator();
		 Map<String, Object> variables = new HashMap<String, Object>();
		 String timeCardReportHead=null;
		 Template timeCardReportTable=null;
		 Template timeCardReportTr=null;
		 StringBuffer timeCardReportTableStrs=new StringBuffer();
		 
		 int index=0;
		 String templateHead = "config/templates/"+reportVo.getReportType()+"_head.html";
		 String templateTable = "config/templates/"+reportVo.getReportType()+"_table.html";
		 String templateTr = "config/templates/"+reportVo.getReportType()+"_tr.html";
		 try {
			 for(DocumentVo documentVo:documentVos){
				 variables = documentVo.fillDataMap();
				 if(index==0){
					 timeCardReportHead=htmlGenerator.generate(templateHead,variables);
					 timeCardReportTable=htmlGenerator.generate(templateTable);
					 timeCardReportTr=htmlGenerator.generate(templateTr);
				 }
				 String timeCardReportTableStr=htmlGenerator.generate(timeCardReportTable, variables);
				 timeCardReportTableStrs.append(timeCardReportTableStr.replace("#tr#", createTimeCardTrReport(timeCardReportTr,documentVo,htmlGenerator)));
			 }
			 return timeCardReportHead.replace("#table#", timeCardReportTableStrs.toString());
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			}
		return "";
	 }
	 private String createTimeCardTrReport(Template timeCardReportTr,DocumentVo documentVo,HtmlGenerator htmlGenerator){
		 try {
			 Map<String, Object> variables = new HashMap<String, Object>();
			 variables = documentVo.fillDataMap();
			 StringBuffer timeCardReportTrStr=new StringBuffer();
			 timeCardReportTrStr.append(htmlGenerator.generate(timeCardReportTr, variables));
			 return timeCardReportTrStr.toString();
		 } catch (IOException e) {
			 e.printStackTrace();
		 } catch (TemplateException e) {
			 e.printStackTrace();
		 }
		return "";
	 }
}
