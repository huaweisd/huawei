<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" target="_blank">
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<link rel="shortcut icon" href="webviews/common/img/yww.ico" />
<link type="text/css" rel="stylesheet" href="webviews/common/css/main3.css">
<link type="text/css" rel="stylesheet" href="webviews/common/css/content.css">
<link type="text/css" rel="stylesheet" href="webviews/common/css/validationEngine.jquery.css">

<script type="text/javascript" src="webviews/common/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="webviews/common/js/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript" src="webviews/common/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="webviews/common/js/koala.min.1.5.js"></script>

<script type="text/javascript" src="webviews/common/js/lvxh.js"></script>
<link type="text/css" rel="stylesheet" href="webviews/common/css/lvxh.css">

<script type="text/javascript">
	// 命名空间注册
	var Namespace = new Object();
	Namespace.register = function(path){
		var arr = path.split(".");
		var ns = "";
		for(var i=0;i<arr.length;i++){
	        if(i>0) ns += ".";
	        ns += arr[i];
	        eval("if(typeof(" + ns + ") == 'undefined') " + ns + " = new Object();");
	    }
	}
	Namespace.register("com.lz.yh.common");
	
	// fn存放该页面定义方法
	com.lz.yh.common.fn = function() {
		/*转换游戏名称*/
		this.convertGameType = function (id){
			var re = "";
			var map = {
				1:"益智休闲",
				2:"角色扮演",
				3:"运动跑酷",
				4:"策略模拟",
				5:"动作射击",
				6:"竞技竞速",
				7:"冒险闯关",
				8:"桌游棋牌",
				9:"卡牌游戏",
				10:"小编精选"
			};
			id = id.split(",");
			for(var i = 0; i<id.length;i++){
				re += map[id[i]] + "&nbsp;";
			}
			document.write(re);
		},
		this.convertOs = function (id){
			var re = "";
			var map = {
				1:"WP",
				2:"IOS",
				3:"Android"
			};
			id = id.split(",");
			for(var i = 0; i<id.length;i++){
				re += map[id[i]] + "&nbsp;";
			}
			document.write(re);
		},
		this.convertPrice = function (id){
			var re = "";
			var map = {
				1:"收费",
				2:"免费",
				3:"限免"
			};
			id = id.split(",");
			for(var i = 0; i<id.length;i++){
				re += map[id[i]] + "&nbsp;";
			}
			document.write(re);
		},
		this._getGameType = function (id){
			var re = "";
			var map = {
				1:"益智休闲",
				2:"角色扮演",
				3:"运动跑酷",
				4:"策略模拟",
				5:"动作射击",
				6:"竞技竞速",
				7:"冒险闯关",
				8:"桌游棋牌",
				9:"卡牌游戏",
				10:"小编精选"
			};
			id = id.split(",");
			for(var i = 0; i<id.length;i++){
				if(i==id.length-1){
					re += map[id[i]];
				}else{
					re += map[id[i]] + ",";
				}
			}
			return re;
		},
		this._getOs = function (id){
			var re = "";
			var map = {
				1:"Windows",
				2:"IOS",
				3:"Android"
			};
			id = id.split(",");
			for(var i = 0; i<id.length;i++){
				if(i==id.length-1){
					re += map[id[i]];
				}else{
					re += map[id[i]] + ",";
				}
			}
			return re;
		},
		this._getPrice = function (id){
			var re = "";
			var map = {
				1:"收费",
				2:"免费",
				3:"限免"
			};
			id = id.split(",");
			for(var i = 0; i<id.length;i++){
				if(i==id.length-1){
					re += map[id[i]];
				}else{
					re += map[id[i]] + ",";
				}
			}
			return re;
		},
		this.navClick = function() {
			$.each($('#nav').find('li'), function(i, m){
				$('#nav' + i).click(function(){
					if($._checkBtn($(this), 'nav_btn_on')){
						return;
					}
					window.location.href = $(this).attr('data-url');
				})
			})
		},
		this.navOn = function(id) {
			$('#nav').find('li').removeClass('nav_btn_on');
			$('#nav' + id).addClass('nav_btn_on');
		},
		this.login = function() {
			$('#loginSubmit').click(function(){
				if($('#loginForm').validationEngine('validate')){
					$._post("index/getIndexUser.do", {
						'loginName' : $('input[name="loginName"]').val(),
						'password' : $('input[name="password"]').val()
					}, function(data){
						if(data.state){
							if(window.location.href.indexOf('register') > 0){
								window.location.href = commonFn.getRelLink('www');
							}else{
								window.location.reload();
							}
						}else{
							$('#loginSubmit').validationEngine('showPrompt', data.msg, 'error');
						}
					})
				}
			})
		},
		this.openLogin = function(id) {
			if(id){
				$('#login_body').show();
			}else{
				$('#login_body').hide();
			}
		},
		this.loginInfoHaver = function() {
			$('#info_haver, #info_content').hover(function(){
				$('#info_content').show();
			}, function(){
				$('#info_content').hide();
			})
		},
		this.loginOut = function() {
			$._post("index/loginOut.do", {}, function(data){
				if(data.state){
					window.location.reload();
				}
			})
		},
		this.sign = function() {
			$._post('index/sign.do', {}, function(data){
				if(data.state){
					window.location.reload();
				}
			})
		},
		this.changeImg = function() {
			var imgSrc = $('#imgObj');
			var src = imgSrc.attr('src');
			imgSrc.attr('src', commonFn.chgUrl(src));
		},
		this.chgUrl = function(url){
			var timestamp = (new Date()).valueOf();
		    urlurl = url.substring(0, 20);
		    urlurl += '?timestamp=' + timestamp;
		    return urlurl;
		},
		this.getSystem = function(id) {
			var data = {
					1 : 'windows',
					2 : 'ios',
					3 : 'android'
			}
			return data[id];
		},
		this.getUrlId = function(key){
			var locationUrl = window.location.href;
			var result = '';
			if(locationUrl.indexOf(key) > 0){
				result = locationUrl.substring(locationUrl.indexOf(key)+key.length+1, locationUrl.indexOf(key)+key.length+33);
			}
			return result;
		},
		this.copyToClipboard = function(maintext){
			if (window.clipboardData) {
				window.clipboardData.setData("Text", maintext);
			} else if (window.netscape) {
				try {
					netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				} catch (e) {
					alert("该浏览器不支持一键复制！请手工复制");
				}
				var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
				if (!clip)
					return;
				var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
				if (!trans)
					return;
				trans.addDataFlavor('text/unicode');
				var str = new Object();
				var len = new Object();
				var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
				var copytext = maintext;
				str.data = copytext;
				trans.setTransferData("text/unicode", str, copytext.length * 2);
				var clipid = Components.interfaces.nsIClipboard;
				if (!clip)
					return false;
				clip.setData(trans, null, clipid.kGlobalClipboard);
			}
			alert("\"" + maintext + "\" 已经复制成功！");
		},
		this.getImgUrl = function(url){
			var str = 'http://www.ywy7.com/tms';
			return str + url.replace('..', ''); 
		},
		this.getRelLink = function(id){
			var data = {
					'www'	:	'http://www.' + commonParam.domain,
					'xl'	:	'http://xl.' + commonParam.domain,
					'gl'	:	'http://gl.' + commonParam.domain,
					'pack'	:	'http://pack.' + commonParam.domain,
					'news'	:	'http://news.' + commonParam.domain,
					'area'	:	'http://area.' + commonParam.domain,
					'v'		:	'http://v.' + commonParam.domain,
					'ku'	:	'http://ku.' + commonParam.domain
			};
			return data[id];
		}
	}
	// param存放该页面定义对象
	com.lz.yh.common.param = function() {
		this.domain = 'hwtest.com'
	}

	$.extend({
		_ffsize : function(str, length) {
			if (str && str.length > length) {
				str = str.substring(0, length) + "...";
			}
			return str;
		},
		_testState : function(key) {
			if (key) {
				var params = {
					"1" : "公测",
					"2" : "内测",
					"3" : "封测"
				}
				return params[key];
			} else {
				return "其它"
			}
		},
		_DateFormat : function(date, fmt) { //author: meizz
			var o = {
				"M+" : date.getMonth() + 1, //月份   
				"d+" : date.getDate(), //日   
				"h+" : date.getHours(), //小时   
				"m+" : date.getMinutes(), //分   
				"s+" : date.getSeconds(), //秒   
				"q+" : Math.floor((date.getMonth() + 3) / 3), //季度   
				"S" : date.getMilliseconds()//毫秒   
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			return fmt;
		},
		_removeHTMLTag : function(str) {
			str = str.replace(/<\/?[^>]*>/g, ''); //去除HTML tag
			str = str.replace(/[ | ]*\n/g, '\n'); //去除行尾空白
			str = str.replace(/ /ig, '');//去掉 
			return str;
		},
		_substring : function(str) {
			var i = str.indexOf('来源：');
			return str.substring(i + 3);
		},
		_post : function(url, obj, fn) {
			$.ajax({
				type : "POST",
				url : url,
				data : obj,
				success : fn
			})
		},
		_checkBtn : function(obj, className) {
			if (obj.hasClass(className)) {
				return true;
			} else {
				return false;
			}
		},
		//广告
		_getAdvert:function(idName,tType,widths,heights,perNumber,tindex){
   			var type=$(idName).attr("data-type");
   			var index=$(idName).attr("data-index");
   			$.ajax({
	            type: "POST",
	            url: "advert/getAdverts.do",
	            data: {
		            'tType':type,
					'perNumber':perNumber,
					'tindex':index
	       		 },
	            success: function(data) {
	           		$.each(data.resultList, function(i, m) {
	          			var className="adverts"+i;
	            		if(i<perNumber){
	            			$(idName).find("ul").append('<li class="'+className+'"><a href="#"><img src="'+commonFn.getImgUrl(m.timg)+'" width='+widths+' height='+heights+' title='+m.ttitle+' /></a></li>');
						}
					})
	            }
	        })
		},
		//背景广告和关闭广告
		_closeAdverts:function(){
			$(".closeAdvert").click(function(){
				$(".bg").css('margin-top', '0');
				$(".btAdvert").hide();
				$(".closeAdvert").hide();
			})
		},
		_showBtAdvert:function(index){
			$.ajax({
	            type: "POST",
	            url: "advert/getBlAdverts.do",
	            data: {
		            'tType':28
	       		 },
	            success: function(data) {
	           		$.each(data.resultList, function(i, m) {
	           			if (index == 'region') {
	           				if(m.tindex == 5){
	           					$(".bg").css('margin-top', '125px');
	                			$(".btAdverts").css('display', 'block');
		            			$(".btAdvert").css('background', 'url("'+commonFn.getImgUrl(m.timg)+'") no-repeat scroll 50% 0px').html('<a style="position:relative;top:0;left:0;clear:both;width:100%;height:760px;display:block;z-index:-9999;" href="'+(m.turl==""||m.turl==null||m.turl==undefined?"javascript:void(0)":m.turl)+'"></a>');
	           				}
						}else{
							if(m.tindex == 4){
								$(".bg").css('margin-top', '125px');
			        			$(".btAdverts").css('display', 'block');
		            			$(".btAdvert").css('background', 'url("'+commonFn.getImgUrl(m.timg)+'") no-repeat scroll 50% 0px').html('<a style="position:relative;top:0;left:0;clear:both;width:100%;height:760px;display:block;z-index:-9999;" href="'+(m.turl==""||m.turl==null||m.turl==undefined?"javascript:void(0)":m.turl)+'"></a>');
							}
						}
					})
	            }
	        })
		},
		_closeDlAdverts:function(){
			$(".closeAdvertA").click(function(){
				$(".dlAdvert").hide();
			})
			$(".closeAdvertB").click(function(){
				$(".dlAdvert").hide();
			})
		},
		_showDlAdvert:function(index){
			$.ajax({
	            type: "POST",
	            url: "advert/getBlAdverts.do",
	            data: {
		            'tType':28
	       		 },
	            success: function(data) {
	            	var tin1 = 0;
	            	var tin2 = 0;
	            	$.each(data.resultList, function(i, m){
	            		if(data.resultList[i].tindex == 1){
	            			tin1++;
	            		}else if(data.resultList[i].tindex == 2){
	            			tin2++;
	            		}
	            	})
	            	if(tin1 == 0 || tin2 == 0){
	            		return;
	            	}
	            	$(".dlAdvert").css('display', 'block');
	            	$.each(data.resultList, function(i, m) {
		            	if(m.tindex=="1"){
		            		$(".dlAdvertA").append('<a><img src="'+commonFn.getImgUrl(m.timg)+'" height="100%" width="100%" title='+m.ttitle+' /></a>');
		            	}
		            	if(m.tindex=="2"){
		            		$(".dlAdvertB").append('<a><img src="'+commonFn.getImgUrl(m.timg)+'" height="100%" width="100%" title='+m.ttitle+' /></a>');
						}
					})
	            }
	        })
		},
		_closeDbAdverts:function(){
			$(".closebottomAdvert").click(function(){
				$(".bottomAdvert").fadeOut();
			})
		},
		_showDbAdverts:function(index){
			$.ajax({
	            type: "POST",
	            url: "advert/getBlAdverts.do",
	            data: {
		            'tType':28
	       		 },
	            success: function(data) {
	            	$.each(data.resultList, function(i, m) {
	            		if(m.tindex == 3){
	            			$(".bottomTitle").html(m.ttitle);
	            			$(".bottomPic").append('<a><img src="'+commonFn.getImgUrl(m.timg)+'"  title='+m.ttitle+' /></a>');
	            			$(".bottomAdvert").fadeIn();
	            		}
					})
	            }
	        })
		}
	})

	var commonParam = new com.lz.yh.common.param();
	var commonFn = new com.lz.yh.common.fn();

	$(function() {
		Qfast.add('widgets', {
			path : "webviews/common/js/terminator2.2.min.js",
			type : "js",
			requires : [ 'fx' ]
		});

		commonFn.navClick();
		commonFn.navOn(${nav_on});

		$('#loginForm').validationEngine();

		commonFn.login();
		commonFn.loginInfoHaver();

	})
</script>