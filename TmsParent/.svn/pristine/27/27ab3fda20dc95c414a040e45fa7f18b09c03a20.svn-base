<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
<link href="<webpath:path/>/resources/default/css/search.css"
	rel="stylesheet" type="text/css" />
<style>
.check {
	height: auto;
	width: auto;
	display: block;
}
</style>
<script>
	$(document).ready(function() {
		
		$(window).scroll(function() {
			var configscrolls = $(this).scrollTop();
			if (configscrolls > (document.body.scrollHeight - document.body.clientHeight - 140)) {
				$("#savebutton").removeClass("savebuttonfixed");
			} else {
				$("#savebutton").addClass("savebuttonfixed");
			}
			/* if (configscrolls > 214) {
				$("#companynavtabs").addClass("tabfixed");
				$("#companynavtabs").width($("#companyForm").width());
			} else {
				$("#companynavtabs").removeClass("tabfixed");
				$("#companynavtabs").width("");
			} */
		});

		window.onresize = function() {
			$("#savebutton").width($("#portlet-content").width()+2);
			//$("#companynavtabs").width($("#companyForm").width());
			resizeWindow();
		}
		$("#savebutton").width($("#portlet-content").width()+2);
		$("#savebutton").fadeIn("slow");
		
		$("select").select2({
			placeholder : "Select an option",
			allowClear : true
		});
	});
	function save(){
		Loading.start();
		PageCtrl.ajax({
			url : webPath + "/mydetail/save",
			data : $("#companyForm").serialize(),
			type : "post",
			dataType : "json",
			success : function(data) {
				Loading.stop();
				if (data.message=="success"){					
					argusAlertStrip("alertMessage","success"," Success");
				}else if (data.message == "exist"){
					argusAlertStrip("alertMessage","warning"," Warning: Code is exist.");
				}else {
					argusAlertStrip("alertMessage","error"," Error");
				}
			}
		});
	}
