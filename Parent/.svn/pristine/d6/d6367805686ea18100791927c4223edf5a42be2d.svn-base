<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<%@ taglib prefix="webpage" uri="/WEB-INF/tlds/pageview.tld"%>

<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="leave-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span><fmt:message key="leavelist.info.type" /><!--Pay Type--></span></th>
									<th width="">
									<span><fmt:message key="leavelist.info.employee" /><!--Employee--></span></th>
									<th width="">
									<span><fmt:message key="leavelist.info.description" /><!--Description--></span></th>									
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>				
								</tr>
							</thead>
							<tbody>
							<c:forEach var="leave" items="${leaves}">
								<tr>
									<td><input type="checkbox" name="id" value="${leave.id}" /></td>
									<td>${leave.payType.name}&nbsp;</td>	
									<td>${leave.employee.firstName},${leave.employee.lastName}&nbsp;</td>
									<td>${leave.description}&nbsp;</td>				
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="leave.update('${leave.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span><fmt:message key="global.info.edit" /><!--Edit--></span>
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