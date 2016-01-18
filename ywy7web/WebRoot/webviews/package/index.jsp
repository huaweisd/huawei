<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.packages");
		// fn存放该页面定义方法
		com.lz.yh.packages.fn = function() {
			this.navClick = function() {
				$.each($('#package_content_nav').find('li'), function(i, m){
					$(this).click(function(){
						if($._checkBtn($(this), 'package_nav_current')){
							return;
						}
						$('.package_nav_content').hide();
						$('#package_nav_content' + $(this).attr('data-i')).show();
						$('#package_content_nav').find('li').removeClass('package_nav_current');
						$(this).addClass('package_nav_current');
						if($(this).attr('data-i')==1){
							$('#package_nav_more').attr('href', commonFn.getRelLink("pack") + '/package/zxlb.htm');
						}else{
							$('#package_nav_more').attr('href', commonFn.getRelLink("pack") + '/package/djlb.htm');
						}
					})
				})
			}
		}
		// param存放该页面定义对象
		com.lz.yh.packages.param = function() {
			
		}
		
		var packagesParam = new com.lz.yh.packages.param();
		var packagesFn = new com.lz.yh.packages.fn();
		
		$(function(){
			document.title = '悦玩网_礼包';
			
			packagesFn.navClick();
			$._getAdvert('#advertA','2','585','100','2','0');
			$._getAdvert('#advertB','2','880','100','1','1');
			$._getAdvert('#advertC','2','1180','81','1','2');
			
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
		<div class="main1_banner package_bwh">
			<jsp:include page="./component/banner.jsp"></jsp:include>
		</div>
		<div id="advertA" data-type="2" data-index="0" class="adverta">
					<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		
		<div class="package_content w1180">
			<div class="w300 fll">
				<jsp:include page="./component/rmlb.jsp"></jsp:include>
			</div>
			<div class="w855 fll pdl20">
				<jsp:include page="./component/tjlb.jsp"></jsp:include>
			</div>
		</div>
		
		<div class="package_content w1180">
			<div class="package_content fll w880">
			<!-- 广告 -->
				<div id="advertB" data-type="2" data-index="1" >
					<jsp:include page="../common/advertA.jsp"></jsp:include>
				</div>
				<ul class="package_content_nav" id="package_content_nav">
					<li data-i="1" class="package_nav_current">最新礼包</li>
					<li data-i="2">独家礼包</li>
					<span class="package_more"><a id="package_nav_more" href="http://pack.ywy7.com/package/zxlb.htm">更多&gt;&gt;</a></span>
				</ul>
				<div id="package_nav_content1" class="package_nav_content">
					<jsp:include page="./component/zxlb.jsp"></jsp:include>
				</div>
				<div id="package_nav_content2" class="package_nav_content" style="display: none;">
					<jsp:include page="./component/djlb.jsp"></jsp:include>
				</div>
			</div>
			<div class="flr w270">
				<jsp:include page="./component/rmlbph.jsp"></jsp:include>
			</div>
		</div>
		
		<div id="advertC" data-type="2" data-index="2" style="height:81px;margin-bottom:10px;">
			<jsp:include page="../common/advertA.jsp"></jsp:include>
		</div>
		<jsp:include page="../common/bottom.jsp"></jsp:include>
	</div>
</body>
</html>