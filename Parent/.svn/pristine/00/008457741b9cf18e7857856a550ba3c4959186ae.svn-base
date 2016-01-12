<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<head>
	<link href="<webpath:path/>/resources/default/js/tms/admin/calculationscript/prettify.css" type="text/css" rel="stylesheet" />
	<script src="<webpath:path/>/resources/default/js/tms/admin/calculationscript/prettify.js" type="text/javascript"></script>
</head>
<style type="text/css">
        pre {
            white-space: pre-wrap; /* css-3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-word; /* Internet Explorer 5.5+ */
        }
</style>
<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
			<c:if test="${calculationscriptlog.scriptKey==null}">
				<span><fmt:message key="savecustomer.info.createcustomer" /></span>	
			</c:if>
			<c:if test="${calculationscriptlog.scriptKey!=null}">
				<span><fmt:message key="savecustomer.info.modifycustomer" /></span>						
			</c:if>
			</div>
		</div>
	</div>
</div>
	<form id="calculationscriptlogForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${calculationscriptlog.scriptKey}"/>
	<div id="alertMessage"></div>
	<div class='row-fluid' >
		<div class='span4' >
			<div class="portlet box green">
			
				<div class="portlet-title">
					<div class="caption"><i class="icon-briefcase"></i>CalculationScriptLog Info</div>
				</div>
			<div class="portlet-body">
			<div class='row-fluid'>
			<div class="control-group">
				<label class="control-label"><font color="red">*</font> <span>Title <!--Name:--></span></label>
				<div class="controls">
					<input class="span12" readonly name="title" type="text" value="${calculationscriptlog.title}" maxlength="40" />
				</div>
			</div>
			
			<div class='row-fluid'>
			<div class="control-group">
					<label class="control-label"> <span>Script Type</span></label>
					<div class="controls">
				<select id="diffPeriod" name="type" class="span12" data-placeholder=" " tabindex="1">
							<option value=""> </option>
							<c:forEach var="type" items="${types}">					
								<option value="${type}" <c:if test="${type==calculationscript.type}">selected</c:if>>${type.toString()}</option>						
							</c:forEach>
						</select>
				
				</div>
				</div>
			</div>
			<div class='row-fluid'>
			<div class="control-group">
					<label class="control-label"> <span>State</span></label>
					<div class="controls">
				<select id="diffPeriod" name="state" class="span12" data-placeholder=" " tabindex="1">
							<option value=""> </option>
							<c:forEach var="state" items="${states}">					
								<option value="${state}" <c:if test="${state==calculationscript.state}">selected</c:if>>${state.toString()}</option>						
							</c:forEach>
						</select>
				
				</div>
				</div>
			</div>
				<div class='row-fluid'>
					<div class='span12'>
						<div class="control-group">

							<label class="control-label"> <span><fmt:message key="leavelist.info.description" /><!--Description--></span>
							</label>
							<div class="controls">
								<textarea readonly  name="description" rows="4" class='span12'>${calculationscriptlog.description}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			 </div>
		 </div>
		<div class='span8'>
		<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption"><i class="icon-time"></i>Script Editor</div>
				</div>
				<div class="portlet-body">
					<div class='row-fluid'>
						<div class='span12 box' id="portlet-content">
						<pre class="prettyprint">${calculationscriptlog.scriptContext}</pre>
						</div>
					</div>
				</div>
		</div>
	</div>
	</div>
	<hr class="hr-normal"> 	
	<div class="row-fluid text-center" id="savebutton">
		<button class="btn btn-warning" onclick="history.back(-1)" type="button">
			<i class="icon-circle-arrow-left "></i>
			Back
		</button>
	</div>
</form>
<script>
	$(document).ready(function(){
		$("pre").addClass("prettyprint linenums");
		prettyPrint();
	});
	</script>
