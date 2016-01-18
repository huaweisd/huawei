<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_专区';
			$._getAdvert('#advertA','6','585','100','2','0');
			$._getAdvert('#advertB','6','1180','81','1','1');
			$._getAdvert('#advertC','6','1180','81','1','2');
			$._getAdvert('#advertD','6','390','550','1','3');
			$._getAdvert('#advertE','6','1180','81','1','4');
			$._getAdvert('#advertF','6','390','150','4','10');
			//背景广告
			$._closeAdverts();
			$._showBtAdvert('region');
		})
	</script>
	<style type="text/css">
				
	</style>
</head>	
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<jsp:include page="../common/btAdvert.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			
		</div>
		<!-- 图文 -->
		<div class="e02 qiehuan">
			<jsp:include page="../region/component/picWord.jsp"></jsp:include>
		</div>
		<div id="advertA" data-type="6" data-index="0" class="adverta">
			<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<!-- 热门游戏 -->
			<div class="xytj">
				<jsp:include page="../region/component/hotGames.jsp"></jsp:include>
			</div>
			<!-- 今日热点-->
			<div class="zq_jrrd">
				<jsp:include page="../region/component/todayHot.jsp"></jsp:include>
			</div>
			<!-- 广告 -->
			<div id="advertB" data-type="6" data-index="1" style="height:81px;margin-bottom:10px;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="zq_ywpc_fllb">
			<!-- 悦玩评测 -->
				<div class="zq_ywpc"><jsp:include page="../region/component/gameTest.jsp"></jsp:include></div>
			<!-- 热门礼拜 -->
				<div class="zq_fllb">
					<jsp:include page="../region/component/hotPackage.jsp"></jsp:include>
				</div>
			<!-- 广告 -->
			<div id="advertC" data-type="6" data-index="2" >
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			</div>
			<div class="zqtj">
			<!-- 专区推荐-->
				<div class="zq_zqtj"><jsp:include page="../region/component/hotRegion.jsp"></jsp:include></div>
			<!-- 右侧广告 -->	
			<div id="advertD" data-type="6" data-index="3" style="width:390px;height:550px;margin-left:10px;float:right;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			</div>
			<!-- 广告 -->
			<div id="advertE" data-type="6" data-index="4" style="height:81px;margin-bottom:10px;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="zq_cyzf_ttzx_threead">
				<!-- 产业专访-->
					<div class="zq_cyzf"><jsp:include page="../region/component/industryView.jsp"></jsp:include></div>
				<!-- 新游新闻-->
					<div class="zq_ttzx"><jsp:include page="../region/component/newGameNews.jsp"></jsp:include></div>
				<!-- 广告 -->
				<div id="advertF" data-type="6" data-index="10" class="advertf">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
			</div>
		<!-- 页面底部 -->
			<jsp:include page="../common/bottom.jsp"></jsp:include>
	</div>
</body>
</html>