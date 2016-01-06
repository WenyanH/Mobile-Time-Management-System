<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id=''>
    <div class='application'>
        <div class='application-content'>
                <span style="display: block;"><img src="<webpath:path/>/resources/default/images/login-logo.png"/></span>
        </div>
    </div>
    <div class='controls'>
        <div class='caret'></div>
        <div class='form-wrapper'>
            <h1 class='text-center'>
            <span><fmt:message key="forgotpassword.info.forgotpassword" /><!--Forgot password--></span>
            </h1>
			<form accept-charset="UTF-8" action="#" method="post" >
			<div style="margin: 0; padding: 0; display: inline">
				<input name="utf8" type="hidden" value="&#x2713;" />
			</div>
			<div class='row-fluid'>
				<div class='span12 icon-over-input'>
					<input class="span12" id="email" name="email" placeholder="Email"
						type="text" value="" /> <i class='icon-envelope-alt muted'></i>
				</div>
			</div>
			<button class="btn btn-block btn-warning" name="button" type="submit">
			<span><fmt:message key="forgotpassword.info.sendemail" /><!--Send to my email--></span>
			</button>
			</form>
			<div class='text-center'>
                <hr class='hr-normal' />
                <a href="<webpath:path/>/login"><i class='icon-signin '></i>
                    <span><fmt:message key="forgotpassword.info.knowpassword" /><!--I already know my password--></span>
                </a>
            </div>
        </div>
    </div>
    <div class='login-action text-center'>
        <a href="http://www.cbsystems.co.nz/"><i class='icon-user'></i>
            <strong>Signup</strong> to CleverTime System? 
        </a>
    </div>
</div>
