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
			<span>TimeCardDetails Report</span>
			</div>
			
		</div>
	</div>
</div>
<form id="timeCard" action='/report/download' onsubmit="return false;" class="form form-horizontal" style="margin-bottom: 0;" method="post" accept-charset="UTF-8">
<input class="span12" name="reportType" type="hidden"  value="TimeCardDetailsReport" />
<div id="alertMessage"></div>	
<div id="report-table">
	<div class="row-fluid report-icon">
		<div class="span12">
			<div id="" class="portlet box green">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-reorder"></i>
						<span>Conditions</span>
					</div>
				</div>
				<div class="portlet-body">
					<div class="row-fluid">
						<div class="span6">
							<%@include file="basecondition.jsp" %>
						</div>
						<div class="span6">
							<div class="control-group">
								<label class="control-label"> <span>Company Nodes:</span></label>
								<div class="controls">
									<input id="departmentValue" type="text" readonly  class="span12 input_cursor_pointer" onclick="showMenu();" />
									<input name="departmentId" id="departmentId" type="hidden"   class="span12"  />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label"> <span>Date Period:</span></label>
								<div class="controls input-append date" id="datePerf" style="display: block;">
									<input class="span10" name="datePeriod" type="text" id="datePeriod" value=""/>
									<input class="span10" name="startDate" type="hidden" id="startDate" value=""/>
									<input class="span10" name="endDate" type="hidden" id="endDate" value=""/>
								    <span class='add-on' style="cursor: pointer;">
							           <i class='icon-calendar'></i>
							        </span>		
								</div>
								<!-- <div class="controls input-append date">
									<input class='span10 ' name="datePeriod" placeholder='' type='text' />
						            <span class='add-on' id='datePerf' style="cursor: pointer;">
						              <i class='icon-calendar'></i>
						            </span>
								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row-fluid text-center"  id="savebutton">
		
		
		<button class="btn btn-warning" type="submit">
			<i class=" icon-lightbulb "></i> <span>Done</span>
		</button>
		
	    <button class="btn btn-warning" onclick="history.back(-1)"  type="button">
			<i class="icon-circle-arrow-left "></i>
			Back
		</button>		
		</div>
	</div>
</div>

</form>
	<script type="text/javascript">
		var setting = {
			async: {
				enable: true,
				url:webPath + "/mydetail/tree?iscompany=false"
			},
			view: {
				dblClickExpand: false,
				showIcon: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: function(e, treeId, treeNode) {
					if (treeNode.structure!=0){
						return false;
					}
					var zTree = $.fn.zTree.getZTreeObj("tree_global"),
					nodes = zTree.getSelectedNodes(),
					n = "",
					v = "";
					for (var i=0, l=nodes.length; i<l; i++) {
						if(nodes[i].structure!='0'){
							argusAlertStrip("alertMessage","warning"," Warning: Only allows the selection of leaf nodest!");
							break;
						}
						n += nodes[i].name;
						v += nodes[i].id;
					}
					var departmentValue = $("#departmentValue");
					departmentValue.val(n);
					$("#departmentId").val(v);
					if (treeNode.pId == null){
						$("#departmentId").val("");
					}
					hideMenu();
			}
			}
		};
		function showMenu() {
			var cityObj = $("#departmentValue");
			var cityOffset = $("#departmentValue").offset();
			console.info({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"})
			$("#menuContent_global").css({"z-index":"9999", left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"});
			$("#tree_global").width($("#departmentValue").width()-2);
			$("#menuContent_global").slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent_global").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "departmentValue" || event.target.id == "menuContent_global" || $(event.target).parents("#menuContent_global").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$("select").select2({
				placeholder : "Select an option",
				allowClear : true
			});
			$.fn.zTree.init($("#tree_global"), setting);
			$("#datePerf").daterangepicker({
		    	timePicker: true, 
		    	timePicker12Hour: false,
		    	timePickerIncrement: 30, 
		    	format: 'YYYY-MM-DD h:mm A',
		    	locale: {
		            firstDay: 1
		        },
		        opens: 'left'
		    }, function(start, end) {
		    	$("#startDate").val(start.format("YYYY-MM-DD"));
		    	$("#endDate").val(end.format("YYYY-MM-DD"));
		        return $("#datePeriod").val(start.format("YYYY-MM-DD") + " to " + end.format("YYYY-MM-DD"));
		    });
			$('#timeCard').validate({
				doNotHideMessage : true, //this option enables to show the error/success messages on tab switch.
				errorElement : 'span', //default input error message container
				errorClass : 'validate-inline', // default input error message class
				focusInvalid : false, // do not focus the last invalid input
				rules : {
					"payGroupId" : {
						required : true	
					},
					"datePeriod" : {
						required : true	
					},
					"departmentId" : {
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
		        	form.submit();
		        },
		        
		        onfocusin: function( element, event ) {
		        	if ($("#alertMessage").html()!="")
		        		$("#alertMessage").html("")
		        }

			});
		});

	
</script>	