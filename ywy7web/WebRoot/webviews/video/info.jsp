<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.videoinfo");
		// fn存放该页面定义方法
		com.lz.yh.videoinfo.fn = function() {
			
		}
		// param存放该页面定义对象
		com.lz.yh.videoinfo.param = function() {
			
		}
		
		var videoinfoParam = new com.lz.yh.videoinfo.param();
		var videoinfoFn = new com.lz.yh.videoinfo.fn();

		$(function(){
			document.title = '悦玩网_视频详情';
			$._getAdvert('#advertA','21','585','100','2','0');
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
		<div id="advertA" data-type="21" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<div class="video_content_location">当前位置：悦玩网 &gt; 视频详情 &gt; ${videoTitle}</div>
		
		<div class="info_content">
			<div class="info_content_l">
				<div class="info_content_l_c w810">
					<h2>${videoTitle}</h2>
					<embed src="${videoSpUrl}" allowfullscreen="true" quality="high" allowscriptaccess="always" type="application/x-shockwave-flash" align="middle" height="560" width="810">
				</div>
			</div>
			
			<div class="info_content_r">
				<jsp:include page="./component/rmsp.jsp"></jsp:include>
			</div>
		</div>
		
		<jsp:include page="../common/bottom.jsp"></jsp:include>
	</div>
</body>
</html>