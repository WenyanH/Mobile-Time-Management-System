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
						<table id="paytype-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									
									<th width="">
									<span><fmt:message key="global.info.code" /><!--Code--></span></th>
									<th width="">
									<span><fmt:message key="global.info.name" /><!--Name--></span></th>									
									<th width="">
									<span><fmt:message key="paytypelist.info.exportcode" /><!--Export Code--></span></th>
									<th width="">
									<span><fmt:message key="paytypelist.info.ctday" /><!--Daily Hours--></span></th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="paytype" items="${paytypes}">
								<tr>
									<td><input type="checkbox" name="id" value="${paytype.id}" /></td>							
									<td>${paytype.code}&nbsp;</td>
									<td>${paytype.name}&nbsp;</td>	
									<td>${paytype.exportCode}&nbsp;</td>						
						            </td>
						            <td>
									<c:if test="${paytype.ctDay==0.0}">
						            -</c:if>
						            <c:if test="${paytype.ctDay!=0.0}">${paytype.ctDay}</c:if>
									</td>
									<td>													
									<div class="span4"><c:if test="${paytype.active}"><i class="icon-check"></i></c:if>
									<c:if test="${!paytype.active}"><i class="icon-check-empty "></i></c:if>
									<fmt:message key="global.info.active" /></div>
									
									<div class="span4"><c:if test="${paytype.leaveStatus}"><i class="icon-check"></i></c:if>
									<c:if test="${!paytype.leaveStatus}"><i class="icon-check-empty "></i></c:if> 
									<fmt:message key="paytypelist.info.isleave" /></div> 									
									</td>	
									
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="paytype.update('${paytype.id}')" class="btn btn-warning btn-mini"> 
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
