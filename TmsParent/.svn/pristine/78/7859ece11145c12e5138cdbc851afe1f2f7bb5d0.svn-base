<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		leave.initSavePage();
	});
	</script>
</head>

<div class='row-fluid' style="width: 505px;padding: 10px">	
	<form id="leaveForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${leave.id}"/>
	<div class='row-fluid' style="height:200px">
			<div id="alertMessage"></div>
			
			<div class='span12' style="margin:0px;">
			
			<div class="control-group">
					<label class="control-label">
					<span><fmt:message key="saveleave.info.employee" /><!--Employee:--></span>
					</label>
					<div class="controls">
						<select id="employeeID" name="employeeID" class="span12" data-placeholder=" " tabindex="1" >
							<c:forEach var="employee" items="${employeeList}">									
								<option value="${employee.id}" <c:if test="${employee.id==employeeID}">selected</c:if>>${employee.firstName},${employee.lastName}</option>
							</c:forEach>
						</select>
					</div>						
					</div>
			
										
				
				<div class="control-group">	
					<label class="control-label"> <span><fmt:message key="saveleave.info.type" /><!--Pay Type:--></span></label>
					<div class="controls">
						<select id="typeID" name="typeID" class="span6" data-placeholder=" " tabindex="1" >
							<c:forEach var="paytype" items="${paytypeList}">	
							    <c:if test="${paytype.active==true}">	
								<c:if test="${paytype.leaveStatus==true}">
								<option value="${paytype.id}" <c:if test="${paytype.id==typeID}">selected</c:if>>${paytype.name}</option>
								</c:if>
								</c:if>
							</c:forEach>
						</select>
					</div>	
				</div>			
				
			
			
	
	
				<div class="control-group">
					<label class="control-label"> <span><fmt:message key="saveleave.info.fromdate" /><!--From Date:--></span></label>
					<div class="controls input-append date" id="fromDatetime" data-date-format="yyyy-mm-dd" style="display: block;">
						<input class="" name="fromDate" type="text" id="fromDate" value="<fmt:formatDate value="${leave.fromDate}" type="date" pattern="yyyy-MM-dd"/>" readonly/>
						<span class='add-on' style="cursor: pointer;">
				           <i class='icon-calendar'></i>
				        </span>
					</div>
				</div>
			
			
	<div class="control-group">
		<c:if test="${leave.id==null}">
				<div class="control-group" id="toDateline">
					<label class="control-label"> <span><fmt:message key="saveleave.info.todate" /><!--To Date:--></span></label>
					<div class="controls input-append date" id="toDatetime" data-date-format="yyyy-mm-dd" style="display: block;">
						<input class="" name="toDate" type="text" id="toDate" value="<fmt:formatDate value="${leave.toDate}" type="date" pattern="yyyy-MM-dd"/>" readonly/>
						<span class='add-on' style="cursor: pointer;">
				           <i class='icon-calendar'></i>
				        </span>
					</div>
				</div>
		</c:if>
		<c:if test="${leave.id!=null}"> 		
				 <c:if test="${leave.byWorkHours==false}">
				 <div class="control-group" id="toDateline">
					<label class="control-label"> <span><fmt:message key="saveleave.info.todate" /><!--To Date:--></span></label>
					<div class="controls input-append date" id="toDatetime" data-date-format="yyyy-MM-dd" style="display: block;">
						<input class="" name="toDate" type="text" id="toDate" value="<fmt:formatDate value="${leave.toDate}" type="date" pattern="yyyy-MM-dd"/>" readonly/>
						<span class='add-on' style="cursor: pointer;">
				           <i class='icon-calendar'></i>
				        </span>
					</div>
				</div>
		</c:if>
		          <c:if test="${leave.byWorkHours!=false}">
				<div class="control-group" id="toDateline" style="display:none">
					<label class="control-label"> <span><fmt:message key="saveleave.info.todate" /><!--To Date:--></span></label>
					<div class="controls input-append date" id="toDatetime" data-date-format="yyyy-MM-dd" style="display: block;">
						<input class="" name="toDate" type="text" id="toDate" value="<fmt:formatDate value="${leave.toDate}" type="date" pattern="yyyy-MM-dd"/>" readonly/>
						<span class='add-on' style="cursor: pointer;">
				           <i class='icon-calendar'></i>
				        </span>
					</div>
				</div>
		</c:if>
		</c:if>
		</div>
			
		<div class="control-group">
		<c:if test="${leave.id==null}">
			   <div class="control-group" id="durationline">	
					<label class="control-label"> <span><fmt:message key="saveleave.info.duration" /><!--Duration:--></span></label>
					<div class="controls">
					<input class="span12" name="duration" type="text" id="duration" value="0.0"/>				
					</div>
				</div>
		</c:if>
		 <c:if test="${leave.id!=null}"> 		
				 <c:if test="${leave.byWorkHours==false}">
		          <div class="control-group" id="durationline">	
					<label class="control-label"> <span><fmt:message key="saveleave.info.duration" /><!--Duration:--></span></label>
					<div class="controls">
					<input class="span12" name="duration" type="text" id="duration" value="${leave.duration}"/>				
					</div>
				</div>
		       </c:if>
		       <c:if test="${leave.byWorkHours!=false}">
		       <div class="control-group" id="durationline" style="display:none">	
					<label class="control-label"> <span><fmt:message key="saveleave.info.duration" /><!--Duration:--></span></label>
					<div class="controls">
					<input class="span12" name="duration" type="text" id="duration" value="${leave.duration}"/>				
					</div>
				</div>
		       </c:if>
		  </c:if>
    </div>
		
		 <div class="control-group">
		<c:if test="${leave.id==null}">
		<div class="control-group" id="fromLeaveTimeline" style="display:none">
				    <label class="control-label"> 
					<span><fmt:message key="saveleave.info.from" /><!--From:--></span>
					</label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="fromLeave" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" name="fromLeaveTime" type="text" id="fromLeaveTime" value="${leave.fromLeaveTime}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
						 </div>
				</c:if>
		 <c:if test="${leave.id!=null}"> 		
				 <c:if test="${leave.byWorkHours==false}">
				 <div class="control-group" id="fromLeaveTimeline" style="display:none">
				    <label class="control-label"> 
					<span><fmt:message key="saveleave.info.from" /><!--From:--></span>
					</label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="fromLeave" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" name="fromLeaveTime" type="text" id="fromLeaveTime" value="${leave.fromLeaveTime}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
						        </div>
						 	</c:if>
				<c:if test="${leave.byWorkHours!=false}">
				 <div class="control-group" id="fromLeaveTimeline" style="display:block">
				    <label class="control-label"> 
					<span><fmt:message key="saveleave.info.from" /><!--From:--></span>
					</label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="fromLeave" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" name="fromLeaveTime" type="text" id="fromLeaveTime" value="${leave.fromLeaveTime}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
						        </div>
						 	</c:if>
					 </c:if>
			</div>	 
						
				
		<div class="control-group">
		<c:if test="${leave.id==null}">
		<div class="control-group" id="toLeaveTimeline" style="display:none">
				    <label class="control-label"> 
					<span><fmt:message key="saveleave.info.to" /><!--To:--></span>
					</label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="toLeave" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" name="toLeaveTime" type="text" id="toLeaveTime" value="${leave.toLeaveTime}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
						 </div>
				</c:if>
		 <c:if test="${leave.id!=null}"> 		
				 <c:if test="${leave.byWorkHours==false}">
				 <div class="control-group" id="toLeaveTimeline" style="display:none">
				    <label class="control-label"> 
					<span><fmt:message key="saveleave.info.to" /><!--To:--></span>
					</label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="toLeave" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" name="toLeaveTime" type="text" id="toLeaveTime" value="${leave.toLeaveTime}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
						        </div>
						 	</c:if>
				<c:if test="${leave.byWorkHours!=false}">
				 <div class="control-group" id="toLeaveTimeline" style="display:block">
				    <label class="control-label"> 
					<span><fmt:message key="saveleave.info.to" /><!--To:--></span>
					</label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="fromLeave" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" name="toLeaveTime" type="text" id="toLeaveTime" value="${leave.toLeaveTime}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
						        </div>
						 	</c:if>
					 </c:if>
			</div>	 
				
			
		
		
				<div class="control-group">
							<label class="span4 checkbox inline"> 							
								<input type="checkbox" id="byWorkHours" value="true" 
									<c:if test="${leave.byWorkHours}">checked="checked"</c:if>>
							<span><fmt:message key="saveleave.info.byworkhours" /><!--By Work Hours--></span>
						    </label>	
				</div>		  
				  
				
				
			
	<div class='row-fluid'>
	<div class='span12'>
	<div class="control-group">
	   
					<label class="control-label"> <span><fmt:message key="saveleave.info.memo" /></span>
					</label>				
					<div class="controls">
						<textarea id="memo" name="memo" rows="4" class='span12'>${leave.memo}</textarea>
					</div>
				</div>
				</div>
							
		
	</div>
	
		<div class="row-fluid" id="savebutton">
		<c:if test="${leave.id==null}">
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
</div>