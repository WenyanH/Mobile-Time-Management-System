<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		job.initSavePage();
	});
	</script>
</head>
		
	<form id="jobForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${job.id}"/>
	<div class='row-fluid' style="height:365px">
			<div id="alertMessage"></div>
		
			
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savejob.info.code" /><!--Code:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="code" type="text" id="code" value="${job.code}" maxlength="14"/>
						
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">
					<span><fmt:message key="savejob.info.status" /></span>
					</label>
					<div class="controls">
						<label class="span12 checkbox inline"> 	
						<c:if test="${job.id==null}">						
					    <input type="checkbox" id="active" value="true" checked="checked" disabled>
					    </c:if>
					    <c:if test="${job.id!=null}">
								<input type="checkbox" id="active" value="true"
									<c:if test="${job.active}">checked="checked"</c:if>>
							</c:if> 	
							<span><fmt:message key="global.info.active" /></span>
						   </label>
						
					</div>
				</div>

			   <div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savejob.info.name" /><!--Name:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="name" type="text" id="name" value="${job.name}" maxlength="40"/>
						
					</div>
				</div>
					
				<div class="control-group">
					<label class="control-label">
					<span><fmt:message key="savejob.info.task" /><!--Task:--></span>
					</label>
					<div class="controls">
							
						<select id="taskID" name="taskID" class="span12"  multiple="multiple">							
							<c:forEach var="task" items="${taskList}">	
								<c:if test="${task.active==true}">								
								<option value="${task.id}" 
								<c:forEach var="jobtask" items="${job.tasks}">	
									<c:if test="${task.id==jobtask.id}">selected</c:if>
								</c:forEach>
								
								
								>${task.name}</option>
								</c:if>
							</c:forEach>						
						</select>
					</div>						
					</div>
								
				
				
				
							
				<div class="control-group">
					<label class="control-label"> <span><fmt:message key="savejob.info.memo" /></span></label>
					<div class="controls">
						<textarea id="description" name="description" rows="4" class='span12'>${job.description}</textarea>
					</div>
					
				</div>
									
				
				
			    <div class="control-group">
					<label class="control-label"> 
					<span><fmt:message key="savejob.info.punchmachine" /><!--Punch Machine:--></span>
					</label>	
									
					<div class="controls">
						<div class='row-fluid'>
							<label class="span4 checkbox inline"> 							
								<input type="checkbox" id="usePunchCode" value="true" 
									<c:if test="${job.usePunchCode}">checked="checked"</c:if>>
							<span><fmt:message key="savejob.info.punchcode" /></span>
						    </label>	
						    
						     <c:if test="${job.id==null}">	
						    <input class="span6" name="punchCode" type="text" id="punchCode" value="${job.punchCode}" maxlength="10" disabled/>
						    </c:if>
					        <c:if test="${job.id!=null}">    
						    <input class="span6" name="punchCode" type="text" id="punchCode" value="${job.punchCode}" maxlength="10"
						    <c:if test="${job.usePunchCode==''}">disabled</c:if>>						    
						    </c:if>						    
						
						</div>
				    </div>				 					
			   </div>	
		</div>	
	

	<div class="row-fluid" id="savebutton">
		<c:if test="${job.id==null}">
		<label class="checkbox inline">
			<input id="keepon" type="checkbox" value="" >
				<span><fmt:message key="global.info.keepon" /><!--Keep on creating a new item.--></span>
		</label>
		</c:if>
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <span><fmt:message key="global.info.save" /><!--Save--></span>
		</button>
	</div>	
	
	</form>

<script src="<webpath:path/>/resources/default/js/tms/tmssetting/job.js" type="text/javascript"></script>				