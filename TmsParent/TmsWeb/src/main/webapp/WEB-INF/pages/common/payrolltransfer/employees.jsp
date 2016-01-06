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
	$("#employee-table-sort").dataTable({
	    bAutoWidth : true,
	    columnDefs:[{ 
	    	orderable:false,//禁用排序 
	    	targets:[8]   //指定的列 
		}],
		bStateSave : true
	});
})

</script>
</head>
<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
				<span>Please choose an employee.</span>		
			</div>
			
			
		</div>
	</div>
</div>
<div id="alertMessage"></div>	
<div id="employee-content">

<div id="employee-list" style="">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="employee-table-sort"  style="margin-bottom: 0;"
							class="table  table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="65" class="selected dataCheck">Photo</th>
									<th width="">
									<span><fmt:message key="employeelist.info.no" /><!--No.--></span></th>
									<th width="">
									<span>Name</span></th>									
									
									<th width="">
									<span><fmt:message key="employeelist.info.department" /><!--Department--></span></th>
									
									<th width="">
									<span><fmt:message key="employeelist.info.hireondate" /><!--Hire On Date--></span></th>
									<th width="">
									<span><fmt:message key="employeelist.info.terminatedate" /><!--Terminate Date--></span></th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span></th>			
										
									
									<th width="">
									<span><fmt:message key="employeelist.info.paygroup" /><!--Pay Group--></span></th>	
											
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --> 
									</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td height="60"><c:if test="${user.photo==null||user.photo==''}">
				    	<img src="<webpath:path/>/resources/default/images/user.png" class="res-icon-60" style="width: 60px;"/>
				    	</c:if>
				    	
				    	<c:if test="${user.photo!=null&&user.photo!=''}">
				    	<img src="data:image/png;base64,${user.photo}" style="width: 60px;" class="res-icon-60"/>
				    	</c:if></td>
									<td>${user.jobNumber}&nbsp;</td>
									<td>${user.firstName},${user.lastName}&nbsp;</td>	
									
									<td>${user.departmentName}&nbsp;</td>
									
									<td>${user.hireOnDateValue}&nbsp;</td>
									<td>${user.terminateDateValue}&nbsp;</td>		
									<td>
										<c:if test="${user.status=='Active'}">
										<span class="label label-success">${user.status}</span>
										</c:if>
										<c:if test="${user.status=='Closed'}">
										<span class="label label-important">${user.status}</span>
										</c:if>
										<c:if test="${user.status=='Inactive'}">
										<span class="label label-warning">${user.status}</span>
										</c:if>
									</td>				
									
																								
									
									<td>${user.payGroupName}&nbsp;</td>
									
									<td>
										<div class="text-left">
											<a href="<webpath:path/>/payrolltransfer/list?employeeId=${user.employeeId}" class="btn btn-warning btn-mini"> 
												<i class=" icon-money "></i>
												<span>Payroll Transfer</span>												
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
</div>



