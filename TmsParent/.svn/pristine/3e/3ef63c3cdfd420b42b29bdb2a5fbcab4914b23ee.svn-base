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
						<table style="margin-bottom: 0;" id="holiday-data-table" 
							class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck"><input type="checkbox" class="checkall" /></th>
									<th width="">
									<span><fmt:message key="global.info.code" /><!--Code--></span></th>
									<th width="">
									<span><fmt:message key="global.info.name" /><!--Name--></span></th>									
									<th width="">
									<span><fmt:message key="holidaylist.info.date" /><!--Date--></span></th>
									<th width="">
									<span><fmt:message key="holidaylist.info.alterdate" /><!--Alternative Date--></span></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="holiday" items="${holidays}">
								<tr>
									<td><input type="checkbox" name="id" value="${holiday.id}" /></td>
									<td>${holiday.code}&nbsp;</td>
									<td>${holiday.name}&nbsp;</td>	
									<td><fmt:formatDate value="${holiday.date}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td><fmt:formatDate value="${holiday.alterdate}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="holiday.update('${holiday.id}')" class="btn btn-warning btn-mini"> 
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