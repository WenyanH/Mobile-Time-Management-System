//兼容ie6的fixed代码 
//jQuery(function($j){
//	$j('#pop').positionFixed()
//})
(function($j){
    $j.positionFixed = function(el){
        $j(el).each(function(){
            new fixed(this)
        })
        return el;                  
    }
    $j.fn.positionFixed = function(){
        return $j.positionFixed(this)
    }
    var fixed = $j.positionFixed.impl = function(el){
        var o=this;
        o.sts={
            target : $j(el).css('position','fixed'),
            container : $j(window)
        }
        o.sts.currentCss = {
            top : o.sts.target.css('top'),              
            right : o.sts.target.css('right'),              
            bottom : o.sts.target.css('bottom'),                
            left : o.sts.target.css('left')             
        }
        if(!o.ie6)return;
        o.bindEvent();
    }
    $j.extend(fixed.prototype,{
        ie6 : $.browser.msie && $.browser.version < 7.0,
        bindEvent : function(){
            var o=this;
            o.sts.target.css('position','absolute')
            o.overRelative().initBasePos();
            o.sts.target.css(o.sts.basePos)
            o.sts.container.scroll(o.scrollEvent()).resize(o.resizeEvent());
            o.setPos();
        },
        overRelative : function(){
            var o=this;
            var relative = o.sts.target.parents().filter(function(){
                if($j(this).css('position')=='relative')return this;
            })
            if(relative.size()>0)relative.after(o.sts.target)
            return o;
        },
        initBasePos : function(){
            var o=this;
            o.sts.basePos = {
                top: o.sts.target.offset().top - (o.sts.currentCss.top=='auto'?o.sts.container.scrollTop():0),
                left: o.sts.target.offset().left - (o.sts.currentCss.left=='auto'?o.sts.container.scrollLeft():0)
            }
            return o;
        },
        setPos : function(){
            var o=this;
            o.sts.target.css({
                top: o.sts.container.scrollTop() + o.sts.basePos.top,
                left: o.sts.container.scrollLeft() + o.sts.basePos.left
            })
        },
        scrollEvent : function(){
            var o=this;
            return function(){
                o.setPos();
            }
        },
        resizeEvent : function(){
            var o=this;
            return function(){
                setTimeout(function(){
                    o.sts.target.css(o.sts.currentCss)      
                    o.initBasePos();
                    o.setPos()
                },1)    
            }           
        }
    })
})(jQuery)

//jQuery(function($j){
//	$j('#footer').positionFixed()
//})

//pop右下角弹窗函数
function popup(title,url,intro){
	this.title=title;
	this.url=url;
	this.intro=intro;
	this.apearTime=1000;
	this.hideTime=500;
	this.delay=100000;
	//添加信息
	this.addInfo();
	//显示
	this.showDiv();
	//关闭
  this.closeDiv();
}
popup.prototype={
  addInfo:function(){
    $("#popTitle a").attr('href',this.url).html(this.title);
    $("#popIntro").html(this.intro);
    $("#popMore a").attr('href',this.url);
  },
  showDiv:function(time){
		if (!($.browser.msie && ($.browser.version == "6.0") && !$.support.style)) {
      $('#pop').slideDown(this.apearTime);//.delay(this.delay).fadeOut(400);
    } else{//调用jquery.fixed.js,解决ie6不能用fixed
      $('#pop').show();
			jQuery(function($j){
			    $j('#pop').positionFixed()
			})
    }
  },
  closeDiv:function(){
  	$("#popClose").click(function(){
  		  $('#pop').hide();
  		}
    );
  }
};



