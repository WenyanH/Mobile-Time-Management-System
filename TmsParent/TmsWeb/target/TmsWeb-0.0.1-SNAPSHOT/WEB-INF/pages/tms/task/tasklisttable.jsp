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
						<table id="task-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>		
									<th width="">
									<span><fmt:message key="global.info.code" /><!--Code--></span></th>
									<th width="">
									<span><fmt:message key="global.info.name" /><!--Name--></span></th>	
									<th width="">
									<span><fmt:message key="global.info.punchcode" /><!--Punch Code--></span></th>		
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span></th>						
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>				
								</tr>
							</thead>
							<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td><input type="checkbox" name="id" value="${task.id}" /></td>		
									<td>${task.code}&nbsp;</td>
									<td>${task.name}&nbsp;</td>		
									<td>${task.punchCode}&nbsp;
									 <c:if test="${task.punchCode==''}">-</c:if>		
						             </td>		
						              <td><c:if test="${task.active}"><i class="icon-check"></i></c:if><c:if test="${!task.active}"><i class="icon-check-empty "></i></c:if> <fmt:message key="global.info.active" /></td>	
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="task.update('${task.id}')" class="btn btn-warning btn-mini"> 
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