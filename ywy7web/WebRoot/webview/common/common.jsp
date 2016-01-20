<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath %>" target="_blank">
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">

<link type="text/css" rel="stylesheet" href="webview/common/css/main.css">

<script type="text/javascript" src="webview/common/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="webview/common/js/jquery.slides.min.js"></script>

<script type="text/javascript">
	function getBodyNav(type, index){//页面上写<div class="nav" id="bodyNav"></div>;type代表类型;index代表被选中的导航
		var html = '';
		switch (type) {
			case 1:
				html = '<ul><li data-url="webview/index.jsp">首页</li><li data-url="webview/xy.jsp">新游</li><li>攻略</li><li>礼包</li><li>排行</li><li>资讯</li><li>专区</li><li>视频</li><li>社区</li></ul>';
				break;
	
			default:
				break;
		}
		$('#bodyNav').html(html).find('ul li').click(function(){
			if(!$(this).hasClass('nav_select')){
				window.open($(this).attr('data-url'));	
			}
		}).eq(index).addClass('nav_select');
	}
	
	function slides(id, w, h){
		$('#' + id).slidesjs({
			width: w,
            height: h,
			play: {
				active: true,
				auto: true,
				interval: 2000,
				swap: true,
				restartDelay: 500
			}
		});
		$('ul.slidesjs-pagination li.slidesjs-pagination-item').click(function(){
			$('#' + id).data("plugin_slidesjs").play();
		})
	}
</script>