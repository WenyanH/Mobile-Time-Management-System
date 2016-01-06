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
						<table style="margin-bottom: 0;" id="position-data-table" 
							class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck"><input type="checkbox" class="checkall" /></th>
									<th width="">
									<span><fmt:message key="global.info.code" /><!--Code--></span></th>
									<th width="">
									<span><fmt:message key="global.info.name" /><!--Name--></span></th>									
									<th width="">
									<span><fmt:message key="positionlist.info.punchcode" /><!--Punch Code--></span></th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="position" items="${positions}">
								<tr>
									<td><input type="checkbox" name="id" value="${position.id}" /></td>
									<td>${position.code}&nbsp;</td>
									<td>${position.name}&nbsp;</td>	
									<td>${position.punchCode}&nbsp;</td>
									<td>
									<c:if test="${position.active}"><i class="icon-check"></i></c:if>
									<c:if test="${!position.active}"><i class="icon-check-empty "></i></c:if> 
									<fmt:message key="global.info.active" />
									</td>	
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="position.update('${position.id}')" class="btn btn-warning btn-mini"> 
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