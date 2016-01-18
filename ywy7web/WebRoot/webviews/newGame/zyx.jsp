<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript" src="webviews/common/js/lvxh.js"></script>
	<link type="text/css" rel="stylesheet" href="webviews/common/css/lvxh.css">
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_找游戏';
			$._getAdvert('#advertA','18','585','100','2','0');
		})
	</script>
	<style type="text/css">
	
	</style>
</head>	
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
		<!-- 内容 -->
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			<!-- 广告 -->
			<div id="advertA" data-type="18" data-index="0" class="adverta">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<!-- 位置 -->
			<div class="video_content_location">当前位置：悦玩网 &gt; 新游频道 &gt; 找游戏</div>
			<!-- 内容部分 -->
			<div class="zyx_container">
				<!-- 左边内容 -->
				<div class="zyx_left">
					<div class="mar5_20">
						<jsp:include page="../newGame/component/searchGame.jsp"></jsp:include>
					</div>
					<jsp:include page="../newGame/component/newAndHot.jsp"></jsp:include>
				</div>
				<!-- 右边内容 -->
				<div class="zyx_right">
					<jsp:include page="../newGame/component/newGameRank.jsp"></jsp:include>
					<jsp:include page="../newGame/component/hotGameNews.jsp"></jsp:include>
				</div>
			</div>
			  <!-- 底部-->
			 <jsp:include page="../common/bottom.jsp"></jsp:include>
  	</div>
  </div>
</body>
</html>