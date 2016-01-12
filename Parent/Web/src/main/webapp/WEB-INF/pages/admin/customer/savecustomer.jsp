
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<head>
	<link href="<webpath:path/>/resources/default/css/error.css" media="all" rel="stylesheet" type="text/css" />
	<script src="<webpath:path/>/resources/default/js/tms/admin/customer.js" type="text/javascript"></script>
</head>

<div class='row-fluid'>
	<div class='span12'>
		<div class='page-header'>
			<div class='pull-left title'>
			<c:if test="${customer.id==null}">
				<span><fmt:message key="savecustomer.info.createcustomer" /></span>	
			</c:if>
			<c:if test="${customer.id!=null}">
				<span><fmt:message key="savecustomer.info.modifycustomer" /></span>						
			</c:if>
			</div>
		</div>
	</div>
</div>


	<form id="customerForm" action='#' onsubmit="return false;" class="form form-horizontal form-horizontal2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
	<input class="span12" name="id" type="hidden" id="id" value="${customer.id}"/>
	<div class='row-fluid'  style="height:415px" >
	<div id="alertMessage"></div>	
	
	<div class='row-fluid' >	
		<div class="span4 ">
			<!-- BEGIN Portlet PORTLET-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption"><i class="icon-briefcase"></i><fmt:message key="saveemployee.info.companyinfo" /><!--Company Info--></div>
				</div>
				<div class="portlet-body">
					<div class='row-fluid'>
						<div class='span12 box'>
				           
							<div class="control-group">
								<label class="control-label"><font color="red">*</font><fmt:message key="saveemployee.info.no" /><!--No.:--></label>
								<div class="controls">
									<input class="span12" name="number" type="text" id="number" <c:if test="${customer.id!=null}">disabled</c:if> value="${customer.number}" maxlength="6"/>
								</div>
							</div>
						
							<div class="control-group">
								<label class="control-label"><fmt:message key="saveemployee.info.status" /><!--Status:--></label>
								 <div class="controls">
								 	<select id="status" name="status" class="span12" data-placeholder=" " tabindex="1" >
										<c:forEach var="status" items="${customerStatus}">									
											<option value="${status}" <c:if test="${status==customer.status}">selected</c:if>>${status}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group">
							 	<label class="control-label"><font color="red">*</font><fmt:message key="savecustomer.info.tradingname" /></label>
								<div class="controls">
									<input class="span12" name="tradingName" type="text" id="tradingName" value="${customer.tradingName}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><fmt:message key="savecustomer.info.pause" /></label>
								<div class="controls">
									<label class="checkbox inline">
									<input type="checkbox" name="pause" id="pause" <c:if test="${customer.pause}">checked</c:if>/>
									</label>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font><fmt:message key="savecustomer.info.licenses" /></label>
								<div class="controls">
									<input class="span12"  name="licenses"   type="text" id="licenses" value="${customer.licenses}" />
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font>
								<fmt:message key="savecustomer.info.openedon" /><!--Hire on:--></label>
								<div class="controls input-append date" id="openedOn" data-date-format="yyyy-MM-dd" style="display: block;">
									<input class="input_cursor_pointer"  id="openedOnValue"  name="openedOn" style="width:100px;" type="text" value="<fmt:formatDate value="${customer.openedOn}" type="date" pattern="yyyy-MM-dd"/>"/>
								    <span class='add-on' style="cursor: pointer;">
							           <i class='icon-calendar'></i>
							        </span>		
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font>
								<fmt:message key="savecustomer.info.closedon" /><!--terminateDate-->
								</label>
								<div class="controls input-append date" id="closedOn" data-date-format="yyyy-MM-dd" style="display: block;">
									<input class="input_cursor_pointer" id="closedOnValue" name="closedOn" type="text" style="width:100px;" value="<fmt:formatDate value="${customer.closedOn}" type="date" pattern="yyyy-MM-dd"/>" />
								    <span class='add-on' style="cursor: pointer;">
							           <i class='icon-calendar'></i>
							        </span>		
								</div>
							</div>
								
							<div class="control-group">
								<label class="control-label"><fmt:message key="savecustomer.info.features" /></label>
								<div class="controls">
									<label class="checkbox inline">
									<c:if test="${customer.id==null}">
									<input type="checkbox" name="payrollEnabled"  id="payrollEnabled" value="true" checked>
									</c:if>
									<c:if test="${customer.id!=null}">
									<input type="checkbox" name="payrollEnabled"  id="payrollEnabled" value="true" <c:if test="${customer.payrollEnabled}">checked</c:if>>
									</c:if> <fmt:message key="savecustomer.info.payroll" /><!--Payroll Enabled-->
									</label>
									
									<label class="checkbox inline">
									<c:if test="${customer.id==null}">
									<input type="checkbox" name="teamEnabled" id="teamEnabled" value="true" checked>
									</c:if>
									<c:if test="${customer.id!=null}">
									<input type="checkbox" name="teamEnabled" id="teamEnabled" value="true" <c:if test="${customer.teamEnabled}">checked</c:if>>
									</c:if><fmt:message key="savecustomer.info.team" /><!--Team Supported--> 
									</label>
								</div>
	
							</div>
							
							
					    </div>
					</div>
				</div>
			</div>
			<!-- END Portlet PORTLET-->
		</div>
		
		<div class="span4 ">
			<!-- BEGIN Portlet PORTLET-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption"><i class="icon-user"></i><fmt:message key="savecustomer.info.contact" /></div>
				</div>
				<div class="portlet-body">
					<div class='row-fluid'>
						<div class='span12 box'>
				            <div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.name" /><!--name--></label>
								<div class="controls">
									<input class="span12" name="name" type="text" id="name" value="${customer.name}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.title" /><!--Title:-->
								</label>
								<div class="controls">
									<input class="span12" name="title" type="text" id="title" value="${customer.title}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font>
								<fmt:message key="saveemployee.info.email" /><!--email--></label>
								<div class="controls">
									<input class="span12" name="email" type="text" id="email" value="${customer.email}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.mobile" /><!--mobile:-->
								</label>
								<div class="controls">
									<input class="span12" name="mobile" type="text" id="mobile" value="${customer.mobile}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.phone" /><!--phone--></label>
								<div class="controls">
									<input class="span12" name="phone" type="text" id="phone" value="${customer.phone}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.fax" /><!--fax:-->
								</label>
								<div class="controls">
									<input class="span12" name="fax" type="text" id="fax" value="${customer.fax}"/>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.physical" /><!--Physical:--></label>
								<div class="controls">
								<input class="span12" name="physicalAddr" type="text" id="physicalAddr" value="${customer.physicalAddr}"/>
								</div>
							</div>
									
							<div class="control-group">
								<label class="control-label">
								<fmt:message key="saveemployee.info.postal" /><!--postalAddr-->
								</label>
								<div class="controls">
								<input class="span12" name="postalAddr" type="text" id="postalAddr" value="${customer.postalAddr}"/>	
								</div>
							</div>		
					    </div>
					</div>
				</div>
			</div>
			<!-- END Portlet PORTLET-->
		</div>
		
		<div class="span4 ">
			<!-- BEGIN Portlet PORTLET-->
			<div class="portlet box green">
				<div class="portlet-title">
					<div class="caption"><i class="icon-time"></i><fmt:message key="savecustomer.info.timemanagement" /></div>
				</div>
				<div class="portlet-body">
					<div class='row-fluid'>
						<div class='span12 box'>
				            <div class="control-group">
								<label class="control-label"><font color="red">*</font><span><fmt:message key="savecustomer.info.daybegin" /></span></label>
								<div class="controls " >
									<div class="checkbox inline input-append date" id="dayBegin" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" id="dayBeginValue" name="dayBegin" type="text"  value="${customer.dayBegin}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
							        
									<label class="checkbox inline">
									<input type="checkbox" name="perviousDay" id="perviousDay"  <c:if test="${customer.perviousDay}">checked</c:if>> perviousDay
									</label>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font><span><fmt:message key="savecustomer.info.dayend" /></span></label>
								<div class="controls">
									<div class="checkbox inline input-append date" id="dayEnd" data-date-format="HH:mm" style="padding: 0;">
										<input class="input_cursor_pointer" style="width:50px;" id="dayEndValue" name="dayEnd" type="text" value="${customer.dayEnd}" readonly/>
										<span class='add-on' style="cursor: pointer;">
								           <i class='icon-time'></i>
								        </span>
							        </div>
							        <label class="checkbox inline">
										<input type="checkbox" name="nextDay" id="nextDay"  <c:if test="${customer.nextDay}">checked</c:if>> <fmt:message key="savecustomer.info.nextday" />
									</label>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font><span><fmt:message key="savecustomer.info.timezone" /></span></label>
								<div class="controls">
									<select name="timeZoneId" id="timeZoneId" class="span12" data-placeholder=" " tabindex="1" >
										<option value=""></option>
										<c:forEach var="timeZone" items="${timeZones}">
											<option value="${timeZone.id}" <c:if test="${timeZone.id==customer.timeZone.id}">selected='selected'</c:if>>${timeZone.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><font color="red">*</font><span><fmt:message key="savecustomer.info.token" /></span></label>
								<div class="controls">
									<input class="span12" name="token" type="text" id="token" value="${customer.token}" />
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><span><fmt:message key="savecustomer.info.outfacetype" /></span></label>
								<div class="controls">
									<select name="outFaceTypeId" id="outfaceType" class="span12" data-placeholder=" " tabindex="1" >
										<option value=""></option>
										<c:forEach var="ot" items="${outFace}">
											<option value="${ot.id}" <c:if test="${ot.id==outFaceTypeId}">selected='selected'</c:if>>${ot.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><span><fmt:message key="savecustomer.info.otheroutfacetype" /></span></label>
								<div class="controls">
									<select name="otherOutFaceTypeId" id="otherOutfaceType" class="span12" data-placeholder=" " tabindex="1" >
										<option value=""></option>
										<c:forEach var="oot" items="${otherOutFace}">
											<option value="${oot.id}" <c:if test="${oot.id==otherOutFaceTypeId}">selected='selected'</c:if>>${oot.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><span><fmt:message key="savecustomer.info.reportmanagement" /></span></label>
								<div class="controls">
									<select name="reportManagementIds" id="reportManagement" multiple="multiple" class="" >
										<c:forEach var="reportManagement" items="${reportManagements}">
											<option value="${reportManagement.id}" 
												<c:forEach var="selectreportManagement" items="${customer.reportManagements}">
										 			<c:if test="${reportManagement.id==selectreportManagement.id}">selected='selected'</c:if>
												</c:forEach>
											>${reportManagement.name}</option>		
										</c:forEach>
									</select>
								</div>
							</div>
							
							<div class="control-group">
								<label class="control-label"><fmt:message key="savecustomer.info.features" /></label>
								<div class="controls">
									<select name="featuresIds" id="featuresIds" multiple="multiple" class="" >
										<c:forEach var="feature" items="${features}">
											<option value="${feature.id}" 
												<c:forEach var="customerfeatures" items="${customer.features}">
										 			<c:if test="${customerfeatures.id==feature.id}">selected='selected'</c:if>
												</c:forEach>
											>${feature.name}</option>
										</c:forEach>
									</select>
									
									
								</div>
							</div>
							
					    </div>
					</div>
				</div>
			</div>
			<!-- END Portlet PORTLET-->
		</div>
	</div>
	
	

	<hr class="hr-normal"> 	
	<div class="row-fluid text-center" id="savebutton">
		
		<c:if test="${customer.id==null}">
		<button class="btn btn-warning " type="button" onclick="customer.saveAndContinue()">
			<i class="icon-save"></i> Save and continue to create
		</button>
		</c:if>
		
		<button class="btn btn-warning " type="submit">
			<i class="icon-save"></i> <fmt:message key="global.info.save" /><!--Save-->
		</button>
		
		<button class="btn btn-warning" onclick="customer.backList()" type="button">
			<i class="icon-circle-arrow-left "></i>
			Back
		</button>
		
	</div>	
	</form>
