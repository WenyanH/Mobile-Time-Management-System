package com.tms.controller.customer;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.tms.entity.Department;
import com.tms.entity.User;
import com.tms.entity.commonfunctions.AutoSendReport;
import com.tms.entity.customer.ReportType;
import com.tms.service.commonsfunctions.AutoSendReportService;
import com.tms.service.department.DepartmentService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.SendReportVo;
@RequestMapping("/sendreport")
@Controller
public class AutoSendReportController  extends BaseController<Object>{
	
	@Autowired
	AutoSendReportService autosendreportService;
	@Autowired 
	private DepartmentService departmentService;
	
	
	@RequestMapping("/list")
	public ModelAndView sendReportlist(String searchStr, String order, String sort, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = sendReportlistValue(response, request);
		view.setViewName("admin/sendreport/sendreportlist");
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView sendReportlistValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		
			List<AutoSendReport> sendreports = autosendreportService.findAll();
			if(CollectionUtils.isNotEmpty(sendreports)){
				List<SendReportVo> sendReportVos=new ArrayList<SendReportVo>();
				for(AutoSendReport sendreport:sendreports){
					sendReportVos.add(new SendReportVo(sendreport));
				}
				view.getModelMap().put("sendreports", sendReportVos);
			}
		
		view.setViewName("admin/sendreport/sendreporttable");
		return view;
	}
	
	@RequestMapping("/create")
	public ModelAndView createSendReport(HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		List<Department> departmentList = departmentService.findAllDepartment(user.getCompany().getId());
		view.getModelMap().put("departmentList", departmentList);
		view.getModelMap().put("reporttypes", ReportType.values());
		
		view.setViewName("admin/sendreport/savesendreport");
		return view;
	}
	@RequestMapping("/update")
	public ModelAndView updateSendReport(String id,HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		User user = SessionUtils.getUser(request);
		List<Department> departmentList = departmentService.findAllDepartment(user.getCompany().getId());
		view.getModelMap().put("departmentList", departmentList);
		view.getModelMap().put("reporttypes", ReportType.values());
		AutoSendReport sendReport=autosendreportService.findById(id);
		
		view.getModelMap().put("sendreport", new SendReportVo(sendReport));
		view.setViewName("admin/sendreport/savesendreport");
		return view;
	}
	
	@RequestMapping("/save")
	public ModelAndView saveEmployee(SendReportVo sendreportVo, HttpServletResponse response, HttpServletRequest request)throws Exception {
		ModelAndView view = new ModelAndView();
		AutoSendReport sendReport=null;	
		try {
			//变更
			if(StringUtils.isNotEmpty(sendreportVo.getId())){
				sendReport=	autosendreportService.findById(sendreportVo.getId());
				convertFromVo(sendreportVo,sendReport);
				autosendreportService.update(sendReport);
			}else{
				sendReport=new AutoSendReport();
				convertFromVo(sendreportVo,sendReport);
			//新增	
				autosendreportService.save(sendReport);
			}
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}
		
		return view;
	}
	/**
	 * 
	 * 将页面vo转换成后台实体
	 * @param vo
	 * @param sendReport
	 * @throws Exception
	 */
	private void convertFromVo(SendReportVo vo,AutoSendReport sendReport)throws Exception{
		
		if(vo.getId()!=null){
			sendReport.setId(vo.getId());
		}
		
		if(vo.getReportType()!=null){
			sendReport.setReportType(vo.getReportType());
		}
		if(StringUtils.isNotEmpty(vo.getRunatTime())){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			sendReport.setRunatTime(sdf.parse(vo.getRunatTime()));
		}
		if(StringUtils.isNotEmpty(vo.getSendTo())){
			sendReport.setSendTo(vo.getSendTo());
		}
		if(StringUtils.isNotEmpty(vo.getSendFrequency())){
			sendReport.setSendFrequency(Integer.parseInt(vo.getSendFrequency()));
		}
		if(StringUtils.isNotEmpty(vo.getParameter())){
			sendReport.setParameter(vo.getParameter());
		}
		if(StringUtils.isNotEmpty(vo.getDepartment())){
			String[] departIds = ProcessSignUtils.getInstance().processComma(vo.getDepartment());
			Set<Department> departments = new HashSet<>();
			for (String id : departIds) {
				departments.add(departmentService.findById(id));				
			}
			sendReport.setDepartment(departments);
		}
	}
	@RequestMapping("/delete")
	public ModelAndView deleteUser(String ids, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		if (StringUtils.isEmpty(ids)) {
			view.getModel().put("message", "error");
			return view;
		}
		// 分割以","号连接的字符串成字符串数组
		String[] sendIds = ProcessSignUtils.getInstance().processComma(ids);
		for (String id : sendIds) {
			autosendreportService.remove(id);
		}
		view.getModel().put("message", "success");
		return view;
	}
	
}
