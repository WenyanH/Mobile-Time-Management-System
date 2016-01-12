<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	var LOGIN_INFO_ERROR = '<fmt:message key="login.info.error"/>';
	var LOGIN_INFO_SUCCESS = '<fmt:message key="login.info.success"/>';
</script>
<script src="<webpath:path/>/resources/default/js/tms/login.js" type="text/javascript"></script>

<div id='' class="">
    <div class='application'>
        <div class='application-content'>
                <span style="display: block;"><img src="<webpath:path/>/resources/default/images/login-logo.png"/></span>
        </div>
    </div>
    <div class='controls'>
        <div class='caret'></div>
        <div class='form-wrapper'>
            <h1 class='text-center'>
            <span><fmt:message key="login.info.signin" /><!--Sign in--></span>
            </h1>
          	
            <form accept-charset="UTF-8" onsubmit="return login.signin();" method="post" >
            	<div id="alertMessage"></div>
                <div class='row-fluid'>
                    <div class='span12 icon-over-input'>
                        <input class="span12" id="userId" name="userId" placeholder="Email" type="text" value="" />
                        <i class='icon-envelope-alt  muted'></i>
                    </div>
                </div>
                <div class='row-fluid'>
                    <div class='span12 icon-over-input'>
                        <input class="span12" id="password" name="password" placeholder="Password" type="password" value="" />
                        <i class='icon-lock muted' style="width:12px;"></i>
                    </div>
                </div>
                <label class="checkbox" for="remember_me"><input id="rememberme" type="checkbox" value="1" />
                    Remember me
                </label>
                <button class="btn btn-block btn-warning" name="button" type="submit" id="signinButton">Sign in</button>
            </form>
            <div class='text-center'>
                <hr class='hr-normal' />
                <a href="<webpath:path/>/forgotpassword">Forgot your password?</a>
            </div>
        </div>
    </div>
    <div class='login-action text-center'>
        <a href="http://www.cbsystems.co.nz/"><i class='icon-user'></i>
            <strong>Signup</strong> to CleverTime System? 
        </a>
    </div>
</div>
