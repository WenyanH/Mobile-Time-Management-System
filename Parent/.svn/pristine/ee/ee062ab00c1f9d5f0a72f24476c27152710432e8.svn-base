<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	
</head>
	<div class='row-fluid' style="width:480px;padding: 10px">	
	<form id="departmentForm" action='#' onsubmit="return false;" class="form form-horizontal form-horizontal2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${department.id}"/>
	<input class="span12" name="parent" type="hidden" value="${parent.id}"/> 
	
			<div class="row-fluid" style="height:250px;">
				<div id="alertDepartmentMessage"></div>
				<div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><font color="red">*</font><fmt:message key="divisioninfo.info.no." /><!--No.:--></span></label>
							<div class="controls">
								<input class="span12" name="number" type="text" id="number" value="${department.number}" maxlength="3" />
							</div>
						</div>
	           		</div>
	           		
	           </div>
	           <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><font color="red">*</font>${structureName} <fmt:message key="divisioninfo.info.name" /><!--Name:--></span></label>
							<div class="controls">
								<input class="span12" name="departmentName" type="text" id="" value="${department.departmentName}"/>
							</div>
						</div>
	           		</div> 		
	           </div>
	           
	           <%-- <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span>Level:</span></label>
							<div class="controls">
								<select id="companyStructure" name="companyStructure" class="span12" data-placeholder=" " tabindex="1" >
									<option value=""></option>
									<c:forEach var="c" items="${companyStructureList}">
												<option value="${c.level}" <c:if test="${c.id==companyStructure}">selected='selected'</c:if>>${c.labelName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div> --%>
	           
	           <hr class="hr-normal">
	           
	           <%-- <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.paygroup" /><!--Pay Group:--></span></label>
							<div class="controls">
								<select id="paygroupId" name="paygroupId" class="span12" data-placeholder=" " tabindex="1" >
									<option value=""></option>
									<c:forEach var="payGroup" items="${payGroups}">
												<option value="${payGroup.id}" <c:if test="${payGroup.id==payGroupId}">selected='selected'</c:if>>${payGroup.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div>
	           <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.jobcode" /><!--Job Code:--></span></label>
							<div class="controls">
								<select  class="span12" id="jobId"  name="jobId" data-placeholder=" " tabindex="2" >
									<option value=""></option>
									<c:forEach var="job" items="${jobs}">
												<option value="${job.id}" <c:if test="${job.id==jobId}">selected='selected'</c:if>>${job.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div> --%>
	           <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span>Time Zone</span></label>
							<div class="controls">
								<select  class="span12" id="timeZoneId_create" name="timeZoneId" data-placeholder=" " tabindex="5" >
									<option value=""></option>
									<c:forEach var="timeZone" items="${timeZones}">
												<option value="${timeZone.id}" <c:if test="${timeZone.id==timeZoneId}">selected='selected'</c:if>>${timeZone.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div>
	           
	           <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.schedule" /><!--Schedule:--></span></label>
							<div class="controls">
								<select  class="span12" id="scheduleId_create" name="scheduleId" data-placeholder=" " tabindex="3" >
									<option value=""></option>
								</select>
							</div>
						</div>
	           		</div>
	           </div>
	           <%-- <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.position" /><!--Position:--></span></label>
							<div class="controls">
								<select  class="span12" id="positionId" name="positionId" data-placeholder=" " tabindex="4" >
									<option value=""></option>
									<c:forEach var="position" items="${positions}">
												<option value="${position.id}" <c:if test="${position.id==positionId}">selected='selected'</c:if>>${position.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div> --%>
	           <div class='row-fluid'>
	           		<div class="span12">
	           			<div class="control-group">
							<label class="control-label"><span><fmt:message key="companyinfo.info.timerounding" /><!--Time Rounding:--></span></label>
							<div class="controls">
								<select  class="span12" id="timeRoundingId_create" name="timeRoundingId" data-placeholder=" " tabindex="5" >
									<option value=""></option>
									<c:forEach var="timeRounding" items="${timeRoundings}">
												<option value="${timeRounding.id}" <c:if test="${timeRounding.id==timeRoundingId}">selected='selected'</c:if>>${timeRounding.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>
	           		</div>
	           </div>
	           
	           
	           
	</div>          
	<div class="row-fluid" id="savebutton">
		<c:if test="${department.id==null}">
		<label class="checkbox inline">
			<input id="keepon" type="checkbox" value="" >
				<fmt:message key="saveuser.info.keepon" /><!--Keep on creating a new item.-->
		</label>
		</c:if>
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <fmt:message key="global.info.save" /><!--Save-->
		</button>
	</div>	
	
	</form>
	</div>
<script>
	$(document).ready(function(){
		department.initSavePage();
	});
	</script>