</script>

	<form id="companyForm" action="" class="form form-horizontal"  style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
           <input class="span12" name="id" type="hidden" id="id" value="${company.id}"/>
                  
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.no." /><!--No.:--></span></label>
						<div class="controls">
							 <input name="number" type="hidden"  value="${company.number}"/> 
							<span class="help-inline">${company.number}</span>
						</div>
					</div>
				</div>
				<div class="span6">	
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.numoflicense" /><!--Num of license:--></span></label>
						<div class="controls">
							 <input name="licenses" type="hidden"  value="${company.licenses}"/> 
							<span class="help-inline">${company.licenses}</span>
						</div>
					</div>
				</div>
			</div>
			
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.tradingname" /><!--Company Name:--></span></label>
						<div class="controls">
							<input name="tradingName" type="hidden"  value="${company.tradingName}"/> 
							<span class="help-inline">${company.tradingName}</span>
						</div>
					</div>
				</div>
				<div class="span6">	
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.domain" /><!--Domain:--></span></label>
						<div class="controls">
							<input name="domain" type="hidden"  value="${company.domain}"/> 
							<span class="help-inline">${company.domain}</span>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.token" /><!--Token:--></span></label>
						<div class="controls">
							<input class="span12" name="token" id="token" type="text"  value="${company.token}" />
						</div>
					</div>
				</div>
				<div class="span6">	
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.openedon" /><!--Opened on:--></span></label>
						<div class="controls">
							<input  type="hidden"  value="${company.openedOn}"/> 
							<span class="help-inline"><fmt:formatDate value="${company.openedOn}" type="date" pattern="yyyy-MM-dd"/></span>
						</div>
					</div>
				</div>
			</div>
			
			<hr class="hr-normal">
			
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.name" /><!--Name:--></span></label>
						<div class="controls">
							<input class="span12" name="name" type="text"  value="${company.name}"/>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.title" /><!--Title:--></span></label>
						<div class="controls">
							<input class="span12" name="title" type="text"  value="${company.title}" />
						</div>
					</div>
				</div>
			</div>
			
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.email" /><!--Email:--></span></label>
						<div class="controls">
							<input class="span12" name="email" id="email" type="text"  value="${company.email}" class="required email"/>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.mobile" /><!--Mobile:--></span></label>
						<div class="controls">
							<input class="span12" name="mobile" type="text"  value="${company.mobile}" />
						</div>
					</div>
				</div>
			</div>
			
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.phone" /><!--Phone:--></span></label>
						<div class="controls">
							<input class="span12" name="phone" id="phone" type="text"  value="${company.phone}"/>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.fax" /><!--Fax:--></span></label>
						<div class="controls">
							<input class="span12" name="fax" type="text"  value="${company.fax}" />
						</div>
					</div>
				</div>
			</div>
			<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label" for="physical"><span><fmt:message key="companyinfo.info.physical" /><!--Physical:--></span></label>
						<div class="controls">
							<input class="span12" id="physical" name="physicalAddr" type="text"  value="${company.physicalAddr}"/>
						</div>
					</div>
				</div>
				<div class="span6">
					<div class="control-group">
						<label class="control-label" for="postal"><span><fmt:message key="companyinfo.info.postal" /><!--Postal--></span></label>
						<div class="controls">
							<input class="span12" id="postal" name="postalAddr" type="text"  value="${company.postalAddr}"/>
						</div>
					</div>
				</div>
			</div>	
			
			<hr class="hr-normal">
			
			<%-- <div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.paygroup" /><!--Pay Group:--></span></label>
						<div class="controls">
							<select id="paygroup" name="paygroupId" class="span12" data-placeholder=" " tabindex="1" >
								<option value=""></option>
								<c:forEach var="payGroup" items="${payGroups}">
											<option value="${payGroup.id}" <c:if test="${payGroup.id==payGroupId}">selected='selected'</c:if>>${payGroup.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="span6">	
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.jobcode" /><!--Job Code:--></span></label>
						<div class="controls">
							<select  class="span12" name="jobId" data-placeholder=" " tabindex="2" >
								<option value=""></option>
								<c:forEach var="job" items="${jobs}">
											<option value="${job.id}" <c:if test="${job.id==jobId}">selected='selected'</c:if>>${job.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div> --%>
			
			<div class='row-fluid'>
				<div class="span6">
           			<div class="control-group">
						<label class="control-label"><span>Time Zone</span></label>
						<div class="controls">
							<select  class="span12" id="timeZoneId" name="timeZoneId" data-placeholder=" " tabindex="5" >
								<option value=""></option>
								<c:forEach var="timeZone" items="${timeZones}">
											<option value="${timeZone.id}" <c:if test="${timeZone.id==timeZoneId}">selected='selected'</c:if>>${timeZone.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
           		</div>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.schedule" /><!--Schedule:--></span></label>
						<div class="controls">
							<select  class="span12" data-placeholder=" " tabindex="3" >
								<option value=""></option>
							</select>
						</div>
					</div>
				</div>
				<%-- <div class="span6">	
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.position" /><!--Position:--></span></label>
						<div class="controls">
							<select  class="span12" name="positionId" data-placeholder=" " tabindex="4" >
								<option value=""></option>
								<c:forEach var="position" items="${positions}">
											<option value="${position.id}" <c:if test="${position.id==positionId}">selected='selected'</c:if>>${position.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div> --%>
			</div>

		 	<div class='row-fluid'>
				<div class="span6">
					<div class="control-group">
						<label class="control-label"><span><fmt:message key="companyinfo.info.timerounding" /><!--Time Rounding:--></span></label>
						<div class="controls">
							<select  class="span12" name="timeRoundingId" data-placeholder=" " tabindex="5" >
								<option value=""></option>
								<c:forEach var="timeRounding" items="${timeRoundings}">
											<option value="${timeRounding.id}" <c:if test="${timeRounding.id==timeRoundingId}">selected='selected'</c:if>>${timeRounding.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
              
			<div class="text-center row-fluid " id="savebutton" style="display: ">
			<button class="btn btn-warning" id="saveDiscovery"  type="button" onclick="save()">
				<i class="icon-save "></i>
				<span><fmt:message key="global.info.save" /><!--Save--></span>
			</button>
			</div>
	</form>
