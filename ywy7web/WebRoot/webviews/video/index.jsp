<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_视频';
			$._getAdvert('#advertA','4','585','100','2','0');
			$._getAdvert('#advertB','4','1180','84','1','1');
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
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
		</div>
		<div class="area-girl-wall">
			<jsp:include page="./component/banner.jsp"></jsp:include>
		</div>
		<div id="advertA" data-type="4" data-index="0" class="adverta">
			<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<div id="sp_container" class="video_container">
			<div class="video_swpc_xyfb">
		        <jsp:include page="./component/swpc.jsp"></jsp:include>
		    </div>
		    <div class="video_xysp_spgl">
		        <jsp:include page="./component/yxsp.jsp"></jsp:include>
		        <jsp:include page="./component/spgl.jsp"></jsp:include>
		    </div>
		</div>
		<div id="advertB" data-type="4" data-index="1" style="width:1180px;height:84;margin-bottom:10px;">
			<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<jsp:include page="../common/bottom.jsp"></jsp:include>
	</div>
</body>
</html>