package com.tms.controller.customer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.entity.Company;
import com.tms.entity.ScriptEngineEnum;
import com.tms.entity.User;
import com.tms.entity.customer.CalculationScript;
import com.tms.entity.customer.CalculationScriptLog;
import com.tms.service.calculationscript.CalculationScriptService;
import com.tms.service.calculationscriptlog.CalculationScriptLogService;
import com.tms.service.company.CompanyService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.CalculationScriptVo;
import com.tms.entity.CalStates;

@RequestMapping("/calculationscript")
@Controller
public class CalculationScriptController {
	@Autowired
	private CalculationScriptService calculationScriptService;
	@Autowired
	private CalculationScriptLogService calculationScriptLogService;
	@Autowired
	private CompanyService companyService;

	@RequestMapping("/list")
	public ModelAndView calculationScriptList(String companyId,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = calculationScriptListValue(companyId,response, request);
		view.getModelMap().put("companyId", companyId);
		view.setViewName("admin/calculationscript/calculationscriptlist");
		return view;
	}

	@RequestMapping("/list_nd")
	public ModelAndView calculationScriptListValue(String companyId,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();	
		List<CalculationScript> calculationScripts =new ArrayList<CalculationScript>();
		List<CalculationScriptVo> calculationScriptVos=new ArrayList<CalculationScriptVo>();
		if (StringUtils.isNotEmpty(companyId)) {
			calculationScripts = calculationScriptService.findAllCalculationScript(companyId);
		} else {
			calculationScripts = calculationScriptService.findAll();
		}
		if(calculationScripts!=null){
			for(CalculationScript calculationScript:calculationScripts){
				calculationScriptVos.add(new CalculationScriptVo(calculationScript));
			}
		}
		view.getModelMap().put("calculationScripts", calculationScriptVos);
		view.getModelMap().put("companyId", companyId);
		view.setViewName("admin/calculationscript/calculationscriptlisttable");
		return view;
	}
	@RequestMapping("/loglist")
	public ModelAndView calculationScriptLogList(String scriptKey,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = calculationScriptLogListValue(scriptKey,response, request);
		view.setViewName("admin/calculationscript/calculationscriptLoglist");
		return view;
	}

	@RequestMapping("/loglist_nd")
	public ModelAndView calculationScriptLogListValue(String scriptKey,HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();	
		List<CalculationScriptLog> calculationScriptlogs =null;
		if(StringUtils.isNotEmpty(scriptKey)){
			calculationScriptlogs = calculationScriptLogService.findCalculationScriptLogs(scriptKey);
			if(calculationScriptlogs!=null){
				List<CalculationScriptVo> calculationScriptVos=new ArrayList<CalculationScriptVo>();
				for(CalculationScriptLog calculationScriptlog:calculationScriptlogs){
					calculationScriptVos.add(new CalculationScriptVo(calculationScriptlog));
				}
				view.getModelMap().put("calculationscriptlogs", calculationScriptVos);
			}
		}
		view.setViewName("admin/calculationscript/calculationscriptLoglisttable");
		return view;
	}
	@RequestMapping("/showlog")
	public ModelAndView showlog(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.getModelMap().put("types", ScriptEngineEnum.values());
		view.getModelMap().put("states", CalStates.values());
		CalculationScriptLog calculationScriptLog = calculationScriptLogService.findById(id);
		view.getModel().put("calculationscriptlog", calculationScriptLog);
		view.setViewName("admin/calculationscript/showcalculationscriptlog");
		return view;
	}
	@RequestMapping("/create")
	public ModelAndView createCalculationScript(String companyId,HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		view.getModelMap().put("companyId", companyId);
		view.getModelMap().put("types", ScriptEngineEnum.values());
		view.getModelMap().put("states", CalStates.values());
		view.setViewName("admin/calculationscript/savecalculationscript");
		return view;
	}

	@RequestMapping("/update")
	public ModelAndView updateCalculationScript(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		CalculationScript calculationScript = calculationScriptService.findById(id);
		if(calculationScript.getCompany()!=null){
			view.getModelMap().put("companyId", calculationScript.getCompany().getId());
		}
		view.getModel().put("calculationscript", calculationScript);
		view.getModelMap().put("types", ScriptEngineEnum.values());
		view.getModelMap().put("states", CalStates.values());
		view.setViewName("admin/calculationscript/savecalculationscript");
		return view;
	}

	@RequestMapping("/save")
	public ModelAndView saveCalculationScript(CalculationScriptVo calculationScriptVo, HttpServletResponse response, HttpServletRequest request)
			throws Exception {		
		ModelAndView view = new ModelAndView();		
		try {
			User user = SessionUtils.getUser(request);
			CalculationScript calculationScript=new CalculationScript();
			if (StringUtils.isNotEmpty(calculationScriptVo.getScriptKey())) {
				calculationScript = calculationScriptService.findById(calculationScriptVo.getScriptKey());
			} 
			if(StringUtils.isNotEmpty(calculationScriptVo.getTitle())){
				calculationScript.setTitle(calculationScriptVo.getTitle());
			}
			if(StringUtils.isNotEmpty(calculationScriptVo.getDescription())){
				calculationScript.setDescription(calculationScriptVo.getDescription());
			}
			if(StringUtils.isNotEmpty(calculationScriptVo.getScriptContext())){
				calculationScript.setScriptContext(calculationScriptVo.getScriptContext());
			}
			if(StringUtils.isNotEmpty(calculationScriptVo.getType())){
				calculationScript.setType(ScriptEngineEnum.valueOf(calculationScriptVo.getType()));
			}
			if(StringUtils.isNotEmpty(calculationScriptVo.getState())){
				calculationScript.setState(CalStates.valueOf(calculationScriptVo.getState()));
			}
			calculationScript.setUpdateTime(new Date());
			Set<CalculationScriptLog> calculationScriptLogs =calculationScript.getCalculationScriptLogs();
			CalculationScriptLog calculationScriptLog=new CalculationScriptLog(calculationScript);
			calculationScriptLog.setUser(user);
			calculationScriptLog.setCalculationScript(calculationScript);
			calculationScriptLogs.add(calculationScriptLog);
			if (StringUtils.isNotEmpty(calculationScriptVo.getScriptKey())) {
				calculationScriptService.update(calculationScript);
			}else{
				if(StringUtils.isNotEmpty(calculationScriptVo.getCompanyId())){
					Company company=companyService.findById(calculationScriptVo.getCompanyId());
					if(company!=null){
						calculationScript.setCompany(company);
					}
				}
				calculationScript.setScriptKey(getScriptKey());
				calculationScriptService.save(calculationScript);
			} 
			view.getModel().put("companyId", calculationScriptVo.getCompanyId());
			view.getModel().put("message", "success");
		} catch (Exception e) {
			e.printStackTrace();
			view.getModel().put("message", "error");
		}		
		return view;
	}
	/**
	 * 自定义Script_Key
	 * @return
	 */
	private String getScriptKey(){
		return UUID.randomUUID().toString();
	}
	@RequestMapping("/delete")
	public ModelAndView deleteCalculationScript(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error");
			return view;
		}	
		String[] paytypeIds = ProcessSignUtils.getInstance().processComma(ids);	
		for (String id : paytypeIds) {
			calculationScriptService.remove(id);
		}
		return view;
	}
}
