<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.videoyxsp");
		// fn存放该页面定义方法
		com.lz.yh.videoyxsp.fn = function() {
			this.setPageTitle = function(id) {
				switch(id){
					case 1:
						document.title = '悦玩网_试玩评测';
				  		break;
					case 2:
						document.title = '悦玩网_游戏视频';
				  		break;
					case 3:
						document.title = '悦玩网_新游发布';
				  		break;
					default:
				  		break;
				}
			}
		}
		// param存放该页面定义对象
		com.lz.yh.videoyxsp.param = function() {
			
		}
		
		var videoyxspParam = new com.lz.yh.videoyxsp.param();
		var videoyxspFn = new com.lz.yh.videoyxsp.fn();
		
		$(function(){
			videoyxspFn.setPageTitle(${nav_on});
			$._getAdvert('#advertA','22','585','100','2','0');
			$._getAdvert('#advertB','21','585','100','2','0');
			$._getAdvert('#advertC','23','585','100','2','0');
			$._getAdvert('#advertD','22','320','150','3','11');
			$._getAdvert('#advertE','21','320','150','2','12');
			$._getAdvert('#advertF','23','320','150','2','12');
		})
	</script>
</head>
<body>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../common/logo.jsp"></jsp:include>
			<jsp:include page="../common/nav.jsp"></jsp:include>
			
			<c:if test="${nav_on == 1}">
				<div id="advertA" data-type="22" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<div class="video_content_location">当前位置：悦玩网 &gt; 视频频道 &gt; 试玩评测</div>
			</c:if>
			<c:if test="${nav_on == 2}">
				<div id="advertB" data-type="21" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<div class="video_content_location">当前位置：悦玩网 &gt; 视频频道 &gt; 游戏视频</div>
			</c:if>
			<c:if test="${nav_on == 3}">
				<div id="advertC" data-type="23" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<div class="video_content_location">当前位置：悦玩网 &gt; 视频频道 &gt; 新游发布</div>
			</c:if>
			<div>
				<jsp:include page="./component/video_content.jsp"></jsp:include>
			</div>
			
			<jsp:include page="../common/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>