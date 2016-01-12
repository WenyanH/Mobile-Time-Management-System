<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<head>
	<script>
	$(document).ready(function(){
		profile.initSavePage();
	});
	</script>
</head>

<form id="profileForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" enctype="multipart/form-data" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
<input class="span12" name="id" type="hidden" id="id" value="${user.id}"/>
<input class="span12" name="employeeId" type="hidden" id="employeeId" value="${employee.id}"/>
	<div class='row-fluid' >
			<div id="alertMessage"></div>
<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
				<span><fmt:message key="profilelist.info.profile" /><!--Profile--></span>				
			</div>
			
		</div>
	</div>
</div>

<div style="margin:0px auto; width:900px;">
<div class='row-fluid' >
			<div id="alertMessage"></div>
			<div class='row-fluid' >
			<div class="span4">
								<div class="control-group">										
										<div class="controls">
											<div class="box-content text-center">
					                        	<div class="row-fluid">
					                        	
						                        	<c:if test="${employee.photo==null||employee.photo==''}">
						                            <img src="<webpath:path/>/resources/default/images/user.png" style="margin-bottom:5px;width: 47px;" id="photo">
						                            </c:if>
						                            <c:if test="${employee.photo!=null&&employee.photo!=''}">
						                            <img src="data:image/png;base64,${employee.photo}" style="margin-bottom:5px;width:47px; height:47px; " id="photo" class="user-photo"/>
						                            </c:if>
					                            </div>
					                            <input title='Upload' type='file' id="fileUpload" name="fileUpload" style="display:none"/>
					                            <p id="upload-button" class="upload-button" style="display:none;left: 60px;">
													<button class="btn" type="button" style="margin-bottom:5px" onclick='$("#icon-upload").show();$("#file-upload-button").show();$("#upload-button").hide();$(".file-input-name").remove();'>
														Cancel
													</button>
												</p>
					                        </div>
										</div>
									</div>
								</div>

<div class="span8">		
				<div id="" class="portlet box green">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>
							<span><fmt:message key="profilelist.info.baseinfo" /><!--Base Info--></span>
						</div>
					</div>
										
					<div class="portlet-body">
					
					<div class='row-fluid'>					
											
								<div class="control-group">
									<label class="control-label"><fmt:message key="saveuser.info.firstname" /><!--First Name:--></label>
									<div class="controls">
										<input class="span8" name="firstName" type="text" id="firstName" value="${employee.firstName}"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label"><fmt:message key="saveuser.info.lastname" /><!--Last Name:--></label>
									<div class="controls">
										<input class="span8" name="lastName" type="text" id="lastName" value="${employee.lastName}"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label"><fmt:message key="saveuser.info.middlename" /><!--Middle Name:--></label>
									<div class="controls">
										<input class="span8" name="middleName" type="text" id="middleName" value="${employee.middleName}"/>
									</div>
								</div>
							</div>
						</div>
						
						
				    </div>
				 
				
				 
				<div id="" class="portlet box green ">
				
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-user"></i>
							<span><fmt:message key="saveemployee.info.contact" /><!--Contact--></span>
						</div>
					</div>
					
					<div class="portlet-body">
					<div class='row-fluid'>														                   
							<div class="span6">
								<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.name" /><!--Name:--></label>
										<div class="controls">
											<input class="span12" name="name" type="text" id="name" value="${employee.name}"/>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.title" />
										</label>
										<div class="controls">
											<input class="span12" name="title" type="text" id="title" value="${employee.title}"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.mobile" /><!--mobile:-->
										</label>
										<div class="controls">
											<input class="span12" name="mobile" type="text" id="mobile" value="${employee.mobile}"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.phone" /><!--phone--></label>
										<div class="controls">
											<input class="span12" name="phone" type="text" id="phone" value="${employee.phone}"/>
										</div>
									</div>
							</div>
							<div class="span6">
									
									<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.fax" /><!--fax:-->
										</label>
										<div class="controls">
											<input class="span12" name="fax" type="text" id="fax" value="${employee.fax}"/>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.physical" /><!--Physical:--></label>
										<div class="controls">
										<input class="span12" name="physicalAddr" type="text" id="physicalAddr" value="${employee.physicalAddr}"/>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">
										<fmt:message key="saveemployee.info.postal" /><!--postalAddr-->
										</label>
										<div class="controls">
										<input class="span12" name="postalAddr" type="text" id="postalAddr" value="${employee.postalAddr}"/>	
										</div>
									</div>
							</div>
									
								</div>
							</div>
							
						</div>
						</div>		
									
	</div>					
	<div class="row-fluid" id="savebutton">
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <fmt:message key="global.info.save" /><!--Save-->
		</button>
	</div>	
	
	</form>				

<script src="<webpath:path/>/resources/default/js/tms/mydetail/user/profile.js" type="text/javascript"></script>    		
	