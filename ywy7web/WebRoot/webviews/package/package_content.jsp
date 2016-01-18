<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript" src="webviews/common/js/lvxh.js"></script>
	<link type="text/css" rel="stylesheet" href="webviews/common/css/lvxh.css">
	<script type="text/javascript">
		Namespace.register("com.lz.yh.packageContent");
		// fn存放该页面定义方法
		com.lz.yh.packageContent.fn = function() {
			this.setPageTitle = function(id) {
				switch(id){
					case 1:
						document.title = '悦玩网_热门礼包';
						packageContentParam.searchData["tType"] = 2;
				  		break;
					case 2:
						document.title = '悦玩网_特价礼包';
						packageContentParam.searchData["tType"] = 4;
				  		break;
					case 3:
						document.title = '悦玩网_独家礼包';
						packageContentParam.searchData["tType"] = 5;
				  		break;
					default:
				  		break;
				}
			},
			this.searchPackage = function(){
				var nav_on = '${nav_on}';
		        
		        var l_data = {
			   		perNumber:12,
			   	  	url : 'package/queryPackagePage.do',
			   	 	params : packageContentParam.searchData,
			   	  	fun : function(data){
			   			
			   	  	}
				};
		        
		        switch(parseInt(nav_on)){
					case 1:
						l_data.fun = function(data){
							$("#lblist_content").empty();
							$.each(data, function(i, m){
								$("#lblist_content").append('<li class="rmlb_list"><img src="'+commonFn.getImgUrl(m.timg)+'" height="162" width="270" /><p><span class="fll w170 ellipsis">'+m.packageName+'</span><span class="flr"><a target="_blank" href= "' + commonFn.getRelLink("pack")+'/package/'+m.id+'.htm" class="rmlb_list_ljlq">立即领取</a></span></p></li>');
							})
						}
				  		break;
					case 2:
						l_data.fun = function(data){
							$("#lblist_content").empty();
							$.each(data, function(i,m) {
								$("#lblist_content").append('<dl class="tjlb_list"><dt>'+m.packageName+'</dt><dd class="tjlb_list_pic"><img src="'+commonFn.getImgUrl(m.timg)+'" height="75" width="95"></dd><dd class="tjlb_list_txt">'+m.nowPrice+'<font style="color:#666; text-decoration:line-through">('+m.tprice+')</font></dd><dd class="tjlb_list_txt02">到期时间：'+$._DateFormat(new Date(m.timeLimitStr), 'yyyy-MM-dd')+'</dd><dd class="tjlb_list_btn"><a target="_blank" href="'+ commonFn.getRelLink("pack") +'/package/'+m.id+'.htm">立即抢购</a></dd></dl>');
							});
						}
				  		break;
					case 3:
						l_data.fun = function(data){
							$("#lblist_content").empty();
							$.each(data,function(i,m) {
						 		$("#lblist_content").append('<dl class="tjlb_list"><dt>'+m.packageName+'</dt><dd class="tjlb_list_pic"><img src="'+commonFn.getImgUrl(m.timg)+'" height="75" width="95"></dd><dd class="tjlb_list_txt">'+m.nowPrice+'<font style="color:#666; text-decoration:line-through">('+m.tprice+')</font></dd><dd class="tjlb_list_txt02">到期时间：'+$._DateFormat(new Date(m.timeLimitStr), 'yyyy-MM-dd')+'</dd><dd class="tjlb_list_btn"><a target="_blank" href= "' + commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">立即抢购</a></dd></dl>');
							});
						}
				  		break;
					default:
				  		break;
				}
		        $("#mgrid").lxhgrid(l_data);
			}
		}
		// param存放该页面定义对象
		com.lz.yh.packageContent.param = function() {
			this.searchData = {"priceType":0,"packageType":0,"priceStatus":0}// 搜索条件
		}
		
		var packageContentParam = new com.lz.yh.packageContent.param();
		var packageContentFn = new com.lz.yh.packageContent.fn();
		packageContentFn.setPageTitle(${nav_on});
		
		$(function(){
			
		})
	</script>
</head>
<body>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			<c:if test="${nav_on == 1}">
				<jsp:include page="./component/banner.jsp"></jsp:include>
				<div class="video_content_location">当前位置：悦玩网 &gt; 礼包频道 &gt; 热门礼包</div>
			</c:if>
			<c:if test="${nav_on == 2}">
				<div class="video_content_location">当前位置：悦玩网 &gt; 礼包频道 &gt; 特价礼包</div>
			</c:if>
			<c:if test="${nav_on == 3}">
				<div class="video_content_location">当前位置：悦玩网 &gt; 礼包频道 &gt; 独家礼包</div>
			</c:if>
			<jsp:include page="./component/packageContent_content.jsp"></jsp:include>
			
			<jsp:include page="../common/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>