(function() {
    if (window.PageCtrl) {
        return;
    }

    window.PageCtrl = {
        loadJs: function(url, callback) {
            var script = document.createElement("script");
            script.type = "text/javascript";
            if (script.readyState) { //IE
                script.onreadystatechange = function() {
                    if (script.readyState == "loaded" || script.readyState == "complete") {
                        script.onreadystatechange = null;
                        callback();
                    }
                };
            } else { //Others
                script.onload = function() {
                    callback();
                };
            }
            script.src = url;
            document.getElementsByTagName("head")[0].appendChild(script);
        },
		/*
		 * 
		 * @param {Object} conf
		 * {url:"请求页面url",dom:"填充元素可以是id或者dom对象,param:{url参数},callback:请求页面回来以后回调",refresh:是否刷新容器，默认刷新}
		 */
        load: function(conf,isBlock) {
            var $dom = null;
            var url = conf.url,
				dom = conf.dom,
				param=conf.param ? conf.param:{},
				type=conf.type ? conf.type : "Post",
				callback = conf.callback?conf.callback:null,
				callbackParam = conf.callbackParam ? conf.callbackParam : null,
				contentType = conf.contentType ? conf.contentType : "application/x-www-form-urlencoded";
				var refresh = conf.refresh===false ? false : true;	
            if (dom) {
                if (typeof conf.dom === "string") {
                    $dom = $("#" + conf.dom);
                } else {
                    $dom = $(conf.dom);
                }
            } else {
                new Error("load page is Error");
            }
            if(window.Loading){
            //	window.Loading.start();
            }
			window.PageCtrl.ajax({
                url: url,
                cache: false,
                dataType: "html",
                data: param,
                contentType : contentType,
                type: type,
                error:conf.error,
                success: function(data,textStatus,jqXHR) {
                    
                    if(refresh){
                    	$dom.find("*").unbind();
                    	$dom.html("");
                    }
					var rscript = /(<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>)/gim;
					var rsrc = /src="(\S+.js)"/ig;
					var rname = /namespace="(\S+)"/ig;
					var scripts = data.match(rscript);
					
                    data = trim(data.replace(rscript, ""));
                    var $content = $(data);
                    
				    $dom.append($content);	
				    if(window.FoldPanel){
				    	window.FoldPanel.init();
				    	
				    }
					if(window.LayoutManager){
						LayoutManager.doLayout($dom);
					}
		            if(window.Loading){
		            	//window.Loading.stop();
		            }					
                    if (callback) {
                        callback(callbackParam, $content);
                    }
					
					if(!scripts) return;
					
					var loadConfs = [];//用于阻塞加载js保存配置信息
					
                    for (var i = 0, len = scripts.length; i < len; i++) {					
                        var script = scripts[i];	
						var src = script.match(rsrc);
						if(src){
							src = src[0].replace('src="',"").replace('"',"");
						}else{
							$dom.append(trim(script));
							continue;
						}
						var matchScript = script.match(rname);
						var name = null;
						if(matchScript){
							name = matchScript[0].replace('namespace="',"").replace('"',"");
						}
						if(!window[name]){
							if(isBlock){
								loadConfs.push({src:src,name:name});
							}else{
								window.PageCtrl.loadJs(src,
														function() {
															var innername = name;
															return function(){
																if(innername){
																	window[innername].init();
																}
																
															}														
														}());							
							}
							

						}else{							
							window[name].init();
						}					
                    }
					
					function blockScript(loadConf){
							if(!loadConf) return;
						    window.PageCtrl.loadJs(loadConf.src,
							                        function() {
														var innername = loadConf.name;
															window[innername].init();
															blockScript(loadConfs[loadConfStep++]);
							                        });													
					}
					var loadConfStep = 0;
					blockScript(loadConfs[loadConfStep++]);
					
					
				
					
					
					

                }
            })
        },
		submit:function(conf){
           window.PageCtrl.ajax(conf);	
		},
		formSubmit : function(conf){
			var $form = $("#"+conf.formId);
			var $iframe = $("#"+$form.attr("target"));
			if(!$iframe[0]){
				$iframe = $('<iframe  style="display:none" id="'+$form.attr("target")+'" name="'+$form.attr("target")+'" ></iframe>');
				$(document.body).append($iframe);				
			}
			if(conf.success){
				$iframe.unbind().load(conf.success);
			}
			$form.submit();
		},
		ajax:function(conf){
			if(conf.formId){
				PageCtrl.formSubmit(conf);
				return;
			}
			
			var success = conf.success;
			var error = conf.error;
			
			conf.success = function(data,textStatus,jqXHR){
				if(conf.loading===true){
					window.Loading.stop();
				}
				if(success) success(data,textStatus,jqXHR)
			};
			conf.error = function(jqXHR, textStatus, errorThrown){
				if(window.Loading){
					window.Loading.stop();
				}
				if(jqXHR){
					var errorFrame = "";
					
					if(jqXHR.status == 404 || jqXHR.status==0){
						if(error){
							error(jqXHR, textStatus, errorThrown);
						}
						if(conf.error404){  //404错误自定义处理
							conf.error404(jqXHR, textStatus, errorThrown);
						}
					}else{
						if(jqXHR.status == 501){
							var errorJson = $.StringtoJson(jqXHR.responseText);
							if(error){
								error(jqXHR, textStatus, errorThrown);
							}
							if(errorJson.errLevel=="1"){//错误提示方式
								argusAlert(errorJson.errorMessage);
								return;
							}
							errorFrame = ExceptionAlert.createFrame(errorJson.errorMessage,errorJson.errorCode||"",errorJson.stackTrack,errorJson.hasErrDetail);
							$(document.body).append(errorFrame);
							ExceptionAlert.init();

						}else{
							if(error){
								error(jqXHR, textStatus, errorThrown);
							}
							errorFrame = jqXHR.responseText;
							$(document.body).append(errorFrame);
						}
						
					}
				}
			};

			if(conf.loading===true){
				window.Loading.start();
			}
			
			if(conf.url.indexOf(".html")==-1){
				
				var url = conf.url;
				
				if(url.indexOf("?")!=-1){
					url += "&";
				}else{
					url +="?"
				}
				
				
				conf.data = conf.data || {};
				conf.data.aaaabbbb = new Date().getTime();
				conf.url = url;
			}
			return $.ajax(conf).responseText;
		},
		/*
		 * 弹出普通窗口
		 * */
		winOpen:function(obj){
			var resizeable = obj.resizeable ===true ? "yes" : "no";
			var scrollable = obj.scrollable ===true ? "yes" : "no";
			var height = obj.height;
			var width = obj.width;
			
			var left =  obj.left || window.screen.width/2 - width/2;
			 var top = obj.top || window.screen.height/2 -height/2;	
			 
			 
				var windowLeft = window.screenLeft;
				var windowTop = window.screenTop;
				if(windowLeft<0 || windowLeft >= window.screen.width){
					 left = windowLeft + left;
				}
				
				if(windowTop<0 || windowTop >= window.screen.height){
					top = windowTop + top;
				}
			 
			 var name = obj.name ? obj.name : "newwin";
			 var url = obj.url;
			 //默认不设置参数，不缓存加参数，如果设置true，则不加参数缓存请求
			 if(!obj.noCache){
				 if(url.indexOf("?")!=-1){
					 url += "&";
				 }else{
					 url +="?"
				 }
				 url +="aaaa="+new Date().getTime();
			 }
			 
			 
			 var newWin = window.open(url,name,'height='+height+', width='+width+', top='+top+', left='+left+', toolbar=no, menubar=no, scrollbars='+scrollable+',resizable='+resizeable+',location=no, status=no');
			 newWin.focus();
			 return newWin;			
		},
		/*
		 * 弹出模态窗口
		 * */
		winModalOpen:function(obj){
			var height = obj.height;
			var width = obj.width;
			var left =  obj.left || window.screen.availWidth/2 - width/2;
			var top = obj.top || window.screen.availHeight/2 -height/2;
			var name = obj.name ? obj.name : "newwin";
			 var url = obj.url;
			 //默认不设置参数，不缓存加参数，如果设置true，则不加参数缓存请求
			 if(!obj.noCache){
				 if(url.indexOf("?")!=-1){
					 url += "&";
				 }else{
					 url +="?"
				 }
				 url +="aaaa="+new Date().getTime();
			 }
				var windowLeft = window.screenLeft;
				var windowTop = window.screenTop;
				if(windowLeft<0 || windowLeft >= window.screen.width){
					 left = windowLeft + left;
				}
				
				if(windowTop<0 || windowTop >= window.screen.height){
					top = windowTop + top;
				}
			//window.showModalDialog('Noname2.html',window,'dialogWidth:400px;dialogHeight:400px');
			var popstyle="dialogTop:"+top+"px;dialogLeft:"+left+"px;help:no;center:no;dialogHeight:"+height+"px;dialogWidth:"+width+"px;status:no;resizable:no;scroll:no";
			window.showModalDialog(url,window,popstyle);
		},
		/*
		 * 显示无数据标签
		 * @param applyId 将提示标签应用到元素位置
		 * @param mini 如果为true，则为小提示
		 * @param text 提示信息
		 * */
		loadNoData:function(applyId,mini,text){
			var $append = $("#"+applyId);
			if($.isString(mini)){
				text = mini;
			}else if(!text){
				text = window.S_DATA_EMPTY;
			}
			
			
			var $nodata = $('<div class="nodata'+(mini===true? "-min":"")+'">'+text+'</div>');
			$append.html($nodata);
			$nodata.css({marginTop:$append.height()/2-$nodata.height()/2,marginLeft:$append.width()/2-$nodata.width()/2});
			return $nodata;
		}
		
		
    }
})();


