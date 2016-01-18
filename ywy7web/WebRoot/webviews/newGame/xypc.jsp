<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript" src="webviews/common/js/lvxh.js"></script>
	<link type="text/css" rel="stylesheet" href="webviews/common/css/lvxh.css">
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_新游评测';
			$._getAdvert('#advertA','18','585','100','2','0');
		})
	</script>
</head>	
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg" id="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			<!-- 图文 -->
			<div class="e02 qiehuan">
				<jsp:include page="../news/component/evaluationPics.jsp"></jsp:include>
			</div>	
			<!-- 广告 -->
			<div id="advertA" data-type="10" data-index="0" class="adverta">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<!-- 位置 -->
			<div class="video_content_location">当前位置：悦玩网 &gt; 资讯频道 &gt; 新游评测</div>
			<!-- 评测内容 -->
			<jsp:include page="../news/component/evaluationNew.jsp"></jsp:include>
			<!-- 页面底部 -->
			<jsp:include page="../common/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>