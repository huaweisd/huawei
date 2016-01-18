var login_state = 0;
var qiandao = 0;
$.extend({
    _log: function(message) {
        window.console && window.console.log(message);
    },
	// 获取旧广告
    _getAdvert: function(index) {
        $.ajax({
            type: "POST",
            url: "http://boss.ywy7.com/tms/index/querytAdvert.do",
            data: "tType=" + index,
            success: function(msg) {
                $.each(msg.result, function(i, m) {
					$(".advert_"+m.tindex).empty();
                    $(".advert_"+m.tindex).append($("<img/>").attr({title:m.ttitle,src:getImgUrl(m.timg),tag:m.turl}).css({width:$(".advert_"+m.tindex).width(),height:$(".advert_"+m.tindex).height()})
                    		.bind("click", function() {window.open($(this).attr('tag'));})
					);
                })
            }
        });
    },
    // 获取新广告
	_getNewAdvert: function(index) {
        $.ajax({
            type: "POST",
            url: "http://boss.ywy7.com/tms/index/querytAdvert.do",
            data: "tType=" + index,
            success: function(msg) {
                $.each(msg, function(i, m) {
					$("img","li[ggtag="+m.tindex+"]").attr({src:getImgUrl(m.timg),tag:m.turl,title:m.ttitle}).bind("click", function() {
						window.open($(this).attr('tag'));
					});
					$("img","div[ggtag="+m.tindex+"]").attr({src:getImgUrl(m.timg),tag:m.turl,title:m.ttitle}).bind("click", function() {
						window.open($(this).attr('tag'));
					});
                })
            }
        });
    },
	// 获取友情链接数据
	_getFrendLink: function() {
        $.ajax({
            type: "POST",
            url: "http://boss.ywy7.com/tms/index/querytFriendLink.do",
            success: function(msg) {
				$("ul","#link_nr").empty();
				$("ul","#link_nr").css({
					height:"90px",
					overflow:"hidden",
					float:'left'
				});
				$("ul","#link_nr").append("<div id='link-content' style='top:0px;position:relative;width:1100px;'/>");
                $.each(msg, function(i, m) {

                	$("#link-content").append($("<a target='_blanck' href=http://" + m.titleLink +"></a>").html(m.title));
                });
                $("ul","#link_nr").parent().append($("<div id='up-down'/>").css({
                	width:"20px",
                	height:"50px",
                	float:"left",
                	"margin-top":"5px"
                }).append("<a id='up' style='width:20px;height:20px;background-image:url(http://boss.ywy7.com/html/images/ico_tool_off_up.jpg);display:block'></a>").append("<a id='down' style='margin-top:10px;width:20px;height:20px;display:block;background-image:url(http://boss.ywy7.com/html/images/ico_tool_off_down.jpg)'></a>"));
                $("#up").click(function (){
                	$("#link-content").stop(true,true);
                	var top = Math.abs(parseInt($("#link-content").css("top")));
                	if(top){
                		$("#link-content").animate({"top":((top-30)*(-1))+"px"});
                	}
                	
                }).hover(function (){
                	$(this).css({"background-image":"url(http://boss.ywy7.com/html/images/ico_tool_on_up.jpg)"});
                	
                },function (){
                	$(this).css({"background-image":"url(http://boss.ywy7.com/html/images/ico_tool_off_up.jpg)"});
                });
                $("#down").click(function (){
                	$("#link-content").stop(true,true);
                	var contentHeight = parseInt($("#link-content").css("height"));
                	var top = Math.abs(parseInt($("#link-content").css("top")));
                	var lHeight =  parseInt($("ul","#link_nr").css("height"));
                	if(contentHeight-top <= lHeight ){
                		return;
                	}
                	$("#link-content").animate({"top":((top+30)*(-1))+"px"});
                }).hover(function (){
                	$(this).css({"background-image":"url(http://boss.ywy7.com/html/images/ico_tool_on_down.jpg)"});
                	
                },function (){
                	$(this).css({"background-image":"url(http://boss.ywy7.com/html/images/ico_tool_off_down.jpg)"});
                });
                
            }
        });
		//版权页脚
	    $._setPageFooter();
    },
	//设置页脚
	_setPageFooter: function(index) {
        $("#copyright").append('<a href="/tms/html/aboutUs.htm">关于我们</a> <a href="/tms/html/aboutUs.htm">悦玩诚聘</a> <a href="/tms/html/aboutUs.htm">联系我们</a>'+
		' <a href="/tms/html/aboutUs.htm">应用提交</a> <a href="/tms/html/aboutUs.htm">网站里程</a> <a href="/tms/html/aboutUs.htm">网站合作</a> <a href="#">网站地图</a> '+
			' 	<br /> <a href="http://www.miitbeian.gov.cn" target="_blank">苏ICP备15017851号-1</a>'+
			' 南京天天悦玩网络科技有限公司<br /> 版权所有 © 2012-2014 ywy7.com 悦玩网 江苏省通信管理局<br /> <a'+
			' 	href="http://www.ywy7.com"><img src="webviews/common/img/footer_logo.jpg" width="146"'+
			' 	height="53" style="padding-top: 10px;" /></a> <a href="http://www.njga.gov.cn/"'+
			' 	target="_blank"><img src="webviews/common/img/footer_bjpt.jpg" width="120"'+
			' 	height="53" style="padding-top: 10px;" /></a>');
    },
	//获取url中的参数
	_getUrlParam: function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return (r[2]);
		return null;
	},
    //获取多图联动
	_getLiandong:function(gameType) {},
	//美女图片
	_getGirl:function() {
		$("#area_girl_wall").append('<div class="area-title">拍谁谁火</div><a class="area-more" target="_blank"></a><div class="clearfix container"><a class="girl-item girl-group-1 the_girl_0" target="_blank"> <img src="" /><p></p></a> <a class="girl-item girl-group-2  the_girl_1" target="_blank"> <img			src="" /><p></p></a> <a class="girl-item girl-group-3 the_girl_2" target="_blank"> <img	src="" />	<p></p>	</a> <a class="girl-item girl-group-4 the_girl_3" target="_blank"> <img		src="" />			<p></p>	</a><div class="girl-group-5"><a class="girl-item the_girl_4" target="_blank"> <img src="" />	<p></p></a> <a title="" class="girl-item the_girl_5" target="_blank"> <img	src="" /><p></p>			</a></div><a class="girl-item girl-group-6 the_girl_6" target="_blank"> <img src="" /><p></p></a> <a class="girl-item girl-group-7 the_girl_7" target="_blank"> <img src="" /><p></p></a></div>');
		$.ajax({
	        type: "POST",
	        url: "http://boss.ywy7.com/tms/index/querytImages.do",
	        data: {
	            "order": "T_INDEX asc",
				"tType":1,
	            "perNumber": 8
	        },
	        success: function(msg) {
	            $.each(msg,function(i, m) {
	               $(".the_girl_"+i).attr({title:m.tdesc});
				   $("img",".the_girl_"+i).attr({src:getImgUrl(m.turl),tlink:m.tlink}).bind("click", function(){
					   window.open(getLinkUrl('news')+'news/psshxq/'+m.id+'.htm');
				   });
				   $("p",".the_girl_"+i).html(m.tdesc);
	            });
	        }
		});
    },
  _DateFormat:function(date,fmt){ //author: meizz   
	  var o = {   
		"M+" : date.getMonth()+1,                 //月份   
		"d+" : date.getDate(),                    //日   
		"h+" : date.getHours(),                   //小时   
		"m+" : date.getMinutes(),                 //分   
		"s+" : date.getSeconds(),                 //秒   
		"q+" : Math.floor((date.getMonth()+3)/3), //季度   
		"S"  : date.getMilliseconds()             //毫秒   
	  };   
	  if(/(y+)/.test(fmt))   
		fmt=fmt.replace(RegExp.$1, (date.getFullYear()+"").substr(4 - RegExp.$1.length));   
	  for(var k in o)   
		if(new RegExp("("+ k +")").test(fmt))   
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	  return fmt;   
  },
  _ffsize:function(str,length){
	  if(str && str.length> length){
		  str = str.substring(0,length)+"...";
	  }
	  return str;
  },
   _loadLog:function(){
	   
	   $("body").eq(0).prepend($("<div/>").attr({id:"login_container","style":"width: 100%; position: relative"}).append(
			   $("<div/>").attr({id:"loginmodal","style":"display: none; width: 600px; position: absolute; left: 0; top: 0"}).append(
					   $("<div/>").attr({id:"login_left"}).append($("<ul/>").append($("<li/>").attr({"ggtag":"26"}).append($("<img/>").attr({
						   src:"webviews/common/img/login_pic.jpg",width:"142",height:"170"}))
						   ).append($("<li/>").append($("<img/>").attr({
						   src:"webviews/common/img/login_logo.jpg",width:"142", height:"86"}))
					   )))
				.append($("<div/>").attr({id:"login_right"}).append($("<ul/>").append($("<form>").attr({
					id:"formID",method:"post"}).append(
							$("<li/>").attr({"style":"font-size: 20px; font-family: '微软雅黑'; color: #2f88e2; border-bottom: 1px solid #999;"}).text("悦玩网登陆中心")
						.append($("<i/>").addClass("hidemodal login_close").attr({title:"关闭"}).text("×"))).append(
							$("<li/>").text("悦玩网安全中心：http://www.ywy7.com")).append(
							$("<li/>").append($("<input/>").attr({"id":"loginName","name":"loginName","type":"text","placeholder":"用户名","data-validation-engine":"validate[required]",
									"data-errormessage-value-missing":"用户名不能为空"}).addClass("txt01")).append($("<a/>").attr({href:"register.htm"}).append($("<font/>").attr({
									"style":"font-size: 14px; color: #F00; font-family: '微软雅黑';"}).text("注册新账号")))).append(
							$("<li/>").append($("<input/>").attr({"name":"password","placeholder":"密码","data-validation-engine":"validate[required]",
									"data-errormessage-value-missing":"密码不能为空","type":"password"}).addClass("validate[required] txt02")).append($("<a/>").attr({href:"#"}).append(
									$("<font/>").attr({"style":"font-size: 14px; color: #2f88e2; font-family: '微软雅黑';"}).text("忘记密码？")))).append(
							$("<li/>").append($("<input/>").attr({"name":"","type":"checkbox"})).append(" 自动登陆 快捷登陆：").append($("<img/>").attr({
									"src":"webviews/common/img/login_icon01.jpg","width":"24","height":"24"})).append($("<img/>").attr({"src":"webviews/common/img/login_icon02.jpg","width":"24","height":"24","style":"margin-left:5px;"}))
									.append($("<img/>").attr({"src":"webviews/common/img/login_icon03.jpg","width":"24","height":"24","style":"margin-left:5px;"}))).append(
							$("<li/>").append($("<input/>").attr({"id":"loginbut","type":"button"}).addClass("btn"))				
					)
				)))
			));
	   
	   $.ajax({
           type: "POST",
           url: "http://boss.ywy7.com/tms/tAdvert/getList.l",
           data: "tType=26",
           success: function(msg) {
               if (msg.code > 0) {
                   $.each(msg.result, function(i, m) {
						$("img","li[ggtag="+m.tindex+"]").attr({src:getImgUrl(m.timg),tag:m.turl,title:m.ttitle}).bind("click",
								function() {
									window.open($(this).attr('tag'));
								});
                   })
               }
           }
       });

   },

   _initHeader: function() {
	   var logReg = $("<div/>").attr({id:"dlzc"}).append($("<ul/>")
			   .append($("<li/>").addClass("dl").append($("<a/>").attr({
				   href:"#loginmodal",
				   id:"login_mian"
			   }).addClass("login_mian").text("安全登录"))).append($("<li/>").addClass("zc").append($("<a/>").attr({
				   href:"http://www.ywy7.com/index/register.htm"
			   }).text("立即注册"))));
	  
	   var tmps;
	   $.ajax({
	        type: "POST",	       
	        url: "http://boss.ywy7.com/tms/tUser/sysUtil.l",
	        //async: false,
	        success: function(msg) {
	        	tmps = msg;
	        	if(msg&&msg.code=="0"){
	        		login_state = 1;
					qiandao = msg.obj.qianDao;
	        		var imgtop = (msg.obj.timg!=null?(msg.obj.timg):('fileimg/1.jpg'));

	        		var info = $("<div/>").attr({
	        			id:"userinfo"
	        		}).append($("<ul/>").attr({id:"jsddm"}).append($("<li/>").append(
	        				$("<a/>").attr({
	    	        			title:msg.obj.loginName,
	    	        			href:"#",
	    	        			id:"userlists"
	    	        		}).append($("<img/>").attr({
	    	    	        			src:imgtop,
	    	    	        			width:"20px",
	    	    	        			height:"20px"
	    	        		})).append($("<span/>").text(" "+msg.obj.loginName))
	    	        		.append($("<span/>").css({"color":"#999"}).text(" ▼ ")))
    	        		.append($("<ul/>").append($("<li/>").append($("<a/>").attr({
    	        			href:"#"
    	        		}).text("金币："+(msg.obj.ncoin == null ? 0 : msg.obj.ncoin) )) ).append($("<li/>").append($("<a/>").attr({
    	        			href:"info.htm"
    	        		}).text("我的礼包")) ).append($("<li/>").append($("<a/>").attr({
    	        			href:"#"
    	        		}).text("我的信息")) ).append($("<li/>").append($("<a/>").attr({
    	        			href:"#"
    	        		}).text("修改密码")) ))	        				
	        		
	        		)).bind("mouseover",$._jsddm_open).bind("mouseout",$._jsddm_timer);	        		
	        		
	        		$("#dlzc").empty().append($("<ul/>")
    				.append($("<li/>").addClass("tc").append($("<a/>").attr({
        					href:"/tms/tUser/web_logOut.l",
        					id:"login_mian"
				   }).text("[退出]"))).append(
						   $("<li/>").addClass("zc").append($("<a tag='qiandao'/>").attr({
					   href:"###"
				   }).text("签到")).bind("click",function(){
					   if(qiandao == 1)
					   {
						   alert("今日已签到！");
						   return false;
					   }
					   
					   if(login_state == 1)
					   {
						    $._qiandao();
					   }
					   else{
						    alert("请先登录！");
					   }
					  
				   }))).after(info);       		
	        		 
	        			        		
	        	}
				
				if( qiandao == 1)
				{
					$("a[tag='qiandao']").html("已签到");
					$("#t_qd").html('<font color="#eb8519">已签到</font>');
					 $("#t_qd").bind("click",function(){
						 $("a[tag='qiandao']").click();
					 })
				}
				$._indexUserinfo(tmps);
				
	        	document.onkeydown=function(event){
	        		e = event ? event :(window.event ? window.event : null);
	        		if(e.keyCode==13&&msg.code!="0"){
	        			$("#loginbut").click();
	        		}
        		};
	        	
	        }
	   });	   
	   
	  // $._indexUserinfo(tmps);
	   
	   $("#top01").append('<div id="yww"><a href="http://www.ywy7.com">悦玩网</a></div><div id="sc"><ul><li><a href="javascript:;" id="domainurl">加入收藏</a></li><li>|</li><li><a href="javascript:;" id="sethomes">设为首页</a></li><li>|</li>          <li><a href="#">意见反馈</a></li>        </ul>    </div>').append(logReg);
	   
	   $("#ny_logo_search").append('<div id="ny_logo"><a href="index.htm"><img src="webviews/common/img/logo_xy.jpg"height="120" width="360"></a></div><div id="ny_search"></div>');
	   
	   //<form> <span class="s_ipt_wr"><select id="search_type"><option value="">全部</option><option value="1">游戏</option><option value="7">礼包</option><option value="3">攻略</option></select><input name="wd" id="kw" maxlength="100" class="s_ipt" type="text" placeholder="请输入搜索内容"></span><input id="query_btn" name="" class="btn" value="" type="button"> </form>
	   
	   $("#query_btn").bind("click",function(){
		   var qtype = $("#search_type").val();
		   var skey = $("#kw").val();
		   location.href="soushou.htm?qtype="+qtype+"&skey="+skey;
	   });
   },
   _qiandao:function()
   {
	    $.ajax({
	        type: "POST",	       
	        url: "http://boss.ywy7.com/tms/tUser/qianDao.l",
	        success: function(msg) {
				     login_state = 1;
					 qiandao = 1;
					 $("#ncoin").html(msg.obj.ncion);
					$("a[tag='qiandao']").html("已签到");
					$("#t_qd").html('<font color="#eb8519">已签到</font>');
					 $("#t_qd").bind("click",function(){
			           $("a[tag='qiandao']").click();
		            })
				
			}
		});
   },
   _packageType:function(key)
   {
	   var params = {		                
			"1":"推荐礼包",
			"2":"最热礼包",
			"3":"最新礼包",
			"4":"特价礼包",
			"5":"独家礼包"		   
	   }
	   return params[key];
	   
   },
   _systemType:function(key)
   {
	   var params = {		                
			"1":"IOS",
			"2":"安卓",
			"3":"WP",
			"4":"HMTL"  
	   }
	   return params[key];
   },
    _testState:function(key)
   {
	   if(key)
	   {
		
	   var params = {		                
			"1":"公测",
			"2":"内测",
			"3":"封测"	   
	   }
	   return params[key];
	   }else {
		   return "其它"
	   }
   },
     _gameState:function(key)
   {
	   if(key)
	   {

	   var params = {		                
			"1":"开测",
			"2":"开服",
			"3":"期待"	   
	   }
	   return params[key];
	   }else {
		   return "其它"
	   }
   },
     _systemImg:function(key)
   {
	   var params = {		                
			"1":"windows",
			"2":'<a class="ios" href=""/>',
			"3":'<a class="Android" href=""/>',
            "4":'<a class="ios" href=""/><a class="Android" href=""/>'			
	   }
	   return params[key];
   },
     _systemImg1:function(key)
   {

	   var params = {		                
			"1":'<img src="http://boss.ywy7.com/html/images/lb_pot03.jpg" width="14" height="14" />',
			"2":'<img src="http://boss.ywy7.com/html/images/lb_pot01.jpg" width="14" height="14" />',
			"3":'<img src="http://boss.ywy7.com/html/images/lb_pot02.jpg" width="14" height="14" />',
            "4":'<img src="http://boss.ywy7.com/html/images/lb_pot01.jpg" width="14" height="14" /> <img src="http://boss.ywy7.com/html/images/lb_pot02.jpg" width="14" height="14" />'			
	   }
	   return params[key];
   },
   
   
   _getBackGround:function()
   {
	   if(document.body.clientWidth <= 1180){
		   $('#bg').css('margin-top', '0');
		   return;
	   }
	   $.ajax({
	       type: "POST",
           url: "http://boss.ywy7.com/tms/index/querytAdvert.do",
           data: {tType:28},
	        success: function(msg) {
	        	var turl = '';
	        	var tlink = '';
	        	var tin4 = 0;
	        	$.each(msg, function(i, m){
	        		if(m.tindex == 4){
	        			tin4++;
	        			turl = m.timg;
	        			tlink = m.tlink;
	        		}
	        	})
	        	if(tin4 == 0){
	        		$("#bg").attr({"style":"margin-top:0px"});
	        		return;
	        	}
					$('#backImg').attr('style', 'width:100%;margin:0 auto;clear:both;position:absolute;top:0;left:0;background:url('+getImgUrl(turl)+') 50% 0 no-repeat;z-index:-100;display:block;');
					$('#backImg').append('<div id="clickImg" style="margin:0 auto;clear:both;height:800px;position:absolute;top:0;left:50%;z-index:-100;"><a target="_blank" href="'+tlink+'" style="position:absolute;left:-860px;width:1720px;height:800px;z-index:-99;clear:both;"></a><img id="closebackground" src="http://boss.ywy7.com/html/images/close.png" style="position:absolute;right:-860px;" /></div>')
					if(document.body.clientWidth >= 1720){
						$('#clickImg').find('a').width(1720);
						$('#closebackground').css('right', -1720/2+'px');
					}
					if(document.body.clientWidth < 1720 && document.body.clientWidth > 1180){
						$('#clickImg').find('a').width(document.body.clientWidth);
						$('#closebackground').css('right', -document.body.clientWidth/2+'px');
					}
					$("#closebackground").bind("click",function(){
						   $('#backImg').css('background', 'url()');
						   $('#bg').css('margin-top', '0');
						   $(".background_close").hide();
						   $('#clickImg').hide();
					   });
			}
		});
   },
   _gameType:function(key){
	   var params = {		                
			"1":"益智休闲", 
			"2":"角色扮演", 
			"3":"运动跑酷", 
			"4":"策略模拟", 
			"5":"动作射击", 
			"6":"竞技竞速", 
			"7":"冒险闯关", 
			"8":"桌游棋牌", 	
			"9":"卡牌游戏", 
			"10":"小编精选"
	   }
	   return params[key];
   },
   _getGameType: function(keys){
	   var result = '';
	   var key = keys.split(',');
	   for(var i = 0; i < key.length; i++){
		   result += ' ' + $._gameType(key[i]);
	   }
	   return result;
   },
   _getGameLanguage: function (key){
	   		var params = {		                
				"1":"中文", 
				"2":"英文", 
				"3":"其他"
		   };
		   return params[key];
   },
   _getGamePrice: function (key){
  		var params = {		                
			"1":"收费", 
			"2":"免费", 
			"3":"限免"
	   };
	   return params[key];
   },
   _jsddm_open:function()
   {	
   	$(this).find('li').eq(0).find('ul').eq(0).css('visibility', 'visible');
   },
   _jsddm_timer:function(){
	   $(this).find('li').eq(0).find('ul').eq(0).css('visibility', 'hidden');
   },
	_includeJS:function(os){
		var oHead = document.getElementsByTagName('HEAD').item(0);	
		$.each(os,function(i,n){
			var oScript= document.createElement("script");
			oScript.type = "text/javascript";
			oScript.src=n;
			oHead.appendChild(oScript);			
		});
	},
	_includeCss:function(os){

		$.each(os,function(i,n){			
			$("head").append("<link>");
			a = $("head").children(":last");
			a.attr({
				rel: "stylesheet",
				type: "text/css",
				href: n
			});
		});
	},
	_indexUserinfo:function(data){
		
		var obj = $("<ul/>");
		if(data&&data.code=="0"){
			var imgtop = (data.obj.timg!=null?(data.obj.timg):('fileimg/1.jpg'));	
			obj.append($("<li/>").css({"font-size":"14px"}).html("HI,"+data.obj.loginName+"。<br/>欢迎来到悦玩网~").prepend($("<img/>")
					.attr({"height":"70","width":"70","style":"float: left; margin-right: 10px; border-radius: 10px;","src":imgtop}))).append(
					$("<li/>").attr({"style":"background: url(images/mem_bg.jpg) no-repeat; width: 242px; height: 66px;"})
							.append($("<p/>").attr({"style":"float: left; margin: 0px 20px; padding: 0 20px; text-align: center; "}).append(
									$("<span/>").attr({"style":"display: block; font-weight: bold; font-size: 14px;"}).text("N币"))
									.append($("<span id='ncoin'/>").attr({"style":"color: #eb8519; font-size: 18px; font-weight: normal;"})
											.text(data.obj.ncoin == null ? 0:(data.obj.ncoin))))
									.append($("<span/>").attr({"style":"float: right; text-align: center; width: 100px; margin-right: 20px; font-size: 30px; font-weight: normal; line-height: 50px;"})
											.html('<a id="t_qd"><font color="#eb8519">'+$("a[tag='qiandao']").text()+'</font></a>')));
		}else{
			
			var login = $("<a/>").attr({
				href:"#loginmodal",
				id:"login_main_login",
				"style":"background: #eb8519; padding: 8px 20px;"
			}).addClass("login_mian").append($("<font/>").attr({
				"color":"#FFFFFF"
			}).text("登录"));
			
			obj.append(
					$("<li/>").css({"font-size":"14px"}).html("HI!欢迎来到悦玩网<br/>您还未登录呦！").prepend($("<img/>")
							.attr({"height":"70","width":"70","style":"float: left; margin-right: 10px;","src":"http://boss.ywy7.com/html/images/mem_tx.jpg"})))
					.append($("<li/>").attr({"style":"text-align: center;"}).append($("<span/>").append(login))
					.append($("<span/>").attr({"style":"margin-left: 25px; "}).html('<a href="../html/register.htm" style="background: #eb8519;padding: 8px 20px;"><font color="#FFFFFF">注册</font></a>')));
		}
		$("#mem").empty().append(obj);
		
		 $('.login_mian').leanModal({ top: 110, overlay: 0.45,closeButton: ".hidemodal" });
		 
		 $("#t_qd").bind("click",function(){
			 $("a[tag='qiandao']").click();
		 })
	},
	
	_removeHTMLTag:function(str){
		str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
	    str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
	    str=str.replace(/ /ig,'');//去掉 
	    return str;
	}
});

