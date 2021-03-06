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
				<span>Staff</span>				
			</div>
			<div class="pull-right"> 	
	            	<button id="inplaceediting-enable" class="btn btn-success" onclick="staff.create();"><i class="icon-plus "></i> 
	            	<span><fmt:message key="global.info.new" /><!--New--></span>
	            	</button>
					<button  id="user_delete_list" class="btn btn-danger" onclick="staff.remove();"><i class="icon-trash"></i>
					 <span><fmt:message key="global.info.delete" /><!--Delete--></span>
					</button>
					
			</div>
		</div>
	</div>
</div>
<div id="alertMessage"></div>	

<div id="user-list" >
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="user-table-sort" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="" class="selected dataCheck" ><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span><fmt:message key="userlist.info.email" /><!--Email--></span>
									</th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span>
									</th>
									<th width=""><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${users}">
								<tr>
									<td><input type="checkbox" name="id" value="${user.id}" /></td>
									<td>${user.email}&nbsp;</td>
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
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="staff.update('${user.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> 
												<span><fmt:message key="global.info.edit" /><!--Edit--></span>
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
<script src="<webpath:path/>/resources/default/js/tms/admin/staff/staff.js" type="text/javascript"></script>

