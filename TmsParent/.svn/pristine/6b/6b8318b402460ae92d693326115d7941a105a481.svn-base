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
	