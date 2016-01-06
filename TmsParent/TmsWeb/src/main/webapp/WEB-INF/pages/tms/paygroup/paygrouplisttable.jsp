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
						<table id="paygroup-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width=""><fmt:message key="global.info.code" /><!--Code--></th>
									<th width=""><fmt:message key="global.info.name" /><!--Name--></th>									
									<th width=""><fmt:message key="paygrouplist.info.dailyHours" /></th>
									<th width=""><fmt:message key="paygrouplist.info.createdOn" /></th>
									<th width=""><fmt:message key="paygrouplist.info.validators" /></th>
									<th width=""><fmt:message key="global.info.status" /></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="paygroup" items="${paygroups.records}">
								<tr>
									<td><input type="checkbox" name="id" value="${paygroup.id}" /></td>
									<td>${paygroup.code}&nbsp;</td>
									<td>${paygroup.name}&nbsp;</td>
									<td>${paygroup.dailyHours}&nbsp;</td>
									<td><fmt:formatDate value="${paygroup.createdOn}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td>
										<div class="row-fluid">
											<div class="span4"><c:if test="${paygroup.acceptEA}"><i class="icon-check"></i></c:if><c:if test="${!paygroup.acceptEA}"><i class="icon-check-empty "></i></c:if> <fmt:message key="paygrouplist.info.acceptEA" /></div>
											<div class="span4"><c:if test="${paygroup.acceptLD}"><i class="icon-check"></i></c:if><c:if test="${!paygroup.acceptLD}"><i class="icon-check-empty "></i></c:if> <fmt:message key="paygrouplist.info.acceptLD" /></div>
											<div class="span4"><c:if test="${paygroup.checkLA}"><i class="icon-check"></i></c:if><c:if test="${!paygroup.checkLA}"><i class="icon-check-empty "></i></c:if> <fmt:message key="paygrouplist.info.checkLA" /></div>
										</div>
										<div class="row-fluid">
											<div class="span4"><c:if test="${paygroup.checkED}"><i class="icon-check"></i></c:if><c:if test="${!paygroup.checkED}"><i class="icon-check-empty "></i></c:if> <fmt:message key="paygrouplist.info.checkED" /></div>
											<div class="span8"><c:if test="${paygroup.supervisorMAOT}"><i class="icon-check"></i></c:if><c:if test="${!paygroup.supervisorMAOT}"><i class="icon-check-empty "></i></c:if> <fmt:message key="paygrouplist.info.supervisorMAOT" /></div>
										</div>
										
									</td>
																			
									<td><c:if test="${paygroup.active}"><i class="icon-check"></i></c:if><c:if test="${!paygroup.active}"><i class="icon-check-empty "></i></c:if> <fmt:message key="global.info.active" /></td>
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="paygroup.update('${paygroup.id}')" class="btn btn-warning btn-mini"> 
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
	