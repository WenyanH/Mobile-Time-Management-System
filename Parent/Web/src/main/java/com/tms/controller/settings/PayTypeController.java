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
import com.tms.entity.tms.PayType;
import com.tms.service.tms.TMSService;
import com.tms.utils.ProcessSignUtils;
import com.tms.utils.SessionUtils;

@Controller
@RequestMapping("/paytype")

public class PayTypeController extends BaseController<Object> {
	
	@Autowired
	private TMSService tmsService;
	
	
//    @Auth(verifyLogin=false,verifyURL=false)
    @RequestMapping("/list")
    public ModelAndView payTypeList(HttpServletResponse response, HttpServletRequest request)
            throws Exception {
    	ModelAndView view = payTypeListValue(response, request);
    	view.setViewName("tms/paytype/paytypelist");
        return view;
    }

    @RequestMapping("/list_nd")
	public ModelAndView payTypeListValue(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		User user = SessionUtils.getUser(request);
		List<PayType> payTypes = tmsService.findPayTypes(user.getCompany().getId());
		view.getModelMap().put("paytypes", payTypes);
		view.setViewName("tms/paytype/paytypelisttable");
		return view;
	}
  
    @RequestMapping("/create")
	public ModelAndView createPaytype(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("tms/paytype/savepaytype");
		return view;
	}
    
    @RequestMapping("/update")
	public ModelAndView updatePaytype(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();
 		PayType paytype = tmsService.findPayTypeById(id);
		view.getModel().put("paytype", paytype);
		view.setViewName("tms/paytype/savepaytype");
		return view;
	}
    
    @RequestMapping("/save")
	public ModelAndView savePaytype(PayType payType, HttpServletResponse response, HttpServletRequest request)
			throws Exception {		
		ModelAndView view = new ModelAndView();		
		try {
			User user = SessionUtils.getUser(request);
			payType.setCompany(user.getCompany());
			if (StringUtils.isEmpty(payType.getId())) {
				if (tmsService.validatePayTypeCodeNameExist(payType.getCode(),payType.getName(), user.getCompany().getId())) {
					view.getModel().put("message", "exist");
					return view;
				} else {
					tmsService.savePayType(payType);
				}
			} else {
				PayType tmp = tmsService.findPayTypeById(payType.getId());
				String code = null;
				String name = null;				
				if(tmp.getCode().equals(payType.getCode()) && tmp.getName().equals(payType.getName())){
					tmsService.updatePayType(payType);
				}else {
					if (!tmp.getCode().equals(payType.getCode())){					
						code = payType.getCode();
					}
					if (!tmp.getName().equals(payType.getName())){
						name = payType.getName();
					}			
					if (tmsService.validatePayTypeCodeNameExist(code, name, user.getCompany().getId())) {
						view.getModel().put("message", "exist");
						return view;
					} else {
						tmsService.updatePayType(payType);
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
	public ModelAndView deletePaytype(String ids, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		ModelAndView view = new ModelAndView();		
		String[] paytypeIds = ProcessSignUtils.getInstance().processComma(ids);	
		for (String id : paytypeIds) {
			tmsService.removePayType(id);
		}
		return view;
	}
}