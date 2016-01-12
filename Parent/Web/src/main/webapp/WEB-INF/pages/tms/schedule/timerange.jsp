<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="webpath" uri="/WEB-INF/tlds/path.tld"%>
<form class=" form-left2 form-horizontal">
<div class='row-fluid' style="width: 505px;padding: 10px">	
	<div id="timerangesetting" class=" span12 box">
		<div class="control-group">
					<label class="control-label">
					<span>Schedule Day Begin：</span>
					</label>
					<div class="controls">
						<select id="beginTimeRangeSelect" class="span12" style="width:100px;" onchange="onChangeRang()">
			    				<option value="Previous">Previous</option>
			    				<option value="Today" selected="selected">Today</option>
			    				<option value="NextDay">Next Day</option>
		    				</select>
		    				<input type="time" id="beginTimeRange"  class="span12" onchange="onChangeRang()" style="width:85px;margin-left:10px" value="00:00">						
					</div>
				</div>
<div class="control-group">
					<label class="control-label">
					<span>Schedule Day End：</span>
					</label>
					<div class="controls">
						<select id="endTimeRangeSelect"  class="span12" style="width:100px;" onchange="onChangeRang()">
			    				<option value="Previous">Previous</option>
			    				<option value="Today" selected="selected">Today</option>
			    				<option value="NextDay">Next Day</option>
			    				</select><input type="time" id="endTimeRange" class="span12" onchange="onChangeRang()" style="width:85px;margin-left:10px" value="00:00">
						
					</div>
				</div>

	</div>
</div>
<div class="row-fluid" id="saverangebutton">
			
		
		<button class="btn btn-warning pull-right" type="button" style="margin-right:10px;">
			<i class="icon-save"></i> <span>Save<!--Save--></span>
		</button>
	</div>
</form>
<script type="text/javascript">
	 $("#beginTimeRangeSelect").select2({
            allowClear: false
        });
        $("#endTimeRangeSelect").select2({
            allowClear: false
        });


       function onChangeRang() {
        var beginTimeRangeSelect = $("#beginTimeRangeSelect").children('option:selected').val();;
        var endTimeRangeSelect = $("#endTimeRangeSelect").children('option:selected').val();;
        var beginTimeRange = $("#beginTimeRange").val();
        var endTimeRange = $("#endTimeRange").val();
        if (beginTimeRangeSelect == 'today' && endTimeRangeSelect == "prev" || beginTimeRangeSelect == 'next' && endTimeRangeSelect == "prev" || beginTimeRangeSelect == 'next' && endTimeRangeSelect == "today") {
            // alert('error');
            return;
        }
        if (!beginTimeRange || !endTimeRange) return;
        var beginday = 2;
        if (beginTimeRangeSelect == 'prev') {
            sechedule.beginday = beginday = 1;
        } else if (beginTimeRangeSelect == 'next') {
            sechedule.beginday = beginday = 3;
        }
        var beginTime = new Date('2008-01-0' + beginday + ' ' + beginTimeRange);
        var endday = 2;
        if (endTimeRangeSelect == 'prev') {
            endday = 1;
        } else if (endTimeRangeSelect == 'next') {
            endday = 3;
        }
        var endTime = new Date('2008-01-0' + endday + ' ' + endTimeRange);
        var cha = endTime.getTime() - beginTime.getTime();
        var days = Math.floor(cha / (24 * 3600 * 1000))
        var leave1 = cha % (24 * 3600 * 1000)
            //计算天数后剩余的毫秒数
        var hours = Math.floor(leave1 / (3600 * 1000))
            //计算相差分钟数
        var leave2 = leave1 % (3600 * 1000)
            //计算小时数后剩余的毫秒数
        var minutes = Math.floor(leave2 / (60 * 1000))
        var rowCount = days * 24 + hours + 1;
        $("#rowCount").val(rowCount);
        var beginHour = beginTime.getHours();
        var beginMinute = beginTime.getMinutes();
        var endHour = endTime.getHours();
        var endMinute = endTime.getMinutes();
        $("#beginHour").val(beginHour);
        $("#beginMinute").val(beginMinute);

        sechedule.dayStart= beginTimeRange,
        sechedule.dayEnd= endTimeRange,
        sechedule.dayStartType= beginTimeRangeSelect,
        sechedule.dayEndType= endTimeRangeSelect,
       
    }

    $("#saverangebutton").click(function(){
    	 schedule.getValue();
    	 $(".xubox_close").click();
    });
</script>













