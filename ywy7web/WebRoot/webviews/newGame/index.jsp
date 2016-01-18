<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.newGame");
		// fn存放该页面定义方法
		com.lz.yh.newGame.fn = function() {}
		// param存放该页面定义对象
		com.lz.yh.newGame.param = function() {}
		
		var newGameFn = new com.lz.yh.newGame.fn();
		var newGameParam = new com.lz.yh.newGame.param();
		
		$(function(){
			document.title = '悦玩网_新游首页';
			$._getAdvert('#advertA','5','585','100','2','0');
			$._getAdvert('#advertB','5','1180','81','1','1');
			$._getAdvert('#advertC','5','340','320','1','2');
			//背景广告  弹窗广告
			$._closeAdverts();
			$._showBtAdvert('4');
			$._closeDbAdverts();
			$._showDbAdverts('4');
		})
	</script>
	<style type="text/css">
	
	</style>
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
			<!-- 热门游戏 -->
			<div class="xytj">
				<jsp:include page="../region/component/hotGames.jsp"></jsp:include>
			</div>
			<!-- 内容 -->
			<div class="container2">
				<!-- 图文 -->
				<div class="container3">
					<jsp:include page="../newGame/component/picWord.jsp"></jsp:include>
				</div>
				<!-- 广告 -->
				<div id="advertA" data-type="5" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				
				<!-- 主体内容 -->
				<div class="container3">
					<!--特约礼包 今日 新游评测-->
					<div class="xy_tylb_jr_xypc">
						<jsp:include page="../newGame/component/specialPackage.jsp"></jsp:include>
						<jsp:include page="../newGame/component/newGameTest.jsp"></jsp:include>
					</div>
					<!--第一发布 热门专区-->
					<div class="xy_dyfb_rmzq">
						<jsp:include page="../newGame/component/firstRelease.jsp"></jsp:include>
						<jsp:include page="../newGame/component/hotRegion.jsp"></jsp:include>
						<jsp:include page="../newGame/component/newGameVideo.jsp"></jsp:include>
					</div>
					<!--新游期待榜 开服开测-->
					<div class="xy_xyqdb_kfkc">
						<jsp:include page="../newGame/component/newGameRank.jsp"></jsp:include>
						<div class="main4_right" style="border: 1px solid #e1e1e1;height:529px">
							<jsp:include page="../index/component/kfkc.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div id="advertB" data-type="5" data-index="1" style="margin-top:10px;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				
				<!-- 热门推荐 -->
				<div class="container3">
					<jsp:include page="../newGame/component/hotRecommend.jsp"></jsp:include>
					<div id="advertC" data-type="5" data-index="2" style="width:340px;height:320px;margin-left:10px;float:left;">
						<jsp:include page="../common/advertA.jsp"></jsp:include>
					</div>
				</div>
				<!-- 排行榜 -->
				<div class="container3">
					<jsp:include page="../newGame/component/ranks.jsp"></jsp:include>
				</div>
			</div>
			  <!-- 底部-->
				   <jsp:include page="../common/bottom.jsp"></jsp:include>
  	</div>
  </div>
</body>
</html>