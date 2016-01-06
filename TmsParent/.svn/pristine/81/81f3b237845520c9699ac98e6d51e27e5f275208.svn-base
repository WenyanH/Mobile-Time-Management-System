<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<style>
		#rules_table_wrapper .row-fluid{
			display:none;
		}
		#rules_table_wrapper th{
		 	color : #000000;
		}
		#rules_table_wrapper input{
		 	min-height: 22px;
		 	font-size: 12px;
		}
		#rules_table_wrapper button{
			line-height: normal;
		}
		#rules_table_wrapper .table th, #rules_table_wrapper .table td {
			padding:2px;
		}
		#addrules {
			padding: 0 4px;
		}
		
		#rules_table_wrapper .text-red{
			color : #b94a48 !important;
		}
		#rules_table_wrapper .red-border{
			border-color: #b94a48 !important;
		}
	</style>
	
	<script>
	$(document).ready(function(){
		timerounding.initSavePage();
	});
	</script>
</head>

<div class='row-fluid' style="width: 730px;padding: 10px">	
	<form id="timeroundingForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${timerounding.id}"/>
	<div class='row-fluid' style="height:305px">
			<div id="alertMessage"></div>
			<div class='span6' style="margin:0px;">
			
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savetimerounding.info.code" /><!--Code:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="code" type="text" id="code" value="${timerounding.code}" maxlength="4"/>
						
					</div>
				</div>
												
				<div class="control-group">
					<label class="control-label"><font color="red">*</font>
					<span><fmt:message key="savetimerounding.info.name" /><!--Name:--></span>
					</label>
					<div class="controls">
						<input class="span12" name="name" type="text" id="name" value="${timerounding.name}" maxlength="40"/>
						
					</div>
				</div>
	
	           <div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="savetimerounding.info.status" /> <!--Status:--></span></label>
				<div class="controls">
					<label class="checkbox inline"> 
					    <c:if
							test="${timerounding.id==null}">
							<input type="checkbox" id="active" value="true" checked="checked" disabled>
						</c:if> 
						<c:if test="${timerounding.id!=null}">
							<input type="checkbox" id="active" value="true"
								<c:if test="${timerounding.active}">checked="checked"</c:if>>
						</c:if> <span><fmt:message key="global.info.active" /> <!--Active--></span>
					</label>
				</div>
			</div>
				
				<div class="control-group">
					<label class="control-label"> <span><fmt:message key="savetimerounding.info.description" /></span></label>
					<div class="controls">
						<textarea id="description" name="description" rows="3" class='span12'>${timerounding.description}</textarea>
					</div>
				</div>	
				
			</div>	
			
			<div class='span6' style="margin-top:0px;">
				<div class='row-fluid'>
					<span><fmt:message key="savetimerounding.info.roundingrules" /></span>
					<div class="pull-right">
						<button id="addrules" class="btn btn-success" type="button" onclick=""><i class="icon-plus "></i></button>
					</div>
				</div>
				<div class='row-fluid'>
					<table class="table table-striped table-hover table-bordered" id="rules_table">
						<thead>
							<tr class="">
								<th width=""></th>
								<th width="30%">From</th>
								<th width="30%">To</th>
								<th width="30%">Value</th>
								<th width="10%">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="rule" items="${timerounding.rules}">	
								<tr class="">
									<td width="">${rule.orderNumber}</td>
									<td><input autocomplete="off" name="ruleFrom" type="text" class="span12 ruleFrom" value="${rule.fromTime}" onkeyup="timerounding.validateRules(this);"  onafterpaste="timerounding.validateRules(this);" maxlength="2"></th>
									<td><input autocomplete="off" name="ruleTo" type="text" class="span12 ruleTo" value="${rule.toT}" onkeyup="timerounding.validateRules(this);"  onafterpaste="timerounding.validateRules(this);" maxlength="2"></th>
									<td><input autocomplete="off" name="ruleValue" type="text" class="span12 ruleValue" value="${rule.value}" onkeyup="timerounding.validateRules(this);"  onafterpaste="timerounding.validateRules(this);" maxlength="2"></th>
									<td><button class="removerules" onclick="" type="button"><i class="icon-trash"></i></button></td>
								</tr>
							</c:forEach>
						</tbody>
						
						
					</table>
				</div>
			</div>
		
	</div>

	<div class="row-fluid" id="savebutton">
		<c:if test="${timerounding.id==null}">
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