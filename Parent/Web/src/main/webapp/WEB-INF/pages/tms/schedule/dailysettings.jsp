<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<form class=" form-left2 form-horizontal">
<div class='row-fluid' style="width: 505px;padding: 10px">	
	<div id="dailysetting" class=" span12 box">
		<div class="control-group">
				<label class="control-label"> <span>Title：</span></label>
				<div class="controls">
					<input class="span12" name="dailytitle" type="text" id="dailytitle"
						value="" maxlength="40"  readonly="readonly" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"> <span>Same as day：</span></label>
				<div class="controls">
					<select id="sameaddaySelect" onchange="changesameday()">
						<option value="custom">custom</option>
					</select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label"> <span>Off Day：</span></label>
				<div class="controls">
					<label><input type="checkbox" id="isoffday">Is Off Day</label>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label"> <span>Break Time：</span></label>
				<div class="controls">
					<input type="number" id="breaktimeinput" style="width:80px"> minutes
				</div>
			</div>
	</div>
</div>
<div class="row-fluid" id="savedailysbutton">
			
		
		<button class="btn btn-warning pull-right" type="button" style="margin-right:10px;">
			<i class="icon-save"></i> <span>Save<!--Save--></span>
		</button>
	</div>
</form>
<script type="text/javascript">
	

function changesameday(){
	if($("#sameaddaySelect").val() == 'custom'){
		$("#isoffday").removeAttr('disabled');
		$("#breaktimeinput").removeAttr('disabled');
	}else{		
		$("#isoffday").attr('disabled','disabled');
		$("#breaktimeinput").attr('disabled','disabled');
	}
}

for(var i = 0;i < sechedule.samdaycount;i++){
	$("#sameaddaySelect").append('<option value="'+i+'">Day'+(i + 1)+'</option>');
}
$("#sameaddaySelect").select2({
            placeholder: "Select an option"
        });
$("#dailytitle").val(sechedule.modifydaytitle)
                              $("#savedailysbutton").click(function() {
                              	 
                              	  sechedule.setmodifyday($("#isoffday").attr('checked') ? true : false,$("#breaktimeinput").val(),$("#dailytitle").val());
                                   $(".xubox_close").click();

                              });


</script>