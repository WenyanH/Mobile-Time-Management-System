<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<script>
	$(document).ready(function(){
		position.initSavePage();
	});
	</script>
</head>



<div class='row-fluid' style="width: 505px;padding: 10px">	
<form id="positionForm" action='#' onsubmit="return false;"
	class="form form-horizontal form-left" style="margin-bottom: 0;"
	method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id"
		value="${position.id}" />
	<div class='row-fluid' style="height: 240px">
		<div id="alertMessage"></div>
		<div class='span12' style="margin:0px;">
			<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="saveposition.info.code" /> <!--Code:--></span>
				</label>
				<div class="controls">
					<input class="span12" name="code" type="text" id="code"
						value="${position.code}" maxlength="4" />

				</div>
			</div>

			<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="saveposition.info.name" /> <!--Name:--></span></label>
				<div class="controls">
					<input class="span12" name="name" type="text" id="name"
						value="${position.name}" maxlength="40" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="saveposition.info.status" /> <!--Status:--></span></label>
				<div class="controls">
					<label class="checkbox inline"> <c:if
							test="${position.id==null}">
							<input type="checkbox" id="status" value="true" checked="checked" disabled>
						</c:if> <c:if test="${position.id!=null}">
							<input type="checkbox" id="status" value="true"
								<c:if test="${position.active}">checked="checked"</c:if>>
						</c:if> <span><fmt:message key="global.info.active" /> <!--Active--></span>
					</label>
				</div>
			</div>


			<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="saveposition.info.punchcode" /> <!--Punch Code:--></span></label>
				<div class="controls">
					<input class="span12" name="punchCode" type="text" id="punchCode"
						value="${position.punchCode}" />
				</div>
			</div>


		</div>


	</div>

	<div class="row-fluid" id="savebutton">
		<c:if test="${position.id==null}">
			<label class="checkbox inline"> <input id="keepon"
				type="checkbox" value=""> <span><fmt:message
						key="global.info.keepon" /> <!--Keep on creating a new item.--></span>
			</label>
		</c:if>
		<button class="btn btn-warning pull-right" type="submit">
			<i class="icon-save"></i> <span><fmt:message
					key="global.info.save" /> <!--Save--></span>
		</button>
	</div>

</form>
</div>










