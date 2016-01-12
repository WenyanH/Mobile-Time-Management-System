<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		paytype.initSavePage();
	});
	</script>
</head>
	
<div class='row-fluid' style="width: 505px;padding: 10px">	
	<form id="paytypeForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${paytype.id}"/>
	<div class='row-fluid' style="height:200px">
			<div id="alertMessage"></div>
			<div class='span12' style="margin:0px;">
			
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savepaytype.info.code" /><!--Code:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="code" type="text" id="code" value="${paytype.code}" maxlength="3"/>
						
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savepaytype.info.name" /><!--Name:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="name" type="text" id="name" value="${paytype.name}"  maxlength="40"/>		        
					</div>					
				</div>
				
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savepaytype.info.exportcode" /><!--Export Code:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="exportCode" type="text" id="exportCode" value="${paytype.exportCode}" maxlength="20"/>		        
					</div>					
				</div>
							
				<div class="control-group">
					<label class="control-label"> 
					<span><fmt:message key="savepaytype.info.status" /><!--Status:--></span>
					</label>					
					
						<div class='row-fluid'>
						<div class="controls">
							<label class="span6 checkbox inline"> 	
							<c:if test="${paytype.id==null}">						
								<input type="checkbox" id="active" value="true" checked="checked" disabled>
								</c:if>
								<c:if test="${paytype.id!=null}">
								<input type="checkbox" id="active" value="true" 
									<c:if test="${paytype.active}">checked="checked"</c:if>>
									</c:if>
							<span><fmt:message key="global.info.active" /></span>
						   </label>
						<div class="controls">
							<label class="span6 checkbox inline"> 
								<input type="checkbox" id="leaveStatus" value="true"
									<c:if test="${paytype.leaveStatus}">checked="checked"</c:if>>
							 <span><fmt:message key="paytypelist.info.isleave" /></span>
						   </label>
						   </div>	
				       </div>					
			       </div>
		       </div>					
		       
		       <div class="control-group">
					<label class="control-label"> 
					<span><fmt:message key="savepaytype.info.ctday" /><!--Convert To Day:--></span>
					</label>	
					
					
                    <div class="controls">
                    
                    <input type="checkbox" id="convertToDay" value="true"
									<c:if test="${paytype.convertToDay}">checked="checked"</c:if>>
					
                   </div>					
			   </div>   
                 
                 
                 
               <div class="control-group">
					<label class="control-label">
					<span><fmt:message key="savepaytype.info.dailyhours" /><!--Daily Hours:--></span>
					</label>		
					<div class="controls">
					  <c:if test="${paytype.id==null}">	
						    <input class="span12" name="ctDay" type="text" id="ctDay" value=1.0 disabled/>
						    </c:if>
					        <c:if test="${paytype.id!=null}">    
					         <c:if test="${paytype.ctDay==0.0}">
					         <input class="span12" name="ctDay" type="text" id="ctDay" value=1.0 disabled/>
					          </c:if>		
					        <c:if test="${paytype.ctDay!=0.0}">
					         <input class="span12" name="ctDay" type="text" id="ctDay" value="${paytype.ctDay}" />						    
						    </c:if>		
						     </c:if>			
					
					</div>					
			   </div>
			
			
	    </div>

    </div>




	<div class="row-fluid" id="savebutton">
		<c:if test="${paytype.id==null}">
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