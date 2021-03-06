package com.tms.controller.settings;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tms.controller.base.BaseController;
import com.tms.entity.User;
import com.tms.entity.tms.Task;
import com.tms.service.tms.TMSService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;

@Controller
@RequestMapping("/task")

public class TaskController extends BaseController<Object> {
	
	@Autowired
	private TMSService tmsService;	
	
	@RequestMapping("/list")
    public ModelAndView taskList(HttpServletResponse response, HttpServletRequest request)
            throws Exception {
    	ModelAndView view = taskListValue(response, request);
    	view.setViewName("tms/task/tasklist");
        return view;
    }

    @RequestMapping("/list_nd")
	public ModelAndView taskListValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		
		User user = SessionUtils.getUser(request);
		List<Task> tasks = tmsService.findAllTasks(user.getCompany().getId());
		view.getModelMap().put("tasks", tasks);
		view.setViewName("tms/task/tasklisttable");
		return view;
	}
    
    @RequestMapping("/create")
	public ModelAndView createTask(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("tms/task/savetask");
		return view;
	}
    
    @RequestMapping("/update")
	public ModelAndView updateTask(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Task task = tmsService.findTaskByid(id);
		view.getModel().put("task", task);
		view.setViewName("tms/task/savetask");
		return view;
	}
    
    @RequestMapping("/save")
	public ModelAndView saveTask(Task task, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		ModelAndView view = new ModelAndView();
		
		try {

			User user = SessionUtils.getUser(request);
			task.setCompany(user.getCompany());
			if (StringUtils.isEmpty(task.getId())) {
				if (tmsService.validateTaskCodeNamePunchCodeExist(task.getCode(), task.getName(), task.getPunchCode(), user.getCompany().getId())) {
					view.getModel().put("message", "exist");
					return view;
				} else {
					tmsService.saveTask(task);
				}
			} else {
				Task tmp = tmsService.findTaskByid(task.getId());
				String code = null;
				String name = null;
				String punchCode = null;
				
				
				if (tmp.getCode().equals(task.getCode()) && task.getName().equals(task.getName()) && tmp.getPunchCode().equals(task.getPunchCode())){
					tmsService.updateTask(task);
				} else {
					if (!tmp.getCode().equals(task.getCode())){
						code = task.getCode();
					}
					if (!tmp.getName().equals(task.getName())){
						name = task.getName();
					}
					if (!tmp.getPunchCode().equals(task.getPunchCode())){
						punchCode = task.getPunchCode();
					}
					
					if (tmsService.validateTaskCodeNamePunchCodeExist(code, name, punchCode, user.getCompany().getId()) && punchCode!="") {
						view.getModel().put("message", "exist");
						return view;
					} else {
						tmsService.updateTask(task);
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
	public ModelAndView deleteTask(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		String[] taskIds = ProcessSignUtils.getInstance().processComma(ids);	
		for (String id : taskIds) {
			tmsService.removeTask(id);
		}
		return view;
	}
}
