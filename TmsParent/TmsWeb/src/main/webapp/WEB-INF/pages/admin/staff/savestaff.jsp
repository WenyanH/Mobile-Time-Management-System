<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<style>
		.file-input-name{
			position: inherit;
		}
	</style>
<script>
$(document).ready(function(){
	staff.initSavePage();
});
</script>
</head>


<div class='row-fluid' style="width: 505px;padding: 10px">	
	<form id="staffForm" action='#' onsubmit="return false" class="form form-horizontal form-horizontal2"  style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${user.id}"/>
	<div class='row-fluid'  >
			<div id="alertMessage"></div>
			<div class='row-fluid' style="height:230px;">	
				<div class="span12 ">
					
									
									<div class="control-group">
										<label class="control-label"><font color="red">*</font><fmt:message key="saveuser.info.email" /><!--Email:--></label>
										<div class="controls">
											<input class="span12" name="email" type="text" id="email" value="${user.email}" placeholder="Email will do for the login name."/>
											
										</div>
									</div>
									
									<c:if test="${user.id==null || user.id==''}">
									<input  type='checkbox' name="changePassword" id="changePassword"  value="" checked="checked" style="display:none"/>
									<div class="control-group">
										<label class="control-label"><font color="red">*</font><fmt:message key="saveuser.info.password" /><!--Password:--></label>
										<div class="controls">
											<input class="span12" name="password" type="password" id="password" value=""/>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label"><font color="red">*</font><fmt:message key="saveuser.info.confirmpassword" /><!--Confirm Password:--></label>
										<div class="controls">
											<input class="span12"  name="confirm_password"   type="password" id="confirm_password" value="" />
										</div>
									</div>
									</c:if>
									
									<c:if test="${user.id!=null && user.id!=''}">
									
									<div class="control-group">
										<label class="control-label"><fmt:message key="saveemployee.info.changepassword" /><!--Change Password--></label>
										<div class="controls">
											<div class='switch' data-off-label='<i class="icon-ban-circle"></i>' data-on-label='<i class="icon-ok"></i>' data-on='success' data-off="warning">
					                            <input  type='checkbox' name="changePassword" id="changePassword"  value=""  onchange="staff.changePassword();"/>
					                        </div>
										</div>
									</div>
									
									<div class="control-group hide pw-div">
										<label class="control-label"><font color="red">*</font><fmt:message key="saveuser.info.password" /><!--Password:--></label>
										<div class="controls">
											<input class="span12" name="password" type="password" id="password" value=""/>
										</div>
									</div>
									
									<div class="control-group hide pw-div">
										<label class="control-label"><font color="red">*</font><fmt:message key="saveuser.info.confirmpassword" /><!--Confirm Password:--></label>
										<div class="controls">
											<input class="span12"  name="confirm_password"   type="password" id="confirm_password" value="" />
										</div>
									</div>
									</c:if>
									<div class="control-group">
										<label class="control-label"><font color="red">*</font><fmt:message key="user.info.status" /><!--Email:--></label>
										<div class="controls">
				  						<select id="status" name="status" class="span12" data-placeholder=" " tabindex="1">
										<c:forEach var="userStatus" items="${userStatus}">
											<option value="${userStatus}"
										<c:if test="${userStatus==user.status}">selected</c:if>>${userStatus}</option>
											</c:forEach>
										</select>
									</div>
									</div>
								
				</div>
			</div>
	</div>
	<div class="row-fluid" id="savebutton">
		<c:if test="${user.id==null}">
			<label class="checkbox inline"> <input id="keepon"
				type="checkbox" value=""> <span><fmt:message
						key="global.info.keepon" /> <!--Keep on creating a new item.--></span>
			</label>
		</c:if>
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <span><fmt:message
					key="global.info.save" /> <!--Save--></span>
		</button>
	</div>
	
	
	</form>
</div>

