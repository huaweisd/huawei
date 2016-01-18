<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_资讯详情';
			$._getAdvert('#advertA','15','585','100','2','0');
			$._getAdvert('#advertB','15','330','100','1','1');
			$._getAdvert('#advertC','15','330','420','1','2');
		})
		
		function setHeight(height){
			$("#new_iframe").css({"height":height});
		}
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
		<div id="advertA" data-type="15" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<div class="video_content_location">当前位置：悦玩网 &gt; 资讯频道 &gt; 资讯详情</div>
		
		<div class="info_content">
			<div class="info_content_l">
				<div class="info_content_l_c">
					<iframe src="news/content/${newsId }.do" id="new_iframe" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				</div>
			</div>
			
			<div class="info_content_r">
				<div id="advertB" data-type="15" data-index="1" style="height:100px;margin-bottom:10px;">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<div id="advertC" data-type="15" data-index="2">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<jsp:include page="./component/yxzx.jsp"></jsp:include>
			</div>
		</div>
		
		<jsp:include page="../common/bottom.jsp"></jsp:include>
	</div>
</body>
</html>