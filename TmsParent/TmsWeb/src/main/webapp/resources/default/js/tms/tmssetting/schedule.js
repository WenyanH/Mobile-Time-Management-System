$(document).ready(function() {
    schedule.sort();
});
Date.prototype.Format = function(fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
var schedule = {
    sort: function() {
        $("#schedule-data-table").dataTable({
            bAutoWidth: true,
            columnDefs: [{
                orderable: false, //禁用排序
                targets: [7] //指定的列
            }],
            bStateSave: true
        });
    },
    loadschedule: function() {
        PageCtrl.load({
            url: webPath + "/schedule/list_nd",
            dom: "schedule-table",
            param: {},
            callback: function() {
                schedule.sort();
            }
        });
    },
    create: function() {
        //			$.layer({
        //                type: 1,
        //                title : "Create a new schedule",
        //                shadeClose: true,
        //                area : [ '580px', '500px' ],
        //                offset : [ '100px', '' ],
        //                page: {
        //                	url : webPath + '/schedule/create?pjax=true'
        //                },
        //                zIndex:2500
        //            });
        window.location.href = webPath + '/schedule/create';
    },
    appendscheduletime: function(id, ruleId) {
        $.layer({
            type: 1,
            title: "append a new schedule",
            shadeClose: true,
            area: ['580px', '500px'],
            offset: ['100px', ''],
            page: {
                url: webPath + '/schedule/appendscheduletime?pjax=true&id=' + id + '&ruleId=' + ruleId
            },
            zIndex: 2500
        });
    },
    update: function(id) {
        //			
        //			$.layer({
        //                type: 1,
        //                title : "Modify a schedule",
        //                shadeClose: true,
        //                area : [ '580px', '500px' ],
        //                offset : [ '100px', '' ],
        //                page: {
        //                	url : webPath + '/schedule/update?pjax=true&id=' + id
        //                },
        //                zIndex:2500
        //            });		
        window.location.href = webPath + '/schedule/update?id=' + id;
    },
    save: function(form, iscontinue) {
        var data = {
            code: $("#code").val(),
            name: $("#name").val(),
            active: $("#active").val() == 'on' ? true : false,
            periodType: $("#periodType").val(),
            periods: $("#period").val(),
            days: $("#days").val(),
            startDate: $("#startDate").val(),
            workOnHoliday: $("#workOnHoliday").val() == 'on' ? true : false,
            dayStart: sechedule.dayStart,
            dayEnd: sechedule.dayEnd,
            dayStartType: sechedule.dayStartType,
            dayEndType: sechedule.dayEndType,
            scheduleRules: sechedule.data
        }
        PageCtrl.ajax({
            url: webPath + '/schedule/save',
            data: JSON.stringify(data),
            dataType: "json",
            type: "post",
            contentType: "application/json",
            success: function(data) {
                alert(3333)
            }
        });
        return false;
    },
    remove: function() {
        var ids = "";
        $('input[name="id"]:checked').each(function() {
            ids += $(this).val() + ",";
        });
        if (!ids) {
            argusAlertStrip("alertMessage", "warning", " Warning:  Please select at least one.");
            return false;
        }
        argusConfirm("Confirm delete?", function(result) {
            if (result) {
                Loading.start();
                PageCtrl.ajax({
                    url: webPath + "/schedule/delete?ids=" + ids,
                    type: "post",
                    dataType: "json",
                    success: function(data) {
                        schedule.loadschedule();
                        Loading.stop();
                    }
                });
            }
        });
    },
    saveAndContinue: function() {
        schedule.save($("#scheduleForm"), true);
    },
    backList: function() {
        document.location.href = webPath + '/schedule/list';
    },
    validateScheduleTime: function(addStart, addEnd) {
        var clientEvents = $('#calendar').fullCalendar('clientEvents'); //返回数组
        if (clientEvents.length > 0) {
            for (var i = 0; i < clientEvents.length; i++) {
                var event = clientEvents[i];
                var start = new Date(event["start"]);
                var end = new Date(event["end"]);
                if (addStart.getTime() > start.getTime() && addStart.getTime() < start.getTime()) {
                    return false;
                }
                if (addEnd.getTime() > end.getTime() && addEnd.getTime() < end.getTime()) {
                    return false;
                }
            }
        }
        return true;
    },
    initSavePage: function() {
        $('#scheduleForm').validate({
            doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
            errorElement: 'span', //default input error message container
            errorClass: 'validate-inline', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                "code": {
                    required: true,
                    minlength: 3
                },
                "name": {
                    required: true,
                    minlength: 3
                }
            },
            errorPlacement: function(error, element) { // render error placement for each input type
                error.insertAfter(element); // for other inputs, just perform default behavior
            },
            invalidHandler: function(event, validator) { //display error alert on form submit   
                Loading.stop();
            },
            highlight: function(element) { // hightlight error inputs
                $(element).closest('.help-inline').removeClass('ok'); // display OK icon
                $(element).closest('.control-group').removeClass('success').addClass('error'); // set error class to the control group
            },
            unhighlight: function(element) { // revert the change dony by hightlight
                $(element).closest('.control-group').removeClass('error'); // set error class to the control group
            },
            success: function(label) {
                label.addClass('valid').closest('.control-group').removeClass('error'); // set success class to the control group
                label.remove();
            },
            submitHandler: function(form) {
                schedule.save(form, false);
            },
            onfocusin: function(element, event) {
                if ($("#alertMessage").html() != "") $("#alertMessage").html("")
            }
        });
        $("#startTime").datetimepicker({
            pickTime: false,
            format: "yyyy-MM-dd",
            pickerPosition: "left"
        }).on('changeDate', function(ev) {
            // new Date(ev.date.valueOf());

            schedule.getValue(sechedule.data);
        });
        $("#periodType").select2({
            placeholder: "Select an option",
            allowClear: true
        });
       
        $("#period").change(function() {
            schedule.getValue();
        });
        $("#days").change(function() {
            schedule.getValue();
        });
        schedule.getValue();
    },
    
    onChangePeriod: function() {
        var viewType = "agendaWeek";
        var periods = $("#period");
        var dayPerPeriod = $("#days");
        switch ($("#periodType").val()) {
            case "Weekly":
                periods.val(1).attr('readonly', true);
                dayPerPeriod.val(7).attr('readonly', true);
                viewType = "agendaWeek";
                break;
            case "Fortnightly":
                periods.val(2).attr('readonly', true);
                dayPerPeriod.val(7).attr('readonly', true);
                viewType = "agendaBiWeek";
                break;
            case "Daily":
                periods.val(1).attr('readonly', true);
                dayPerPeriod.val(1).attr('readonly', true);
                viewType = "agendaDay";
                break;
            case "Custom":
                periods.val(1).attr('readonly', false);
                dayPerPeriod.val(3).attr('readonly', false);
                viewType = "agendaDay";
                break;
        }
        schedule.getValue();
        //schedule.showfullcalendar();
    },
    getValue: function(data) {
        var startDate = $("#startDate").val() ? new Date($("#startDate").val()).getDay() : 0;
        var periodType = $("#periodType");
        var periods = parseInt($("#period").val());
        var dayPerPeriod = parseInt($("#days").val());
        var rowCount = $("#rowCount").val() ? parseInt($("#rowCount").val()) : 24;
        var beginHour = $("#beginHour").val() ? parseInt($("#beginHour").val()) : 0;
        var beginMinute = $("#beginMinute").val() ? parseInt($("#beginMinute").val()) : 0;
        sechedule.init({
            startDay: startDate,
            periods: periods,
            daysPerPeriod: dayPerPeriod,
            lineSkip: 1,
            rowCount: rowCount,
            hour: beginHour,
            minth: beginMinute,
            data : data
        });
    },
    periodMatch: function() {
        PageCtrl.ajax({
            url: webPath + "/schedule/view",
            data: {
                id: $("#diffPeriod").val()
            },
            dataType: "json",
            type: "post",
            success: function(data) {
                Loading.stop();
                console.info(data);
                if (data.schedule != null) {
                    $("#periodType").val(data.schedule.schedulePeriod).trigger("change");
                    //					$("#periodOffset").val(data.schedule.periodOffset).trigger("change");
                    $("#period").val(data.schedule.period).trigger("change");
                    $("#days").val(data.schedule.days).trigger("change");
                    $("#period").attr("disabled", true);
                    $("#days").attr("disabled", true);
                }
            }
        });
    }
};