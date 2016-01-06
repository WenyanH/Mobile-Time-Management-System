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
			<span>Pay Card</span>
			</div>
			
			<div class="pull-right"> 	
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
												<select id="employeeId" name="employeeId" class="span12" data-placeholder=" " tabindex="1" onchange="paycard.changeEmployee(this.value)">
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
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="paycard-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="paycard-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width="">Employee</th>
									<th width="">From</th>
									<th width="">To</th>
									<th width="">Vaild</th>
									<th width="">Modified</th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="payCard" items="${payCards}">
								<tr>
									<td><input type="checkbox" name="id" value="${payCard.id}" /></td>
									<td>${payCard.employeeName}	&nbsp;</td>
									<td><fmt:formatDate value="${payCard.fromDate}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td><fmt:formatDate value="${payCard.toDate}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td style="text-align:center"> 
									<c:if test="${payCard.vaild}"><i class="icon-check"></i></c:if>
									<c:if test="${!payCard.vaild}"><i class="icon-check-empty "></i></c:if> 
									</td>
									<td style="text-align:center"> 
									<c:if test="${payCard.modified}"><i class="icon-check"></i></c:if>
									<c:if test="${!payCard.modified}"><i class="icon-check-empty "></i></c:if> 
									</td>
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="" class="btn btn-warning btn-mini"> 
												<i class="icon-time "></i> <span>Time Sheet</span>
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
	

<script src="<webpath:path/>/resources/default/js/tms/common/paycard.js" type="text/javascript"></script>


