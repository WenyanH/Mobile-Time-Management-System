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
import com.tms.entity.tms.Position;
import com.tms.service.tms.TMSService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;


@RequestMapping("/position")
@Controller
public class PositionController extends BaseController<Object> {

	@Autowired
	private TMSService tmsService; 	
	
	@RequestMapping("/list")
	public ModelAndView positionList(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = positionListValue(response, request);
		view.setViewName("tms/position/positionlist");
		return view;
	}
	
	@RequestMapping("/list_nd")
	public ModelAndView positionListValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		
		User user = SessionUtils.getUser(request);
		List<Position> positions = tmsService.findAllPosition(user.getCompany().getId());
		view.getModelMap().put("positions", positions);
		view.setViewName("tms/position/positionlisttable");
		return view;
	}
	
	@RequestMapping("/create")
	public ModelAndView createPosition(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("tms/position/saveposition");
		return view;
	}
	
	@RequestMapping("/update")
	public ModelAndView updatePosition(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
		Position position = tmsService.findById(id);
		view.getModel().put("position", position);
		view.setViewName("tms/position/saveposition");
		return view;
	}
	
	
	@RequestMapping("/save")
	public ModelAndView savePosition(Position position, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		ModelAndView view = new ModelAndView();
		
		try {

			User user = SessionUtils.getUser(request);
			position.setCompany(user.getCompany());
			if (StringUtils.isEmpty(position.getId())) {
				if (tmsService.validatePositionCodeNamePunchCodeExist(position.getCode(), position.getName(), position.getPunchCode(), user.getCompany().getId())) {
					view.getModel().put("message", "exist");
					return view;
				} else {
					tmsService.savePosition(position);
				}
			} else {
				Position tmp = tmsService.findById(position.getId());
				position.setCreateTime(tmp.getCreateTime());
				if (tmp.getCode().equals(position.getCode())){
					tmsService.updatePosition(position);
				} else {
					if (tmsService.validatePositionCodeNamePunchCodeExist(position.getCode(), position.getName(), position.getPunchCode(), user.getCompany().getId())) {
						view.getModel().put("message", "exist");
						return view;
					} else {
						tmsService.updatePosition(position);
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
	public ModelAndView deletePosition(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		String[] positionIds = ProcessSignUtils.getInstance().processComma(ids);
		for (String id : positionIds) {
			tmsService.removePosition(id);
		}

		return view;
	}
	

}