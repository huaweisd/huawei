<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.picRaider");
		// fn存放该页面定义方法
		com.lz.yh.picRaider.fn = function() {
			this.setPageTitle = function(id) {
				switch(id){
					case 1:
						document.title = '悦玩网_图文攻略';
				  		break;
					case 2:
						document.title = '悦玩网_视频攻略';
				  		break;
					default:
				  		break;
				}
			}
		}
		// param存放该页面定义对象
		com.lz.yh.picRaider.param = function() {
			
		}
		
		var picRaiderParam = new com.lz.yh.picRaider.param();
		var picRaiderFn = new com.lz.yh.picRaider.fn();
		
		$(function(){
			picRaiderFn.setPageTitle(${nav_on});
			if($('#advertA') != undefined){
				$._getAdvert('#advertA','19','585','100','2','0');
			}
			if($('#advertB') != undefined){
				$._getAdvert('#advertB','20','585','100','2','0');
			}
			if($('#advertC') != undefined){
				$._getAdvert('#advertC','19','320','130','3','11');
			}
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
			<c:if test="${nav_on == 1}">
				<div id="advertA" data-type="19" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<div class="video_content_location">当前位置：悦玩网 &gt; 攻略频道  &gt; 图文攻略</div>
			</c:if>
			<c:if test="${nav_on == 2}">
				<div id="advertB" data-type="20" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<div class="video_content_location">当前位置：悦玩网 &gt; 攻略频道  &gt; 视频攻略</div>
			</c:if>
			<!-- 攻略内容 -->
			<div class="gl_container">
				<jsp:include page="../raiders/component/raider_content.jsp"></jsp:include>
			</div>
 			<jsp:include page="../common/bottom.jsp"></jsp:include>
  		</div>
  	</div>
</body>
</html>