function trim(string){
        return string.replace( /^[\s\r\n]*/,"");
}
 function ltrim(s){
    return s.replace( /^\s*/,"");
} 
 


/* sets the class of the tr containing the checked checkbox to selected */
function set_tr_class(element, selected) {
    if (selected) {
        element.attr("class", "selected " + element.attr("class"))
    } else {
        var css = element.attr("class");
        var position = css.indexOf('selected');

        element.attr("class", css.substring(position + 9));
    }
}

$(document).ready(function () {
    /* checks all the checkboxes within a table */
    $("table input[class=checkall]").live("click", function (event) {
        var checked = $(this).attr("checked");

        $("table input[type=checkbox]").each(function () {
            this.checked = checked;

            if (checked) {
                set_tr_class($(this).parent().parent(), true);
            } else {
                set_tr_class($(this).parent().parent(), false);
            }
        });
    });

    /* sets the class of the table tr when a checkbox within the table is checked */
    $("table input[type=checkbox]").live("click", function (event) {
        if ($(this).attr("checked")) {
            set_tr_class($(this).parent().parent(), true);
        } else {
            set_tr_class($(this).parent().parent(), false);
        }
    });
    handlePortletTools();
});

var handlePortletTools = function () {
    jQuery('body').on('click', '.portlet .tools a.remove', function (e) {
        e.preventDefault();
            var removable = jQuery(this).parents(".portlet");
            if (removable.next().hasClass('portlet') || removable.prev().hasClass('portlet')) {
                jQuery(this).parents(".portlet").remove();
            } else {
                jQuery(this).parents(".portlet").parent().remove();
            }
    });

    jQuery('body').on('click', '.portlet .tools a.reload', function (e) {
        e.preventDefault();
            var el = jQuery(this).parents(".portlet");
            App.blockUI(el);
            window.setTimeout(function () {
                    App.unblockUI(el);
                }, 1000);
    });

    jQuery('body').on('click', '.portlet .tools .collapse, .portlet .tools .expand', function (e) {
        e.preventDefault();
            var el = jQuery(this).closest(".portlet").children(".portlet-body");
            if (jQuery(this).hasClass("collapse")) {
                jQuery(this).removeClass("collapse").addClass("expand");
                el.slideUp(200);
            } else {
                jQuery(this).removeClass("expand").addClass("collapse");
                el.slideDown(200);
            }
    });
}

