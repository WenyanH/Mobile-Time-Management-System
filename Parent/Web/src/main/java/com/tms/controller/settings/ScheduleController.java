package com.tms.controller.settings;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.controller.base.BaseController;
import com.tms.entity.User;
import com.tms.entity.tms.Schedule;
import com.tms.entity.tms.SchedulePeriod;
import com.tms.entity.tms.ScheduleRule;
import com.tms.service.tms.TMSService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;
import com.tms.vo.RoundingVo;
import com.tms.vo.ScheduleRuleVo;
import com.tms.vo.ScheduleVo;

@Controller
@RequestMapping("/schedule")

public class ScheduleController extends BaseController<Object> {
	@Autowired
	private TMSService tmsService;	
	
	@RequestMapping("/list")
    public ModelAndView scheduleList(HttpServletResponse response, HttpServletRequest request)
            throws Exception {
    	ModelAndView view = scheduleListValue(response, request);
    	view.setViewName("tms/schedule/schedulelist");
        return view;
    }

    @RequestMapping("/list_nd")
	public ModelAndView scheduleListValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		User user = SessionUtils.getUser(request);
		if(user.getCompany()!=null){
			List<Schedule> schedules = tmsService.findSchedules(user.getCompany().getId());
			view.getModelMap().put("schedules", schedules);
		}
		view.setViewName("tms/schedule/schedulelisttable");
		return view;
	}
    
    @RequestMapping("/create")
	public ModelAndView createSchedule(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		view.getModel().put("ptype", SchedulePeriod.values());	
		User user = SessionUtils.getUser(request);
		List<Schedule> schedules = tmsService.findSchedules(user.getCompany().getId());
		view.getModelMap().put("schedules", schedules);
		view.setViewName("tms/schedule/saveschedule");
		return view;
	}
    
    @RequestMapping("/update")
	public ModelAndView updateSchedule(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Schedule schedule = tmsService.findScheduleById(id);
		if (schedule != null) {
			String scheduleID = "";
			if (schedule.getName() != null) {
				scheduleID = schedule.getId();
			}
			view.getModel().put("scheduleID", scheduleID);
		}
		view.getModel().put("ptype", SchedulePeriod.values());		
		User user = SessionUtils.getUser(request);
		List<Schedule> schedules = tmsService.findSchedules(user.getCompany().getId());
		view.getModelMap().put("schedules", schedules);		
		view.getModel().put("schedule", new ScheduleVo(schedule));
		view.setViewName("tms/schedule/saveschedule");
		return view;
	}
    
   @RequestMapping("/view")
   	public ModelAndView viewSchedule(String id, HttpServletResponse response, HttpServletRequest request) throws Exception {
   		ModelAndView view = new ModelAndView();	
   		Schedule schedule = tmsService.findScheduleById(id);
   		view.getModelMap().put("schedule", schedule);
   		return view;
   	}
   @RequestMapping("/appendscheduletime")
  	public ModelAndView appendscheduleime(String id,String ruleId,HttpServletResponse response, HttpServletRequest request) throws Exception {
  		ModelAndView view = new ModelAndView();	
  		if(StringUtils.isNotEmpty(id)&&StringUtils.isNotEmpty(ruleId)){
  			Schedule schedule = tmsService.findScheduleById(id);
//  	  		if(schedule!=null&&schedule.getRules()!=null){
//  	  		SimpleDateFormat sdf =new SimpleDateFormat("hh:mm");
//  	  			for(ScheduleRule scheduleRule:schedule.getRules()){
//  	  				if(scheduleRule.getId().equals(ruleId)){
//  	  					view.getModel().put("ruleId", scheduleRule.getId());
//  	  					view.getModel().put("title", scheduleRule.getName());
//  	  					view.getModel().put("start", sdf.format(scheduleRule.getStartTime()));
//  	  					view.getModel().put("end", sdf.format(scheduleRule.getEndTime()));
//  	  					view.setViewName("tms/schedule/appendscheduleime");
//  	  					break;
//  	  				}
//  	  			}
//  	  		}
  		}
  		
  		view.setViewName("tms/schedule/appendscheduleime");
  		return view;
  	}
   
   /**
    * 排班日历控件页面
    * @param viewType （agendaWeek 一周,agendaBiWeek 双周,agendaDay 天）
    * @param eventJsons(events 的值)
    * @return
    */
   @RequestMapping("/showfullcalendar")
   public ModelAndView showfullcalendar(String viewType,String eventJsons){
	   ModelAndView view = new ModelAndView();	
	   if(StringUtils.isEmpty(viewType)){
		   viewType="agendaWeek";
	   }
	   if(StringUtils.isEmpty(eventJsons)){
		   eventJsons="";
	   }
	   view.getModelMap().put("viewType", viewType);
	   view.getModelMap().put("eventJsons", eventJsons);
	   view.setViewName("tms/schedule/fullcalendar");
	   return view;
   }
	@RequestMapping("/fullcalendar")
   public void getFullcalendar(String id,HttpServletRequest request,HttpServletResponse response){
		Schedule schedule = tmsService.findScheduleById(id);
//		try {
//			if(schedule!=null&&schedule.getRules()!=null&&schedule.getRules().size()>0){
//				List<ScheduleRuleVo> scheduleRuleVos=new ArrayList<ScheduleRuleVo>();
//				for(ScheduleRule scheduleRule:schedule.getRules()){
//					scheduleRuleVos.add(new ScheduleRuleVo(scheduleRule));
//				}
//				response.getWriter().write(toJson(scheduleRuleVos));
//			}
//			
//		} catch (IOException e) {
//			e.printStackTrace();				
//		}
   }

    @RequestMapping("/save")
   	public ModelAndView saveSchedule(@RequestBody ScheduleVo scheduleVo, HttpServletResponse response, HttpServletRequest request)
   			throws Exception {   		
   		ModelAndView view = new ModelAndView();   		
   		try {
   			User user = SessionUtils.getUser(request);   			
   			Schedule schedule=new Schedule();
   			if(StringUtils.isNotEmpty(scheduleVo.getId())){
   				schedule=tmsService.findScheduleById(scheduleVo.getId());
   				if(!scheduleVo.getName().equals(schedule.getName())){//name修改需要校验
   					if (tmsService.validateScheduleCodeNameExist(scheduleVo.getCode(), scheduleVo.getName(), user.getCompany().getId())){
   	   					view.getModel().put("message", "exist");
   	   					return view;
   	   	   			} 
   				}
   			}else{
   				if (tmsService.validateScheduleCodeNameExist(scheduleVo.getCode(), scheduleVo.getName(), user.getCompany().getId())){
	   					view.getModel().put("message", "exist");
	   					return view;
	   	   		} 
   			}
   			schedule.setCompany(user.getCompany());
   			if(StringUtils.isNotEmpty(scheduleVo.getCode())){
   				schedule.setCode(scheduleVo.getCode());
   			}
   			if(StringUtils.isNotEmpty(scheduleVo.getName())){
   				schedule.setName(scheduleVo.getName());
   			}
   			if(scheduleVo.getStartDate()!=null){
   				schedule.setStartDate(scheduleVo.getStartDate());
   			}
   			schedule.setActive(scheduleVo.getActive());
//   			if(StringUtils.isNotEmpty(scheduleVo.getSchedulePeriod())){
//   				schedule.setSchedulePeriod(SchedulePeriod.valueOf(scheduleVo.getSchedulePeriod()));
//   			}
//   			if(StringUtils.isNotEmpty(scheduleVo.getPeriod())){
//   				schedule.setPeriod(scheduleVo.getPeriod());
//   			}
//   			schedule.setDiffPeriod(scheduleVo.getDiffPeriod());
//   			if(StringUtils.isNotEmpty(scheduleVo.getDays())){
//   				schedule.setDays(scheduleVo.getDays());
//   			}
//   			schedule.setAttribute(scheduleVo.isAttribute());
//   			if (StringUtils.isEmpty(schedule.getId())) {
//   				getScheduleRule(scheduleVo,schedule);
//   				tmsService.saveSchedule(schedule);
//   			} else {
//   				schedule.getRules().clear();
//   				getScheduleRule(scheduleVo,schedule);
//   				tmsService.updateSchedule(schedule);
//   			}
   			view.getModel().put("message", "success");

   		} catch (Exception e) {
   			e.printStackTrace();
   			view.getModel().put("message", "error");
   		}
   		
   		return view;
   		
   	}
    private void  getScheduleRule(ScheduleVo scheduleVo,Schedule schedule){
//    	Set<ScheduleRule> rules =schedule.getRules();
//    	if(scheduleVo.getEventIds()!=null&&scheduleVo.getEventIds().length>0){
//    		int index=0;
//    		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//    		for(String id:scheduleVo.getEventIds()){
//    			ScheduleRule scheduleRule=new ScheduleRule();
//    			if(scheduleVo.getEventStarts()[index]==null){
//    	    		continue;
//    	    	}
//    	    	if(scheduleVo.getEventEnds()[index]==null){
//    	    		continue;
//    	    	}
//    			scheduleRule.setId(id);
//    	    	scheduleRule.setName(scheduleVo.getEventTitles()[index]);
//    	    	scheduleRule.setDayStart(1);
//    	    	scheduleRule.setDayEnd(1);
//    	    	try {
//					scheduleRule.setStartTime(sdf.parse(scheduleVo.getEventStarts()[index]));
//					scheduleRule.setEndTime(sdf.parse(scheduleVo.getEventEnds()[index]));
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
//    	    	scheduleRule.setSchedule(schedule);
//    	    	rules.add(scheduleRule);
//    	    	index++;
//    		}
//    	}
//    	schedule.setRules(rules);
    }
    @RequestMapping("/validateScheduleTime")
    public ModelAndView validateScheduleTime(String id,String startTime,String endTime){
    	ModelAndView view = new ModelAndView();
    	if(StringUtils.isEmpty(startTime)){
    		view.getModel().put("message", "error");
    		return view;
    	}
    	if(StringUtils.isEmpty(endTime)){
    		view.getModel().put("message", "error");
    		return view;
    	}
    	SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    	Date start=null;
    	Date end=null;
    	try {
			 start=sdf.parse(startTime);
			 end=sdf.parse(endTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	Schedule schedule = tmsService.findScheduleById(id);
//    	if(schedule!=null&&schedule.getRules()!=null){
//    		for(ScheduleRule rule:schedule.getRules()){
//    			if(start.getTime()>rule.getStartTime().getTime()&&start.getTime()<rule.getEndTime().getTime()){
//    				view.getModel().put("message", "error");
//    				break;
//    			}
//    			if(end.getTime()>rule.getStartTime().getTime()&&end.getTime()<rule.getEndTime().getTime()){
//    				view.getModel().put("message", "error");
//    				break;
//    			}
//    		}
//    		String scheduleID="";
//    		if(schedule.getName()!=null){
//    			scheduleID=schedule.getId();
//    		}		    	
//    		view.getModel().put("scheduleID", scheduleID);
//    	}
    	return view;
    }
    @RequestMapping("/delete")
   	public ModelAndView deleteSchedule(String ids, HttpServletResponse response, HttpServletRequest request)
   			throws Exception {
   		ModelAndView view = new ModelAndView();
   		if(StringUtils.isEmpty(ids)){
			view.getModel().put("message", "error");
			return view;
		}
   		String[] scheduleIds = ProcessSignUtils.getInstance().processComma(ids);	
   		for (String id : scheduleIds) {
   			tmsService.removeSchedule(id);
   		}
   		return view;
   	}
    
    @RequestMapping("/timeRange")
   	public ModelAndView timeRange(HttpServletResponse response, HttpServletRequest request)
   			throws Exception {
   		ModelAndView view = new ModelAndView();
   		
   		view.setViewName("tms/schedule/timerange");
   		return view;
   	}

    
    @RequestMapping("/dailySettings")
   	public ModelAndView dailySettings(HttpServletResponse response, HttpServletRequest request)
   			throws Exception {
   		ModelAndView view = new ModelAndView();
   		
   		view.setViewName("tms/schedule/dailysettings");
   		return view;
   	}
    
    @RequestMapping("/section")
   	public ModelAndView section(HttpServletResponse response, HttpServletRequest request)
   			throws Exception {
   		ModelAndView view = new ModelAndView();
   		
   		view.setViewName("tms/schedule/section");
   		return view;
   	}
    
}
