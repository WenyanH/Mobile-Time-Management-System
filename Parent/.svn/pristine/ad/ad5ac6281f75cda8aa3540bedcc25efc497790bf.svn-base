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
			<span>Report</span>
			</div>
			<div class="pull-right"> 	
	            	<button id="inplaceediting-enable" class="btn btn-success" onclick="report.create();"><i class="icon-plus "></i> <span><fmt:message key="global.info.new" /><!--New--></span></button>
					<button id="inplaceediting-enable" class="btn btn-danger" onclick="report.remove();"><i class="icon-trash"></i> <span><fmt:message key="global.info.delete" /><!--Delete--></span></button>
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="report-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="report-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span>Type</span></th>									
									<th width="">
									<span>PayGroup<!--Start Date--></span></th>
									<th width="">
									<span>Paging By<!--Start Date--></span></th>
									<th width="">
									<span>Sort By<!--Start Date--></span></th>
									<th width="">
									<span>Update Time</span></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="report" items="${reports}">
								<tr>
									<td><input type="checkbox" name="id" value="${report.id}" /></td>
									<td>${report.reportType}&nbsp;</td>
									<td>${report.payGroupName}&nbsp;</td>	
									<td>${report.paging}&nbsp;</td>	
									<td>${report.sort}&nbsp;</td>	
									<td>${report.updateTime}&nbsp;</td>	
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="report.update('${report.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span>Edit</span>
											</a> 
											<a href="javascript:;" onclick="report.download('${report.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span>Download</span>
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


<script src="<webpath:path/>/resources/default/js/tms/admin/report/report.js" type="text/javascript"></script>




