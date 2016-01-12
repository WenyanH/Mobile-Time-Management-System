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
			<span>Payroll Transfer</span>
			</div>
			
			<div class="pull-right"> 	
					<button id="inplaceediting-enable" class="btn btn-success" onclick="payrolltransfer.opend()"><i class="icon-folder-open-alt "></i> <span>Open</span></button>
					<button id="inplaceediting-enable" class="btn btn-success" onclick="payrolltransfer.closed()"><i class="icon-folder-close-alt  "></i> <span>Close</span></button>
					<button id="inplaceediting-enable" class="btn btn-success" onclick="payrolltransfer.relcalculate()"><i class="icon-repeat "></i> <span>Relcalculate</span></button>
					
					<div class="btn-group">
						
						<button class="btn btn-success" id="searchEmployee" href="#" data-toggle="dropdown">
						<i class="icon-user"></i> 
						Employee
						<i class="icon-angle-down"></i>
						</button>
						<div class="dropdown-menu hold-on-click  pull-right">
							<form id="searchEmployeeForm" action='#' onsubmit="return false;" class="form form-horizontal form-left" style="margin: 5px;width:300px;" method="post" accept-charset="UTF-8">	
								<div class='row-fluid'>
									<div class='span12'>
										<div class="control-group">
											<label class="control-label">Employee : </label>
											<div class="controls">
												<select id="employeeId" name="employeeId" class="span12" data-placeholder=" " tabindex="1" onchange="payrolltransfer.changeEmployee(this.value)">
													<option value=""></option>
													<c:forEach var="user" items="${users}">
													<option value="${user.employeeId}">${user.firstName},${user.lastName}</option>
													</c:forEach>
												</select>							
											</div>
										</div>
									</div>
								</div>
								
								
							</form>	
						</div>
					</div>
					<button id="inplaceediting-enable" class="btn btn-success" onclick="location.href='<webpath:path/>/payrolltransfer/employees'"><i class="icon-circle-arrow-left"></i> <span>Back</span></button>
	            	<%-- <button id="inplaceediting-enable" class="btn btn-success" onclick="payrolltransfer.create();"><i class="icon-plus "></i> <span><fmt:message key="global.info.new" /><!--New--></span></button>
					<button id="inplaceediting-enable" class="btn btn-danger" onclick="payrolltransfer.remove();"><i class="icon-trash"></i> <span><fmt:message key="global.info.delete" /><!--Delete--></span></button> --%>
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="payrolltransfer-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="payrolltransfer-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width="">Employee</th>
									<th width=""><fmt:message key="global.info.code" /><!--Code--></th>
									<th width="">From</th>
									<th width="">To</th>
									<th width="">Closed</th>
									<th width="">Exported</th>
									
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="payrolltransfer" items="${payrollTransfers}">
								<tr>
									<td><input type="checkbox" name="id" value="${payrolltransfer.id}" /></td>
									<td>${payrolltransfer.employeeName}	&nbsp;</td>
									<td>${payrolltransfer.code}&nbsp;</td>
									<td>${payrolltransfer.fromDate}&nbsp;</td>
									<td>${payrolltransfer.toDate}&nbsp;</td>
									<td style="text-align:center"> 
									<c:if test="${payrolltransfer.isClosed}"><i class="icon-check"></i></c:if>
									<c:if test="${!payrolltransfer.isClosed}"><i class="icon-check-empty "></i></c:if> 
									</td>
									<td style="text-align:center"> 
									<c:if test="${payrolltransfer.isExported}"><i class="icon-check"></i></c:if>
									<c:if test="${!payrolltransfer.isExported}"><i class="icon-check-empty "></i></c:if> 
									</td>
									
									
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="payrolltransfer.paycard('${payrolltransfer.fromDate}','${payrolltransfer.toDate}')" class="btn btn-warning btn-mini"> 
												<i class=" icon-credit-card  "></i> <span>Pay Cards</span>
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
	

<script src="<webpath:path/>/resources/default/js/tms/common/payrolltransfer.js" type="text/javascript"></script>


