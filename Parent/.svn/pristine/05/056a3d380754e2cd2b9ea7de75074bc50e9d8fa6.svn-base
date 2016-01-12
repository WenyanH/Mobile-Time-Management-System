  var sechedule = {
      init: function(conf) {
          this.conf = conf;
          conf.lineSkip = conf.lineSkip || 1;
          var left = this.initTimeGrid(conf.hour, conf.minth, conf.rowCount, conf.lineSkip);
          var right = this.initRightGrid(conf.startDay, conf.periods, conf.daysPerPeriod, left.rowCount);
          var $scheduleDiv = $("#scheduleDiv");
          $scheduleDiv.html(left.dom + right);
          var $rightgrid = $scheduleDiv.children(':eq(1)');
          $rightgrid.css('width', $scheduleDiv.parent().width() - 51)
          var ths = $rightgrid.children(':first').find('th');
          $rightgrid.find('table').css('width', ths.length * 101);
          $scheduleDiv.find('.bottom').css('height', 400);
          $scheduleDiv.find('.rightgrid').children(':eq(1)').scroll(function() {
              $scheduleDiv.find('.leftgrid').children(':eq(1)')[0].scrollTop = this.scrollTop;
              $scheduleDiv.find('.rightgrid').children(':eq(0)')[0].scrollLeft = this.scrollLeft;
          });
          this.data = conf.data || [];



          for(var i =0;i < this.data.length;i++){            
               var sections = this.data[i].workSections;
               for(var j = 0;j<sections.length;j++){
                var section = sections[i];
                sechedule.renderSection(section.startTime,section.endTime,section.startTimeType == 'Previous' ? true:false,section.endTimeType == 'NextDay' ? true : false,section.departmentName);
               }            
          }









          $("#upTime").click(function(event) {
             event.stopPropagation();
              if (conf.lineSkip == 0.5) {
                  return;
              } else if (conf.lineSkip == 4) {
                  conf.lineSkip = 2;
              } else if (conf.lineSkip == 2) {
                  conf.lineSkip = 1;
              } else if (conf.lineSkip == 1) {
                  conf.lineSkip = 0.5;
              }
              conf.data = sechedule.data;
              sechedule.init(conf);
          });
          $("#downTime").click(function(event) {
             event.stopPropagation();
              if (conf.lineSkip == 4) {
                  return;
              } else if (conf.lineSkip == 0.5) {
                  conf.lineSkip = 1;
              } else if (conf.lineSkip == 1) {
                  conf.lineSkip = 2;
              } else if (conf.lineSkip == 2) {
                  conf.lineSkip = 4;
              }
              conf.data = sechedule.data;
              sechedule.init(conf);
          });
          $scheduleDiv.find('.rightgrid').find("th").click(function(event) {
              //openSection($(this));
              var x = event.pageX;
              var y = event.pageY;
              event.stopPropagation();
              var $th = $(this);
              $th.css('position', 'relative');
               $(document.body).find('ul.menulist').remove();
              var menu = $('<ul class="dropdown-menu menulist" style="display:block;position:absolute;left:'+x+'px;top:'+y+'px;"><li><a href="#">Day Modify</a></li></ul>');
              menu.click(function(event) {
                  event.stopPropagation();
                  sechedule.modifydaytitle = $th.children('.weekname').text();
                  sechedule.samdaycount = $th.index();
                  sechedule.$daycolumnTh = $th;
                  $(document.body).find('ul.menulist').remove();
                  $.layer({
                      type: 1,
                      title: "Day Modify",
                      area: ['525px', '336px'],
                      offset: ['100px', ''],
                      page: {
                          url: webPath + '/schedule/dailySettings?pjax=true'
                      },
                      zIndex: 2500,
                      success: function() {}
                  });
              });
              $(document.body).append(menu)
          });


          $scheduleDiv.find('.leftgrid').click(function(event) {
              
              var x = event.pageX;
              var y = event.pageY;
              event.stopPropagation();
              var $th = $(this);
              $th.css('position', 'relative');
              $(document.body).find('.menulist').remove();
              var menu = $('<ul class="dropdown-menu menulist" style="display:block;position:absolute;left:'+x+'px;top:'+y+'px;"><li><a href="#">Set Time Range</a></li></ul>');
              menu.find('li').click(function(event) {
                  event.stopPropagation();
                  sechedule.modifydaytitle = $th.children('.weekname').text();
                  sechedule.daycolumn = $th.index();
                  $(document.body).find('ul.menulist').remove();
                  $.layer({
                      type: 1,
                      title: "Set Time Range",
                      area: ['525px', '200px'],
                      offset: ['100px', ''],
                      page: {
                          url: webPath + '/schedule/timeRange?pjax=true'
                      },
                      zIndex: 2500,
                      success: function() {}
                  });
              });
              $(document.body).append(menu);
          });


          $scheduleDiv.find('.rightgrid').find('td').click(function(event) {
              //
              var $th = $("#s .rightgrid th:eq(" + $(this).index() + ")");
              var index = $th.index();
              var week = $th.attr("week");
              var x = event.pageX;
              var y = event.pageY;
              event.stopPropagation();
              var $th = $(this);
              $(document.body).find('ul.menulist').remove();
              sechedule.daycolumn = $th.index();

              $th.css('position', 'relative');
              $scheduleDiv.find('.menulist').remove();


              var menu = $('<ul class="dropdown-menu menulist" style="display:block;position:absolute;left:'+x+'px;top:'+y+'px;"><li><a href="#">New Section</a></li></ul>');
              menu.find('li').click(function(event) {
                  event.stopPropagation();
                 
                  menu.remove();
                  $.layer({
                      type: 1,
                      title: "New Section",
                      area: ['525px', '300px'],
                      offset: ['100px', ''],
                      page: {
                          url: webPath + '/schedule/section?pjax=true'
                      },
                      zIndex: 2500,
                      success: function() {}
                  });
              });
              $(document.body).append(menu);
          });
      },
      initTimeGrid: function(hour, minth, rowCount, lineSkip) {
          var dom = [];
          dom.push('<div class="leftgrid" >');
          dom.push('  <table class="top">');
          dom.push('      <thead class="thead">');
          dom.push('          <tr>');
          dom.push('              <th style="vertical-align:middle">');
          dom.push('<div  id="upTime"><i class="icon-zoom-in" style="font-size:25px;"></i></div>');
          dom.push('<div id="downTime" ><i class="icon-zoom-out" style="font-size:25px;"></i></div>');
          dom.push('              </th>');
          dom.push('          </tr>');
          dom.push('      </thead>');
          dom.push('  </table>');
          dom.push('  <div class="bottom" >');
          dom.push('      <table>');
          dom.push('          <tbody>');
          var row = 0;
          for (var i = 0; i < rowCount;) {
              i = i + lineSkip;
              row++;
              dom.push('        <tr>');
              dom.push('            <td width="50" class="time">' + hour + ":" + minth + '</td>');
              dom.push('        </tr>');
              minth = minth + 60 * lineSkip;
              if (minth / 60 >= 1) {
                  hour = hour + parseInt(minth / 60);
              }
              minth = minth % 60;
              if (hour == 24) {
                  hour = 0;
              }
          }
          dom.push('            </tbody>');
          dom.push('</table></div>');
          dom.push('</div>')
          return {
              dom: dom.join(''),
              rowCount: row
          };
      },
      initRightGrid: function(startDay, periods, daysPerPeriod, rowCount) {
          if (startDay) {
              startDay = startDay - 1;
          } else {
              startDay = 0;
          }
          var weeks = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
          var dom = [];
          dom.push('<div class="rightgrid" >');
          dom.push('    <div style="overflow-x:hidden;overflow-y:scroll" >');
          dom.push('        <table class="thead">');
          dom.push('            <thead>');
          dom.push('                <tr>');
          for (var j = 1; j <= daysPerPeriod; j++) {
              for (var i = 1; i <= periods; i++) {
                  dom.push('<th week="' + startDay + '" style="width:100px"><div class="weekname">' + weeks[startDay] + '</div><div class="breaktime " style="display:none"></div><div class="dayoff text-error" style="display:none">Day off</div></th>');
                  if (startDay == 6) {
                      startDay = 0;
                  } else {
                      startDay++;
                  }
              }
          }
          dom.push('                </tr>');
          dom.push('            </thead>');
          dom.push('        </table>');
          dom.push('    </div>');
          dom.push('    <div class="bottom" style="overflow:scroll">');
          dom.push('        <table><tbody>');
          for (var i = 0; i < rowCount; i++) {
              dom.push('          <tr>');
              for (var j = 0; j < daysPerPeriod * periods; j++) {
                  dom.push('<td  style="width:100px"></td>');
              }
              dom.push('          </tr>');
          }
          dom.push('        </tbody></table>');
          dom.push('    </div>');
          dom.push('</div>');
          return dom.join('')
      },
      addSection: function(startTime, endTime, prev, next,position,positionValue) {
          sechedule.renderSection(startTime, endTime, prev, next,position);
          var dayData = this.data[sechedule.daycolumn];         
          
          if(!dayData){
             this.data[sechedule.daycolumn] = {};
          }
          if(!this.data[this.daycolumn].workSections){
            this.data[this.daycolumn].workSections = [];
          }
          this.data[this.daycolumn].workSections.push({startTime:startTime,endTime:endTime,startTimeType:prev ? 'Previous' : 'Today',endTimeType:next ? 'NextDay' : 'Today',departmentId:positionValue,departmentName:position});
          
      },
      modifySection:function(){
         sechedule.sectionDiv.remove();
         var section = sechedule.modifyworksection;

         sechedule.data[sechedule.sectionindex[0]].workSections[sechedule.sectionindex[1]] = sechedule.modifyworksection;
         delete sechedule.modifyworksection;

         sechedule.renderSection(section.startTime,section.endTime,section.startTimeType,section.endTimeType,section.departmentName);
      },
      renderSection:function(startTime, endTime, prev, next,position){
          var cha = sechedule.shiijancha(startTime, endTime, prev, next);
          //sechedule.hour;
          // sechedule.minutes;
          var beginday = 2;
          if (prev) {
              beginday = 1;
          }
          var gridbegin = 2 + (sechedule.dayStartType == 'Previous' ? -1 : 0);
          var begindate = new Date('2008-01-0' + beginday + ' ' + startTime).getTime();
          var gridbegindate = new Date('2008-01-0' + gridbegin + ' ' + sechedule.conf.hour + ":" + sechedule.conf.minth).getTime();
          var trIndex = 0;
          if (begindate > gridbegindate) {
              trIndex = sechedule.char(begindate - gridbegindate)
          }
          trIndex--;
          cha--;
          if (sechedule.conf.lineSkip == 0.5) {
              trIndex = trIndex * 2;
              cha = cha * 2;
          } else if (sechedule.conf.lineSkip == 2) {
              trIndex = trIndex / 2;
              cha = cha / 2;
          } else if (sechedule.conf.lineSkip == 4) {
              trIndex = trIndex / 4;
              cha = cha / 4;
          }
          var $div = $('<div class="section" style="height:' + (cha * 27) + 'px"><div>'+startTime+'-'+endTime +'</div><div>'+position+'</div></div>');

          trIndex = trIndex < 1 ? 0 : trIndex;
          $("#scheduleDiv").find('.rightgrid .bottom tr:eq(' + trIndex + ')').find('td:eq(' + sechedule.daycolumn + ')').append($div);

          $div.click(function(event){
            var x = event.pageX;
              var y = event.pageY;
             event.stopPropagation();
             sechedule.sectionDiv = $(this);
             var menu = $('<ul class="dropdown-menu menulist" style="display:block;position:absolute;left:'+x+'px;top:'+y+'px;"><li type="Modify"><a href="#" >Modify Section</a></li><li type="delete"><a href="#">Delete Section</a></li></ul>');
              menu.find('li').click(function(event){
                  var type = $(this).attr("type");
                  var tdindex = $div.parent().index();
                  var index = $div.index();
                  
                  sechedule.sectionindex = [tdindex,index];
                  sechedule.modifyworksection = sechedule.data[tdindex].workSections[index];
                  if(type == 'Modify'){
                    $.layer({
                      type: 1,
                      title: "Modify Section",
                      area: ['525px', '260px'],
                      offset: ['100px', ''],
                      page: {
                          url: webPath + '/schedule/section?pjax=true'
                      },
                      zIndex: 2500,
                      success: function() {}
                  });
                  }else{
                    argusConfirm("Confirm delete?", function(result) {
                    if (result) {
                           
                            sechedule.data[tdindex].workSections.splice(index, 1);
                            $div.remove();
                        }
                    });
                  }
              });
              $(document.body).append(menu);
          });
      },
      shiijancha: function(beginTimeRange, endTimeRange, prev, next) {
          var beginday = 2;
          if (prev) {
              beginday = 1;
          }
          var beginTime = new Date('2008-01-0' + beginday + ' ' + beginTimeRange);
          var endday = 2;
          if (next) {
              endday = 3;
          }
          var endTime = new Date('2008-01-0' + endday + ' ' + endTimeRange);
          var cha = endTime.getTime() - beginTime.getTime();
          return sechedule.char(cha);
      },
      char: function(cha) {
          var days = Math.floor(cha / (24 * 3600 * 1000))
          var leave1 = cha % (24 * 3600 * 1000)
              //计算天数后剩余的毫秒数
          var hours = Math.floor(leave1 / (3600 * 1000))
              //计算相差分钟数
          var leave2 = leave1 % (3600 * 1000)
              //计算小时数后剩余的毫秒数
          var minutes = Math.floor(leave2 / (60 * 1000))
          return days * 24 + hours + 1;
      },
      setmodifyday: function(isOffDay,breaktime,title) {
          var dayData = this.data[sechedule.$daycolumnTh.index()];
          if(dayData){
            dayData.isOffDay = isOffDay;
            dayData.breaktime = breaktime;
            dayData.title = title;
          }else{
            this.data[this.$daycolumnTh.index()] = {
              isOffDay: isOffDay,
              breakTime : breaktime,
              title : title
            }
          }
          
          if (isOffDay) {
              sechedule.$daycolumnTh.children('.dayoff').show()
          } else {
              sechedule.$daycolumnTh.children('.dayoff').hide()
          }

          if(breaktime){
             sechedule.$daycolumnTh.children('.breaktime').html(breaktime).show();
          }
      }
  }

$(function(){
    $(document.body).click(function(){
    $("ul.menulist").remove();
  })
})
