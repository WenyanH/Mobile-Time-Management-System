<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		payrolltransfer.initSavePage();
	});
	</script>
</head>



<div class='row-fluid' style="width: 505px;padding: 10px">	
<form id="payrolltransferForm" action='#' onsubmit="return false;" class="form form-horizontal form-horizontal2" style="margin-bottom: 0;"
	method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${payrollTransfer.id}" />
	<div class='row-fluid'style="height:200px">
		<div id="alertMessage"></div>

		<div class='row-fluid'>
			<div class='span12'>
				<div class="control-group">
					<label class="control-label"><font color="red">*</font> <span><fmt:message key="savepaygroup.info.code" /></span>
					</label>
					<div class="controls">
						<input class="span12" name="code" type="text" id="code"
							value="${payrollTransfer.code}" maxlength="3"/>
					</div>
				</div>
			</div>
		</div>
		<div class='row-fluid'>
			<div class='span12'>
				<div class="control-group">
					<label class="control-label">Employee</label>
					 <div class="controls">
					 	<select id="status" name="employee" class="span12" data-placeholder=" " tabindex="1" >
					 		<option value="" > </option>
							<c:forEach var="user" items="${users}">									
								<option value="${user.employeeId}" <c:if test="${user.employeeId==payrollTransfer.employee}">selected</c:if>>${user.firstName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class='row-fluid'>
			<div class='span12'>
				<div class="control-group">
					<label class="control-label"><font color="red">*</font><span>From</span></label>
							<div class="controls " >
								<div class="checkbox inline input-append date" id="from" data-date-format="yyyy-MM-dd" style="padding: 0;">
									<input class="input_cursor_pointer" style="width:100px;" id="fromValue" name="fromDate" type="text"  value="${payrollTransfer.fromDate}" readonly/>
									<span class='add-on' style="cursor: pointer;">
							            <i class='icon-calendar'></i>
							        </span>
						        </div>
							</div>
						</div>
			</div>
		</div>
		<div class='row-fluid'>
			<div class='span12'>
				<div class="control-group">
					<div class="control-group">
						<label class="control-label"><font color="red">*</font><span>TO</span></label>
						<div class="controls">
							<div class="checkbox inline input-append date" id="to" data-date-format="HH:mm" style="padding: 0;">
								<input class="input_cursor_pointer" style="width:100px;" id="toValue" name="toDate" type="text" value="${payrollTransfer.toDate}" readonly/>
								<span class='add-on' style="cursor: pointer;">
						           <i class='icon-calendar'></i>
						        </span>
					        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='row-fluid'>
			<div class='span12'>
				<div class="control-group">
					<label class="control-label"> <span>isClosed</span></label>
					<div class="controls">
						<label class="checkbox inline"> <c:if
								test="${payrollTransfer.id==null}">
								<input type="checkbox" name="isClosed"   disabled>
							</c:if> <c:if test="${payrollTransfer.id!=null}">
								<input type="checkbox" name="isClosed"  <c:if test="${payrollTransfer.isClosed}">checked</c:if>>
							</c:if> 
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class='row-fluid'>
			<div class='span12'>
				<div class="control-group">
					<label class="control-label"> <span>isExported</span></label>
					<div class="controls">
						<label class="checkbox inline"> <c:if test="${payrollTransfer.id==null}">
								<input type="checkbox" name="isExported"  checked >
							</c:if> <c:if test="${payrollTransfer.id!=null}">
								<input type="checkbox" name="isClosed"  <c:if test="${payrollTransfer.isExported}">checked</c:if>>
							</c:if> 
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row-fluid" id="savebutton">
		<c:if test="${payrollTransfer.id==null}">
			<label class="checkbox inline"> <input id="keepon"
				type="checkbox" value=""> <span><fmt:message key="global.info.keepon" /></span>
			</label>
		</c:if>
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <span><fmt:message
					key="global.info.save" /> <!--Save--></span>
		</button>
	</div>

</form>

</div>