var Util = {
	jDom: function(dom) {
		if (Util.isString(dom)) {
			return $("#" + dom);
		} else {
			return $(dom);
		}
	},
	isString: function(o) {
		return Object.prototype.toString.call(o) === "[object String]";
	}
}	
var ZIndex = {
	index: 19891015,
	set: function(dom) {
		Util.jDom(dom).css("zIndex", ++this.index);
	},
	free: function() {
		this.index--;
	},
	get:function(){
		return ++this.index;
	}
}

Loading = {
	start: function() {
		MaskShaw.start('loading');
		var $loading = $('<div id="Loading" class="ui-ios-overlay ios-overlay-show"><span class="title">Loading</span><img src="'+webPath+'/resources/default/images/loading-90.gif"></div>');
		$(document.body).append($loading);
		ZIndex.set($loading);

	},
	stop: function() {
		MaskShaw.stop('loading');
		ZIndex.free();
		$("#Loading").fadeOut(600);
		setTimeout('$("#Loading").remove()', 700);
	}
}
MaskShaw = {
	start: function(id) {
		var $shadow = $('<div class="mask" id="mask' + (id || '') + '"></div>');
		$shadow.height($(document.body).height());
		//$shadow.css({"opacity":".3"});
		$(document.body).append($shadow);
		ZIndex.set($shadow);
	},
	stop: function(id) {
		$("#mask" + (id || '')).remove();
		ZIndex.free();
	}
}
