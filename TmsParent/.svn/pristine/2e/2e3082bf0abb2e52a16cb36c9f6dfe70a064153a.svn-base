<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		holiday.initSavePage();
	});
	</script>
</head>
	
<div class='row-fluid' style="width: 505px;padding: 10px">	
	<form id="holidayForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${holiday.id}"/>
	<div class='row-fluid' style="height:200px">
			<div id="alertMessage"></div>
			<div class='span12' style="margin:0px;">
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="saveholiday.info.name" /><!--Name:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="name" type="text" id="name" value="${holiday.name}" maxlength="40"/>
						
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="saveholiday.info.date" /><!--Date:--></span></label>
					<div class="controls input-append date" id="datetime"  data-date="12-02-2012" data-date-format="dd-mm-yyyy" style="display: block;">
						<input name="date" type="text" id="date" value="<fmt:formatDate value="${holiday.date}" type="date" pattern="yyyy-MM-dd"/>" readonly/>
						<span class='add-on' style="cursor: pointer;">
				           <i class='icon-calendar'></i>
				        </span>
				        
					</div>
					
				</div>
				
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="saveholiday.info.alterdate" /><!--Alternative Date:--></span></label>
					<div class="controls input-append date" id="alterdatetime" data-date-format="yyyy-mm-dd" style="display: block;">
						<input class="" name="alterdate" type="text" id="alterdate" value="<fmt:formatDate value="${holiday.alterdate}" type="date" pattern="yyyy-MM-dd"/>" readonly/>
						<span class='add-on' style="cursor: pointer;">
				           <i class='icon-calendar'></i>
				        </span>
					</div>
				</div>				
	
				
			</div>
	
		
	</div>

	<div class="row-fluid" id="savebutton">
		<c:if test="${holiday.id==null}">
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