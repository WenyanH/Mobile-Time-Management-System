<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<head>
<%@include file="../../changemenu.jsp"%>

</head>

<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
			<span>CalculationScriptLog</span>
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="calculationscriptlog-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="calculationscriptlog-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span>Title<!--Title--></span></th>
									<th width="">
									<span>Type</span></th>	
									<th width="">
									<span>State</span></th>
									<th width="">
									<span>Company</span></th>								
									<th width="">
									<span>Description<!--Start Date--></span></th>
									<th width="">
									<span>Update Time</span></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="calculationscriptlog" items="${calculationscriptlogs}">
								<tr>
									<td><input type="checkbox" name="id" value="${calculationscriptlog.scriptKey}" /></td>
									<td>${calculationscriptlog.title}&nbsp;</td>
									<td>${calculationscriptlog.type}&nbsp;</td>	
									<td>${calculationscriptlog.state}&nbsp;</td>	
									<td>${calculationscript.companyName}&nbsp;</td>	
									<td>${calculationscriptlog.description}&nbsp;</td>	
									<td>${calculationscriptlog.updateTime}&nbsp;</td>	
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="calculationscriptlog.showlog('${calculationscriptlog.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span>Show</span>
											</a> 
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


<script src="<webpath:path/>/resources/default/js/tms/admin/calculationscriptlog/calculationscriptlog.js" type="text/javascript"></script>




