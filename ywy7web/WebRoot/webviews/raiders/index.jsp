<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_攻略';
			$._getAdvert('#advertA','3','585','100','2','0');
			$._getAdvert('#advertB','3','1180','81','1','1');
			$._getAdvert('#advertC','3','330','150','2','7');
			$._getAdvert('#advertD','3','830','70','1','4');
			//背景广告 
			$._closeAdverts();
			$._showBtAdvert('4');
			$._closeDbAdverts();
			$._showDbAdverts('4');
		})
	</script>
</head>	
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<jsp:include page="../common/btAdvert.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<!-- 内容 -->
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			<!-- 图文 -->
			<jsp:include page="../raiders/component/picWord.jsp"></jsp:include>
			<!-- 广告 -->
			<div id="advertA" data-type="3" data-index="0" class="adverta">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<!-- 游戏推荐 -->
			<div class="xytj">
				<jsp:include page="../region/component/hotGames.jsp"></jsp:include>
			</div>
			<!-- 广告2 -->
			<div id="advertB" data-type="3" data-index="1" style="margin-top:10px;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<!-- 内容主体 -->
			<div class="gl_container">
				<jsp:include page="../raiders/component/recommendRaiders.jsp"></jsp:include>
				<jsp:include page="../raiders/component/FirstRaider.jsp"></jsp:include>
				<jsp:include page="../raiders/component/hotNews.jsp"></jsp:include>
			</div>
			<!-- 内容主题 -->
			<div class="gl_container">
				<jsp:include page="../raiders/component/adverts.jsp"></jsp:include>
			</div>
			<!-- 页面底部 -->
			<jsp:include page="../common/bottom.jsp"></jsp:include>
  		</div>
	</div>
</body>
</html>