<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<head>
	
	<script src="<webpath:path/>/resources/default/js/tms/admin/calculationscript/calculationscript.js" type="text/javascript"></script>
	
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
			<c:if test="${calculationscript.scriptKey==null}">
				<span><fmt:message key="savecustomer.info.createcustomer" /></span>	
			</c:if>
			<c:if test="${calculationscript.scriptKey!=null}">
				<span><fmt:message key="savecustomer.info.modifycustomer" /></span>						
			</c:if>
			</div>
		</div>
	</div>
</div>
	<form id="calculationscriptForm" action='#' onsubmit="return false;" class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="scriptKey" type="hidden" id="id" value="${calculationscript.scriptKey}"/>
	<input class="span12" name="companyId"  type="hidden" value="${companyId}"/>
	<input class="span12" name="scriptContext" type="hidden" id="scriptContext" value="${calculationscript.scriptContext}"/>
	<div id="alertMessage"></div>
	<div class='row-fluid' >
		<div class='span4' >
			<div class="portlet box green">
			
				<div class="portlet-title">
					<div class="caption"><i class="icon-briefcase"></i>CalculationScript Info</div>
				</div>
			<div class="portlet-body">
			<div class='row-fluid'>
			<div class="control-group">
				<label class="control-label"><font color="red">*</font> <span>Title <!--Name:--></span></label>
				<div class="controls">
					<input class="span12" name="title" type="text" value="${calculationscript.title}" maxlength="40" />
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
								<textarea  name="description" rows="4" class='span12'>${calculationscript.description}</textarea>
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
					<div class="caption"><i class="icon-time"></i>Script Editor ${calculationscript.scriptContext}</div>
				</div>
				<div class="portlet-body">
					<div class='row-fluid'>
						<div class='span12 box' id="portlet-content">
						
						
<textarea id="codepress2"  class="codepress javascript linenumbers-off span12" style="height:300px;" wrap="off">
${calculationscript.scriptContext}
</textarea>
						</div>
					</div>
				</div>
		</div>
	</div>
	</div>
	<hr class="hr-normal"> 	
	<div class="row-fluid text-center" id="savebutton">
		<c:if test="${calculationscript.scriptKey==null}">
		<button class="btn btn-warning " id="keepon" type="button" onclick="calculationscript.saveAndContinue()">
			<i class="icon-save"></i> Save and continue to create
		</button>
		</c:if>
		<button class="btn btn-warning " type="submit">
			<i class="icon-save"></i> <fmt:message key="global.info.save" /><!--Save-->
		</button>
		
		<button class="btn btn-warning" onclick="calculationscript.backList('${companyId}')" type="button">
			<i class="icon-circle-arrow-left "></i>
			Back
		</button>
	</div>
</form>
<script src="<webpath:path/>/resources/default/js/plugins/codepress/codepress.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		calculationscript.initSavePage();
		setTimeout("codepress2.toggleAutoComplete()",500);
	});
	</script>
