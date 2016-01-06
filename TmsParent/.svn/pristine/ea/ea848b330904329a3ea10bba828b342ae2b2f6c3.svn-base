<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>

<div class='row-fluid' style="width: 505px; padding: 10px">
	<form id="leaveForm" action='#' onsubmit="return false;"
		class="form form-horizontal form-left2" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
		<input class="span12" name="id" type="hidden" id="id" value="${leave.id}" />
		<div class='row-fluid' style="height: 380px">
			<div id="alertMessage"></div>

			<div class='span12' style="margin: 0px;">

				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span><fmt:message
								key="saveleave.info.employee" />
							<!--Employee:--></span>
					</label>
					<div class="controls">
						<input  name="employeeId" type="hidden"  value="${employeeId}" />
						<input   type="text"  value="${employeeName}" disabled/>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span><fmt:message
								key="saveleave.info.type" />
							<!--Pay Type:--></span></label>
					<div class="controls">
						<select id="typeID" name="typeId" class="span12"
							data-placeholder=" " tabindex="1">
							<option value=""></option>
							<c:forEach var="paytype" items="${paytypeList}">
								<c:if test="${paytype.active==true}">
									<c:if test="${paytype.leaveStatus==true}">
										<option value="${paytype.id}"
											<c:if test="${paytype.id==leave.typeId}">selected</c:if>>${paytype.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>


				<div class="control-group">
					<label class="control-label"> <span><fmt:message
								key="saveleave.info.byworkhours" />
							<!--By Work Hours--></span></label>
					<div class="controls">

						<div id="byWorkHoursSwitch" class='switch' data-off-label='<i class="icon-ban-circle"></i>'
							data-on-label='<i class="icon-ok"></i>' data-on='success'
							data-off="warning">
							<input type="checkbox" id="byWorkHours" name="byWorkHours" onchange="workHoursOnChange();" 
								<c:if test="${leave.byWorkHours}">checked</c:if>>
						</div>

					</div>
				</div>


				<div class="control-group">
					<label class="control-label"> <font color="red">*</font><span><fmt:message
								key="saveleave.info.fromdate" />
							<!--From Date:--></span></label>
					<div class="controls input-append date" id="fromDatetime"
						data-date-format="yyyy-mm-dd" style="display: block;">
						<input class="" name="fromDate" type="text" id="fromDate" value="${leave.fromDate}" />
						<span class='add-on' style="cursor: pointer;"> <i
							class='icon-calendar'></i>
						</span>
					</div>
				</div>





				<div class="control-group" id="toDateline" style="display: none;">
					<label class="control-label"> <font color="red">*</font><span><fmt:message
								key="saveleave.info.todate" />
							<!--To Date:--></span></label>
					<div class="controls input-append date" id="toDatetime" data-date-format="yyyy-MM-dd" style="display: block;">
						<input class="" name="toDate" type="text" id="toDate" value="${leave.toDate}" />
						<span class='add-on' style="cursor: pointer;"> <i
							class='icon-calendar'></i>
						</span>
					</div>
				</div>


				<div class="control-group" id="durationline" style="display: none;">
					<label class="control-label"> <span><fmt:message
								key="saveleave.info.duration" />
							<!--Duration:--></span></label>
					<div class="controls">
							<c:if test="${leave.id==null}">
								<input class="span12" name="duration" type="text" id="duration" value="0.0" />
							</c:if> <c:if test="${leave.id!=null}">
								<input class="span12" name="duration" type="text" id="duration" value="${leave.duration }" />
							</c:if> 
						
					</div>
				</div>






				<div class="control-group" id="fromLeaveTimeline"
					style="display: none;">
					<label class="control-label"> <font color="red">*</font><span><fmt:message
								key="saveleave.info.from" />
							<!--From:--></span>
					</label>
					<div class="controls">
						<div class="checkbox inline input-append date" id="fromLeave"
							data-date-format="HH:mm" style="padding: 0;">
							<input class="input_cursor_pointer" style="width: 50px;"
								name="fromLeaveTime" type="text" id="fromLeaveTime"
								value="${leave.fromLeaveTime}" /> <span class='add-on'
								style="cursor: pointer;"> <i class='icon-time'></i>
							</span>
						</div>
					</div>
				</div>





				<div class="control-group" id="toLeaveTimeline"
					style="display: none;">
					<label class="control-label"> <font color="red">*</font><span><fmt:message
								key="saveleave.info.to" />
							<!--To:--></span>
					</label>
					<div class="controls">
						<div class="checkbox inline input-append date" id="toLeave"
							data-date-format="HH:mm" style="padding: 0;">
							<input class="input_cursor_pointer" style="width: 50px;"
								name="toLeaveTime" type="text" id="toLeaveTime"
								value="${leave.toLeaveTime}" /> <span class='add-on'
								style="cursor: pointer;"> <i class='icon-time'></i>
							</span>
						</div>
					</div>
				</div>



				<div class='row-fluid'>
					<div class='span12'>
						<div class="control-group">

							<label class="control-label"> <span><fmt:message
										key="saveleave.info.memo" /></span>
							</label>
							<div class="controls">
								<textarea id="memo" name="memo" rows="4" class='span12'>${leave.memo}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid" id="savebutton">
			<c:if test="${leave.id==null}">
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
<script>
	$(document).ready(function() {
		$('#leaveForm').validate({
			doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
			errorElement : 'span', //default input error message container
			errorClass : 'validate-inline', // default input error message class
			focusInvalid : false, // do not focus the last invalid input
			rules : {
				"typeId" : {
					required : true
				},
				"duration" : {						
					range:[0,100]
				},
				"fromDate" : {
					required : true					
				},	
				"toDate" : {
					required : true									
				},			
				"fromLeaveTime" : {
					required : true	
				},
				"toLeaveTime" : {
					required : true	
				}
				
			},
			
			errorPlacement: function (error, element) { // render error placement for each input type
	        error.insertAfter(element); // for other inputs, just perform default behavior
	            
	        },

	        invalidHandler: function (event, validator) { //display error alert on form submit   
	        	Loading.stop();
	        	
	        },

	        highlight: function (element) { // hightlight error inputs
	            $(element).closest('.help-inline').removeClass('ok'); // display OK icon
	            $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
	        },

	        unhighlight: function (element) { // revert the change dony by hightlight
	            $(element).closest('.control-group').removeClass('error'); // set error class to the control group
	        },

	        success: function (label) {
	            label.addClass('valid').closest('.control-group').removeClass('error'); // set success class to the control group
	            label.remove();
	            
	        },
	        
	        submitHandler: function(form){  	
	        	save(form);		
	        },
	        
	        onfocusin: function( element, event ) {
	        	if ($("#alertMessage").html()!="")
	        		$("#alertMessage").html("")
	        }

		});
		
		
		
		$("#employeeID").select2({
			placeholder : "Select an option",
			allowClear : true
		});	
		
		$("#typeID").select2({
			placeholder : "Select an option",
			allowClear : true
		});	
		
		$("#fromLeave").datetimepicker({
			pickDate: false,
			format: "hh:mm"
		});
		
		$("#toLeave").datetimepicker({
			pickDate: false,
			format: "hh:mm"
		});
		
			
		$("#fromDatetime").datetimepicker({
			pickTime: false,
			format: "yyyy-MM-dd"
		});
		
		$("#toDatetime").datetimepicker({
			pickTime: false,
			format: "yyyy-MM-dd"
		});
		$("#byWorkHoursSwitch").bootstrapSwitch();
		workHoursOnChange();
	});
	function workHoursOnChange(){
		if($("#byWorkHours").attr("checked")=="checked"){
			$("#durationline").hide();
			$("#toDateline").hide();
			$("#fromLeaveTimeline").slideDown("fast");
			$("#toLeaveTimeline").slideDown("fast");
			$("#toDate").val($("#fromDate").val());		
			$("#duration").val(0+".0");
			
		} else {
			$("#durationline").slideDown("fast");
			$("#toDateline").slideDown("fast");
			$("#fromLeaveTimeline").hide();
			$("#fromLeaveTime").val("");
			$("#toLeaveTimeline").hide();
			$("#toLeaveTime").val("");				
		}
	}
	function save (form){
		if ($("#alertMessage").html()!="")
    		$("#alertMessage").html("")
    	Loading.start();
		$(form).attr('action', webPath + "/leave/save");
		formTool.submitForm($(form),function(data){
			Loading.stop();
			if (data.message=="success"){
				if ($("#keepon").attr("checked") == "checked"){
					$(":text").val("");
				} else {
					$(".xubox_close").click();
				}
			}else if (data.message == "exist"){
				argusAlertStrip("alertDepartmentMessage","warning"," Warning: The code is exist.");
			}
			else {
				argusAlertStrip("alertDepartmentMessage","error"," Error");
			}
		});
		return false;
	}
</script>