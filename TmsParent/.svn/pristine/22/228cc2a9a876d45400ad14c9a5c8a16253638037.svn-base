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
			<span><fmt:message key="global.info.sendreport.title" /><!--Jobs--></span>
			</div>
			
			<div class="pull-right"> 	
	            	<button id="inplaceediting-enable" class="btn btn-success" onclick="sendreport.create();"><i class="icon-plus "></i> <span><fmt:message key="global.info.new" /><!--New--></span></button>
					<button id="inplaceediting-enable" class="btn btn-danger" onclick="sendreport.remove();"><i class="icon-trash"></i> <span><fmt:message key="global.info.delete" /><!--Delete--></span></button>
			</div>
		</div>
	</div>
</div>


<div id="sendreport-table">
	<div class="row-fluid">
		<div style="margin-bottom: 0;"
			class="span12 box bordered-box green-border">

			<div class="box-content box-no-padding">
				<div class="responsive-table">
					<div class="scrollable-area">
						<table id="sendreport-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									
									<th width="">
									<span><fmt:message key="global.info.sendreport.reporttype" /><!--Code--></span></th>
									<th width="">
									<span><fmt:message key="global.info.sendreport.runattime" /><!--Name--></span></th>		
									<th width="">
									<span><fmt:message key="global.info.sendreport.sendto" /><!--Punch Code--></span></th>	
									<th width="">
									<span><fmt:message key="global.info.sendreport.frequency" /><!--Status--></span></th>							
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>				
								</tr>
							</thead>
							<tbody>
							<c:forEach var="sendreport" items="${sendreports}">
								<tr>
									<td><input type="checkbox" name="id" value="${sendreport.id}" /></td>						
									<td>${sendreport.reportType}&nbsp;</td>
									<td>${sendreport.runatTime}&nbsp;</td>
									<td>${sendreport.sendTo}&nbsp;									
									</td>		
									 <td>${sendreport.sendFrequency}&nbsp;</td>								
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="sendreport.update('${sendreport.id}')" class="btn btn-warning btn-mini"> 
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
</div>


<script src="<webpath:path/>/resources/default/js/tms/admin/sendreport/sendreport.js" type="text/javascript"></script>


