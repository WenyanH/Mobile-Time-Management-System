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
						<table id="calculationscript-data-table" style="margin-bottom: 0;"
							class="table table-bordered table-hover table-striped" width="100%">
							<thead>
								<tr class="green-background">
									<th width="20" class="selected dataCheck" style="content:;"><input type="checkbox" class="checkall"/></th>
									<th width="">
									<span>Title<!--Title--></span></th>
									<th width="">
									<span>Type</span></th>
									<th width="">
									<span>State</span></th>
									<th width="">
									<span>Company</span></th>										
									<th width="">
									<span>Description<!--Start Date--></span></th>
									<th width="">
									<span>Update Time</span></th>
									<th width="120"><fmt:message key="global.info.operation" /><!-- Operation --></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="calculationscript" items="${calculationScripts}">
								<tr>
									<td><input type="checkbox" name="id" value="${calculationscript.scriptKey}" /></td>
									<td>${calculationscript.title}&nbsp;</td>
									<td>${calculationscript.type}&nbsp;</td>	
									<td>${calculationscript.state}&nbsp;</td>	
									<td>${calculationscript.companyName}&nbsp;</td>	
									<td>${calculationscript.description}&nbsp;</td>	
									<td>${calculationscript.updateTime}&nbsp;</td>	
									<td>
										<div class="text-left">
											<a href="javascript:;" onclick="calculationscript.update('${calculationscript.scriptKey}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span><fmt:message key="global.info.edit" /><!--Edit--></span>
											</a>
											<a href="javascript:;" onclick="calculationscript.showlog('${calculationscript.scriptKey}')" class="btn btn-warning btn-mini"> 
												<i class="icon-pencil "></i> <span>showlog<!--Edit--></span>
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