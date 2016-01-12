<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<head>
<%@include file="../../changemenu.jsp"%>
	<script>
	$(document).ready(function(){
		
	});
	</script>
</head>

<form id="structureForm" action='#' onsubmit="return structure.update();" class="form form-horizontal form-left2"  method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${structure.id}"/>
	<div class='row-fluid' style="height:365px">
			<div id="alertMessage"></div>

<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
			<span><fmt:message key="structurelist.info.structure" /><!--Company Structure--></span>
			</div>
		</div>
	</div>
</div>

<div id="structure-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;" class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding" style="width:800px;margin-left:auto; margin-right: auto">
				<div class="">
					<div class="">
						<table id="holiday-data-table" style="margin-bottom: 0;"
							class="table  table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">		
									<th width="150">
									<span><fmt:message key="structurelist.info.level" /><!--Level--></span></th>									
									<th width="260">
									<span><fmt:message key="structurelist.info.name" /><!--Name--></span></th>
									<th width="180">
									<span>Time Zone</span>									
									</th>
									<th width="">
									<span><fmt:message key="structurelist.info.status" /><!--On/Off--></span>									
									</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="structure" items="${structures}">
								<tr class="structureTR">									
									
									<td>${structure.level}&nbsp;</td>	
                                     <td>	                                                                  
						            <input class="" name="labelName" id="labelName" style="margin-bottom: 0;" type="text" value="${structure.labelName}" maxlength="40"/>	
						            <input class="" name="id" id="id" style="margin-bottom: 0;" type="hidden" value="${structure.id}" maxlength="40"/>	
						            			           						               
				               		</td>
				               		<td>
				               			<select  class="span10" id="timeZone" name="timeZone" data-placeholder=" " tabindex="5" >
											<option value=""></option>
											<c:forEach var="timeZone" items="${timeZones}">
														<option value="${timeZone.id}" <c:if test="${timeZone.id==structure.timeZone.id}">selected='selected'</c:if>>${timeZone.name}</option>
											</c:forEach>
										</select>
				               		</td>
				               		<td>
						             	<div class='switch' data-off-label='<i class="icon-ban-circle"></i>' data-on-label='<i class="icon-ok"></i>' data-on='success'  data-off="warning">
				                            <input  name="isActive" type="checkbox" id="isActive<c:if test="${structure.level=='Position'}">Position</c:if>" value="true" <c:if test="${structure.isActive}">checked</c:if>  <c:if test="${structure.level=='Position'}">disabled="disabled"</c:if>>
				                        </div>
					                </td>									
								</tr>
								</c:forEach> 
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>

<div class="row-fluid text-center" id="savebutton" style="width:500px;margin-left:auto; margin-right: auto; margin-top:10px;">		
		<button class="btn btn-warning " type="submit">
			<i class="icon-save"></i> <span><fmt:message key="global.info.save" /><!--Save--></span>
		</button>
</div>	

<script src="<webpath:path/>/resources/default/js/tms/tmssetting/companystructure.js" type="text/javascript"></script>



