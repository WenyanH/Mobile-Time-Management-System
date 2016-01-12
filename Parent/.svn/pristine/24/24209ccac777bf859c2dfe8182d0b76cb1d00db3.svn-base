<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<div class='row-fluid' style="width: 505px;padding: 10px">	
<form id="userForm" action='#' onsubmit="return false;"
	class="form form-horizontal form-left" style="margin-bottom: 0;"
	method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id"
		value="${user.id}" />
	<div class='row-fluid' style="height: 60px">
		<div id="alertMessage"></div>
		<div class='span12' style="margin:0px;">
			<div class="control-group">
				<label class="control-label"> <span><fmt:message
							key="user.info.status" /> <!--Code:--></span>
				</label>
				<div class="controls">
				  <select id="status" name="status" class="span12"
							data-placeholder=" " tabindex="1">
							<c:forEach var="userStatus" items="${userStatus}">
								<option value="${userStatus}"
									<c:if test="${userStatus==user.status}">selected</c:if>>${userStatus}</option>
							</c:forEach>
						</select>

				</div>
			</div>
			
		</div>


	</div>

	<div class="row-fluid" id="savebutton" onclick="saveUserStatus();">
			<button class="btn btn-warning pull-right" type="submit">
				<i class="icon-save"></i>
				<fmt:message key="global.info.save" />
				<!--Save-->
			</button>
		</div>

</form>
</div>
<script>
function saveUserStatus(){
	if ($("#alertMessage").html()!="")
		$("#alertMessage").html("")
	Loading.start();

	PageCtrl.ajax({
		url : webPath + "/user/saveUserStatus",
		data : $("#userForm").serialize(),
		type : "post",
		dataType : "json",
		success : function(data) {
			Loading.stop();
			if (data.message=="success"){					
				argusAlertStrip("alertMessage","success"," Success");	
				$(".xubox_close").click();
				user.loaduser();
			}else {
				argusAlertStrip("alertMessage","error"," Error");
			}
			
		}
	});			
	
	return false;
}
</script>