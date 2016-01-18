<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		$(function(){
			document.title = '悦玩网_开服开测';
		})
	</script>
</head>	
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<!-- 内容 -->
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			<!-- 内容 -->
			<div class="container2">
				<jsp:include page="../newGame/component/openServerAndTest.jsp"></jsp:include>
			</div>
 			<!-- 底部-->
		 	<jsp:include page="../common/bottom.jsp"></jsp:include>
 		</div>
	</div>
</body>
</html>