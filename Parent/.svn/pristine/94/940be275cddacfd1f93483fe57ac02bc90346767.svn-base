package com.tms.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.tms.annotation.Auth;
import com.tms.entity.User;
import com.tms.utils.SessionUtils;

/**
 * 权限拦截器
 * 
 * @author xia
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private List<String> excludedUrls;

	public void setExcludedUrls(List<String> excludedUrls) {
		this.excludedUrls = excludedUrls;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String path = request.getServletPath();
		if (path.contains("resources")) {
			return true;
		}
		try {
			User user = SessionUtils.getUser(request);
			String baseUri = request.getContextPath();
			if ("/".equals(path)) {
				if (user == null) {
					response.setStatus(response.SC_GATEWAY_TIMEOUT);
					response.sendRedirect(baseUri + "/login");
					return false;
				} else {
					return true;// path=/表示请求的首页,直接返回
				}
			}
			HandlerMethod method = (HandlerMethod) handler;
			Auth auth = method.getMethod().getAnnotation(Auth.class);
			// 验证登陆超时问题 auth = null，默认验证
			if (auth == null || auth.verifyLogin()) {
				if (user == null) {
					response.setStatus(response.SC_GATEWAY_TIMEOUT);
					response.sendRedirect(baseUri + "/login");
					return false;
				}
			}
			// 验证URL权限
			if (auth == null || auth.verifyURL()) {
				// 判断是否超级管理员
				if (!SessionUtils.isAdmin(request)) {
					String menuUrl = StringUtils.remove(request.getRequestURI(), request.getContextPath());
					if (!SessionUtils.isAccessUrl(request, StringUtils.trim(menuUrl))) {
						response.setStatus(response.SC_FORBIDDEN);
//						Map<String, Object> result = new HashMap<String, Object>();
//						result.put("success", false);
//						result.put("logoutFlag", "Don't have permission to access, please contact your administrator.");
//						HtmlUtil.writerJson(response, result);
						return false;
					}
				}
			}
		} catch (Exception e) {
			return true;
		}
		return super.preHandle(request, response, handler);
	}
}
