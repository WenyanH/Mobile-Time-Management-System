package com.tms.tags;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;

import com.tms.entity.Role;
import com.tms.entity.User;
import com.tms.utils.SessionUtils;

public class PermissionTag extends TagSupport {

	private static final long serialVersionUID = 8641418505314667891L;

	private String roles;

	public int doStartTag() throws JspException {

		HttpSession session = pageContext.getSession();
		User user = SessionUtils.getUser(session);

		if (StringUtils.isEmpty(roles)) {
			return Tag.SKIP_BODY;
		}

		String[] roleArray = roles.split(",");

		for (Role role : user.getRoles()) {
			for (String r : roleArray) {
				if (role.getName().equalsIgnoreCase(r)) {
					return Tag.EVAL_PAGE;
				}
			}
		}

		return Tag.SKIP_BODY;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

}
