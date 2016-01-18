<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript" src="webviews/common/js/lvxh.js"></script>
	<link type="text/css" rel="stylesheet" href="webviews/common/css/lvxh.css">
	<script type="text/javascript">
		Namespace.register("com.lz.yh.newsynzx");
		// fn存放该页面定义方法
		com.lz.yh.newsynzx.fn = function() {
			this.setPageTitle = function(id) {
				switch(id){
					case 1:
						document.title = '悦玩网_手游评测';
				  		break;
					case 2:
						document.title = '悦玩网_业内资讯';
				  		break;
					case 3:
						document.title = '悦玩网_人物专访';
				  		break;
					default:
				  		break;
				}
			}
		}

		var newsynzxFn = new com.lz.yh.newsynzx.fn();
		
		$(function(){
			newsynzxFn.setPageTitle(${nav_on});
			$._getAdvert('#advertA','9','813','100','1','8');
			$._getAdvert('#advertB','8','813','100','1','8');
			$._getAdvert('#advertC','9','320','140','2','9');
			$._getAdvert('#advertD','8','320','140','2','9');
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
			<!-- 中间内容部分 -->
			<div class="zx_container">
				<!--所在 位置 -->
				<c:if test="${nav_on == 2}">
				<div class="zx_location">当前位置：悦玩网 &gt; 资讯频道 &gt; 业内资讯</div>
				</c:if>
				<c:if test="${nav_on == 3}">
				<div class="zx_location">当前位置：悦玩网 &gt; 资讯频道 &gt; 人物专访</div>
				</c:if>
				<!-- 资讯信息 -->
				<div class="zx_left">
					<!-- 广告 -->
					<c:if test="${nav_on == 2}">
						<div id="advertA" data-type="9" data-index="0" class="adverta">
							<jsp:include page="../common/advertA.jsp"></jsp:include>
						</div>
					</c:if>
					<c:if test="${nav_on == 3}">
						<div id="advertB" data-type="8" data-index="0" class="adverta">
							<jsp:include page="../common/advertA.jsp"></jsp:include>
						</div>
					</c:if>
			    	<div id="mygrid">
						<jsp:include page="../news/component/newsList.jsp"></jsp:include>
					</div>
				</div>
				<!-- 右侧新闻 -->
			   <div class="zx_right">
			  		<jsp:include page="../news/component/hotNews.jsp"></jsp:include>
   			   </div>
			</div>
			<!-- 页面底部 -->
			<jsp:include page="../common/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>