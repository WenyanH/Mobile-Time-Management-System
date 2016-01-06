<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
<script>
	$(document).ready(function() {
		report.initSavePage();
	});
</script>
</head>
<div class='row-fluid' style="width: 505px; padding: 10px">
	<form id="reportForm" action='#' onsubmit="return false;"
		class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
		<input class="span12" name="id" type="hidden" id="id" value="${report.id}" />
		<div class='row-fluid' style="height: 380px">
			<div id="alertMessage"></div>

			<div class='span12' style="margin: 0px;">

				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span>Report Type</span>
					</label>
					<div class="controls">
						<select  name="reportType" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<c:forEach var="reportType" items="${reportTypeList}">
								<option value="${reportType}"
									<c:if test="${report.reportType==reportType}">selected</c:if>>${reportType.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span>Pay Group</span></label>
					<div class="controls">
						<select  name="payGroupId" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<c:forEach var="payGroup" items="${payGroupList}">
								<option value="${payGroup.id}"
									<c:if test="${payGroup.id==report.payGroupId}">selected</c:if>>${payGroup.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>


				<div class="control-group">
					<label class="control-label"> <span>Paging By</span></label>
					<div class="controls">
						<select name="paging" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<c:forEach var="paging" items="${pagingList}">
								<option value="${paging}"
									<c:if test="${paging==report.paging}">selected</c:if>>${paging}</option>
							</c:forEach>
						</select>
					</div>
				</div>


				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span>Sort By</span></label>
					<div class="controls">
						<select name="sort" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<c:forEach var="sort" items="${sortList}">
								<option value="${sort}"
									<c:if test="${sort==report.sort}">selected</c:if>>${sort}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid" id="savebutton">
			<c:if test="${report.id==null}">
				<label class="checkbox inline"> <input id="keepon"
					type="checkbox" value=""> <span><fmt:message
							key="global.info.keepon" />
						<!--Keep on creating a new item.--></span>
				</label>
			</c:if>
			<button class="btn btn-warning pull-right" type="submit">
				<i class="icon-save"></i> <span><fmt:message
						key="global.info.save" />
					<!--Save--></span>
			</button>
		</div>

	</form>
</div>