$(function (){
	
	var jsos = [
			"http://boss.ywy7.com/html/js/jquery.leanModal.min.js",
			"http://boss.ywy7.com/html/js/jquery.validationEngine.js",
			"http://boss.ywy7.com/html/js/languages/jquery.validationEngine-zh_CN.js"
		];
		
	Qfast.add('widgets', {
                    path: "http://boss.ywy7.com/html/js/terminator2.2.min.js",
                    type: "js",
                    requires: ['fx']
                });
	
	var cssos = [
		"http://boss.ywy7.com/html/css/login.css",
		"http://boss.ywy7.com/html/css/validationEngine.jquery.css"
	];
	//$._includeJS(jsos);
	//$._includeCss(cssos);
	
	// 加网站流量统计
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "//hm.baidu.com/hm.js?40cb08f49dd221b05c36cb16c4090b42";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();

	
	
	$._loadLog();
	
	$._initHeader();
	
	$("a[tag='more_g']").bind("click",function(){
		window.open($(this).attr("uri"));
	});
	
	    //获取友情链接
    $._getFrendLink();
	
	$._getBackGround();
    
    $('.login_mian').leanModal({ top: 110, overlay: 0.45,closeButton: ".hidemodal" });
    
    $(".login_mian").click(function(){
   	 $("#formID")[0].reset();	 
   	 $("#formID").validationEngine({
   		 autoHidePrompt: true,
   		 scroll:false,
   		 autoHideDelay:"5000"
   	 });	 
    });
    
    $("#loginbut").click(function(){	 
   	 if($('#formID').validationEngine('validate')){
   		
   		$.ajax({
   	        type: "POST",
   	        url: "http://boss.ywy7.com/tms/tUser/web_login.l",
   	        data: {
   	            "loginName": $("input[name='loginName']").val(),
   	            "password": $("input[name='password']").val()
   	        },
   	        success: function(msg) {
   	        	if(msg.code=="0"){   	        		
   	        		location.reload();
   	        	}else{   	        		
   	        		$("input[name='loginName']").validationEngine('showPrompt',"* "+msg.msg,'error');
   	        	}
   	        }
   		});   		 
   	 }
    });
    
    $("#domainurl").click(function(){
    	try{
    		window.external.addFavorite(SystemUtil.domainUrl, SystemUtil.domainTitle);
    	}catch(e){
    		try{
    			window.sidebar.addPanel(SystemUtil.domainUrl, SystemUtil.domainTitle, "");
    		}catch(e){
    			alert("加入收藏失败，请使用Ctrl+D进行添加");
    		}
    	}
    });

    $("#sethomes").click(function(){
    	try{
    		$(this).style.behavior='url(#default#homepage)';
    		$(this).setHomePage(window.location);
    	}catch(e){
    		if(window.netscape) {
    			try{
    				 netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
    			}catch(e){
    				alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
    			}
    			var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
    	        prefs.setCharPref('browser.startup.homepage',window.location);
    			}
    		}
    });
   
  
	$._getGirl();
});
