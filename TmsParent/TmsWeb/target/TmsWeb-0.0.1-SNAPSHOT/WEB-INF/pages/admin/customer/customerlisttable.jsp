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
					
					
					
						<table id="data-table-sort" style="margin-bottom: 0;" class="table table-bordered table-hover table-striped">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected"><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span><fmt:message key="customerlist.info.no" /><!--No.--></span></th>
									<th width="">
									<span><fmt:message key="customerlist.info.tradingname" /><!--Trading Name--></span></th>									
									<th width="">
									<span><fmt:message key="customerlist.info.licenses" /><!--Licenses--></span></th>
									<th width="">
									<span><fmt:message key="customerlist.info.createdon" /><!--Created On--></span></th>
									<th width="">
									<span><fmt:message key="customerlist.info.startedon" /><!--Started On--></span></th>
									<th width="">
									<span><fmt:message key="customerlist.info.closedon" /><!--Closed On--></span></th>
									<th width="">
									<span><fmt:message key="global.info.status" /><!--Status--></span></th>
									<th width="">
									<th width="130"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							
							<c:forEach var="customer" items="${customers}">
							
								<tr>
									<td><input type="checkbox" name="id" value="${customer.id}" /></td>
									<td>${customer.number}&nbsp;</td>
									<td>${customer.tradingName}&nbsp;</td>	
									<td>${customer.licenses}&nbsp;</td>
									<td><fmt:formatDate value="${customer.createdOn}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td><fmt:formatDate value="${customer.openedOn}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td><fmt:formatDate value="${customer.closedOn}" type="date" pattern="yyyy-MM-dd"/>&nbsp;</td>
									<td>${customer.status}&nbsp;</td>
									
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="customer.update('${customer.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span><fmt:message key="global.info.edit" /><!--Edit--></span>
											</a> 
											<a href="javascript:;" onclick="customer.bindingCompany('${customer.id}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span><fmt:message key="global.info.binding" /><!--Binding Company--></span>
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