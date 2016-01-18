<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_排行';
			$._getAdvert('#advertA','25','585','100','2','0');
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
	<div class="bg" id="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
		</div>
		<div class="container2">
			<!-- 广告图文 -->
			<div id="advertA" data-type="25" data-index="0"  class="adverta">
				<jsp:include page="../common/advertA.jsp" ></jsp:include>
			</div>
			<div class="container3">
				<!-- 最热资讯榜 -->
				<div class="phb_zrzxb">
					<jsp:include page="../rank/component/hotNews.jsp"></jsp:include>
 				</div>
  				<!-- 最新视频榜 -->
		    	<div class="phb_zxspb">
		   			<jsp:include page="../rank/component/newVideo.jsp"></jsp:include>
		    	</div>
		    	<!-- 七天最火 -->
		    	<div class="phb_szqwm">
		    		<jsp:include page="../rank/component/topFive.jsp"></jsp:include>
		    	</div>
	    	</div>
	    	<!--排行榜 -->
			<jsp:include page="../rank/component/Ranks.jsp"></jsp:include>
			<jsp:include page="../common/bottom.jsp"></jsp:include>
	 	</div>
	</div>
</body>
</html>