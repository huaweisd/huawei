<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_资讯首页';
			$._getAdvert('#advertA','7','585','100','2','0');
			$._getAdvert('#advertB','7','338','340','1','2');
			$._getAdvert('#advertC','7','340','230','2','7');
			//背景广告
			$._closeAdverts();
			$._showBtAdvert('4');
			$._closeDbAdverts();
			$._showDbAdverts('4');
		})
	</script>
</head>	
<body>
	<jsp:include page="../common/btAdvert.jsp"></jsp:include>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
		<!-- 内容 -->
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			<div class="zx_container">
				<!-- 图文 -->
				<jsp:include page="../news/component/picWord.jsp"></jsp:include>
				<!-- 关注我们 -->
				<jsp:include page="../news/component/attentionUs.jsp"></jsp:include>
			</div>
			<div id="advertA" data-type="7" data-index="0" class="adverta">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<!-- 新闻内容 -->
			<div class="zx_container">
				<!-- 第一焦聚 -->
				<div class="zx_dyjj">
				    <div id="mgrid">
						<h2>第一聚焦</h2>
						<jsp:include page="../news/component/firstFocus.jsp"></jsp:include>
					</div>
				</div>
				<!-- 悦玩光点 -->
				<jsp:include page="../news/component/highGame.jsp"></jsp:include>
				<!-- 手游评测 -->
				<jsp:include page="../news/component/mobileGameTest.jsp"></jsp:include>
				<!-- 产业资讯 -->
				<jsp:include page="../news/component/industryNews.jsp"></jsp:include>
				<!-- 游戏会展与活动 -->
				<jsp:include page="../news/component/gameEvent.jsp"></jsp:include>
				<!-- 国内资讯  全球资讯 -->
				<div class="zx_container">
					<!-- 国内资讯 -->
					<jsp:include page="../news/component/domesticNews.jsp"></jsp:include>
					<!-- 全球资讯 -->
					<div class="zx_qqzx">
						<h2>全球资讯</h2>
					    <div class="zx_rh">
					    	<jsp:include page="../news/component/globalNews.jsp"></jsp:include>
					    </div>
					</div>
				</div>
				<!-- 页面底部 -->
			<jsp:include page="../common/bottom.jsp"></jsp:include>
  		</div>
  	</div>
  </div>
</body>
</html>