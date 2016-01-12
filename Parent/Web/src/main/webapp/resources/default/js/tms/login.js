if( top.location != self.location) top.location.href=self.location.href;
		
function checked(){
	
}

$(document).ready(function(){
	var tmsRememberLoginUser = $.cookie('tmsRememberLoginUser');
	if (tmsRememberLoginUser!=null && tmsRememberLoginUser!=""){
		$("#userId").val(tmsRememberLoginUser);
		$("#rememberme").attr("checked", true);
	}
	
	if ($("#userId").val()==""){
		$("#userId").focus();
	}else{
		$("#password").focus();
	}
	
	$.cookie('headmenuId', null, { path: '/' });
	
});

var login ={
		
		signin : function(){
			
			if ($("#rememberme").attr("checked")=='checked'){
				$.cookie('tmsRememberLoginUser', $("#userId").val(), { expires:60, path: '/' });
			} else {
				$.cookie('tmsRememberLoginUser', null, { path: '/' });
			}
			
			$("#signinButton").attr("disabled",true);
			PageCtrl.ajax({
				url : webPath + "/signin",
				data : {
					userId : $("#userId").val(),
					password : $("#password").val()
				},
				dataType: "json",
				type : "post",
				success : function(data) {
					if (data.message == "error"){
						argusAlertStrip("alertMessage","error",LOGIN_INFO_ERROR);
						$("#signinButton").attr("disabled",false);
					} else {
						window.location.href = webPath + "/dashboard";
					}
					
				}
			});
			
			return false;
		}
		
}