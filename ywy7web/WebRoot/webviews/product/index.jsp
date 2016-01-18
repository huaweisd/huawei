<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
<style>
	.product-info-head{
		width:1180px;
	}
	.product-info-head>div{
		float:left;
	}
</style>
<script>
	$(function(){
		document.title = '悦玩网_游戏专区';
	})
</script>
</head>

  
  <body>
    <jsp:include page="../common/login.jsp"></jsp:include>
    <div class="bg">
    	<jsp:include page="../common/header.jsp"></jsp:include>
    	<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
		</div>
		<div class="video_content_location">当前位置：悦玩网 &gt; 礼包频道 &gt; 热门礼包</div>
		<div class="product-info-head clearfix">
	    	<jsp:include page="component/gameInfo.jsp"></jsp:include>
	    	<div class="margint-30">
	    		<jsp:include page="component/lb.jsp"></jsp:include>
	    	</div>
	    </div>
	    <div class="product-info-center clearfix">
	    	<div class="product-center-left fll">
	    		<jsp:include page="component/content.jsp"></jsp:include>
	    		<jsp:include page="component/rmgl.jsp"></jsp:include>
	    		<jsp:include page="component/cnxh.jsp"></jsp:include>
	    	</div>
	    	<div class="flr w360">
		    	<jsp:include page="component/Ranks.jsp"></jsp:include>
		    	<div class="flr marr20">
		    		<jsp:include page="../raiders/component/hotNews.jsp"></jsp:include>
		    	</div>
		    </div>
	    </div>
	    <jsp:include page="../common/bottom.jsp"></jsp:include>
    </div>
    
  </body>
</html>
