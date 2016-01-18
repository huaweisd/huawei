<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.wdlb");
		// fn存放该页面定义方法
		com.lz.yh.wdlb.fn = function() {
			
		}
		// param存放该页面定义对象
		com.lz.yh.wdlb.param = function() {
			
		}
		
		var wdlbParam = new com.lz.yh.wdlb.param();
		var wdlbFn = new com.lz.yh.wdlb.fn();
		
		$(function(){
			document.title = '悦玩网_我的礼包';
			
			var login = '${loginState}';
			if(login == null || login == ''){
				commonFn.openLogin(true);
			}
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
		<div class="video_content_location">当前位置：悦玩网 &gt; 礼包频道 &gt; 我的礼包</div>
		<div class="wdlb_content">
			<div class="wdlb_userinfo">
				<div class="discount-user-meta">
	                <div class="discount-user-avatar">
	                    <img id="j-user-avatar" src="${userImage }" alt="">
	                </div>
	                <p class="discount-user-name" id="j-user-name=">${userName }</p>
	                <!-- <p>我的等级：<strong id="j-user-lv">随地乱搞</strong></p> -->
	                <p>我的金币：<strong>${userMoney }</strong> <a href="javascript:void(0)">去兑换</a></p>
	                <c:if test="${isSign != null && isSign == 1 }">
	                	<a class="discount-user-sign signOK" id="js-pack-sign" href="javascript:viod(0)">已签到</a>
	                </c:if>
	                <c:if test="${isSign == null || isSign != 1 }">
	                	<a class="discount-user-sign" id="js-pack-sign" href="javascript:commonFn.sign()">签到</a>
	                </c:if>
	            </div>
	            <div class="discount-control-nav ui-tab-nav">
	                <a href="javascript:void(0)" class="pack-btn current">我的礼包</a>
	                <!-- <a href="" class="cousult-btn">我的预约</a> -->
	            </div>
			</div>
			
			<div class="wdlb_info">
				<div class="col-box-hd">
	                <h2 class="col-box-tit">我的礼包</h2>
	            </div>
	            
	            <div class="my_packages">
	                <div class="my_package_rule">礼包领取<b> 6 </b>小时后被放入淘号库，请尽快使用！</div>
	                <c:if test="${packageListLength != null && packageListLength != 0 }">
		                <div class="my-pack-list">
		                    <table>
		                        <thead>
		                            <tr>
		                                <th class="w250">领取时间</th>
		                                <th class="w250">礼包名称</th>
		                                <th>礼包码</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        	<c:forEach items="${packageList }" var="item" varStatus="status">
		                        		<tr>
			                                <th class="w250 fs14">${item.getTime }</th>
			                                <th class="w250 fs14">${item.packageName }</th>
			                                <th class="fs14">${item.packageCode }</th>
			                            </tr>
		                        	</c:forEach>
		                        </tbody>
		                    </table>
		                </div>
		            </c:if>
	                <c:if test="${packageListLength == null || packageListLength == 0 }">
	                	<div class="no-pack-list" style=""></div>
	                </c:if>
	            </div>
			</div>
		</div>
	
		<div class="common_bottom">
			<jsp:include page="../common/friendLink.jsp"></jsp:include>
			<jsp:include page="../common/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>