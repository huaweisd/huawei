<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.index");
		// fn存放该页面定义方法
		com.lz.yh.index.fn = function() {
			this.packageNavClick = function(id){
				$.each($('.main2_right_package_nav').find('ul').find('li.xx'), function(i, m){
				var t=$('#lb' + i)
					$('#lb' + i).click(function(){
						if($(this).hasClass('on')){
							return;
						}
						var obj = $(this);
						$._post("index/getIndexPackage.do", {
							'perNumber' : 8,
							'tType' : $(this).attr('data-type')
				        }, function(data) {
				        	if(data.state) {
				        		$('.main2_right_package_nav').find('ul').find('li.xx').removeClass('on');
								obj.addClass('on');
								$('.package_l, .package_r').empty();
				        		$.each(data.resultList, function(i, m){
				        			var pot = m.tsystem == 2 ? '<img src="webviews/common/img/lb_pot01.jpg" width="14" height="14" />' : m.tsystem == 3 ? '<img src="webviews/common/img/lb_pot02.jpg" width="14" height="14" />' : '<img src="webviews/common/img/lb_pot03.jpg" width="14" height="14" />';
				        			var lbClass = m.tcount - m.scount > 0 ? 'lb_on' : 'lb_off';
				        			$('#main2_right_package_content_' + i).empty();
				        			$('#main2_right_package_content_' + i).attr('title', m.packageName).append('<img src="'+commonFn.getImgUrl(m.timg)+'" width="192" height="108" /><span class="lb_name">'+m.packageName+'</span><span>已领取：'+m.scount+'个</span><span>剩余数：'+(m.tcount-m.scount)+'个</span><span style="width:72px;">平台：'+pot+'</span><a href="javascript:void(0)" data-url="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm" class="'+lbClass+'" onclick="indexFn.checkClick($(this))">领取</a>');
				        		})
				        	}
				        });
					})
				})
			},
			this.searchGame = function(data) {
				$._post("index/getIndexViewProductOsType.do", data, function(data) {
					if(data.state){
						$("#game_content").empty();
						$.each(data.resultList, function(i, m) {
							$("#game_content").append('<li class="main3_content_icon_game"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.ID+'.htm"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="90" height="90" /><span class="main3_content_icon_game_gameName">'+m.gameName+'</span></a></li>');
						});
						$("#game_content").append('<li class="main3_content_icon_game"><a target="_blank" href="'+commonFn.getRelLink('ku')+'"><img src="webviews/common/img/more.png" width="90" height="90" /><span class="main3_content_icon_game_gameName">更多</span></a></li>');
					}
				});
			},
			this.checkClick = function(obj) {
				if (obj.hasClass('lb_off')) {
					return;
				}
				window.open(obj.attr('data-url'));
			}
		}
		// param存放该页面定义对象
		com.lz.yh.index.param = function() {
			this.searchData = {"gameType":0,"osType":0,"priceType":0,"languageType":0}// 搜索条件
		}
		
		var indexParam = new com.lz.yh.index.param();
		var indexFn = new com.lz.yh.index.fn();
		
		
		$(function(){
			document.title = '最良心的游戏门户站_悦玩网';
			
			indexFn.packageNavClick();
			indexFn.searchGame(indexParam.searchData);
			//广告aaa
			$._getAdvert('#advertA','1','585','100','2','0');
 			$._getAdvert('#advertB','1','1180','100','1','1');
			$._getAdvert('#advertC','1','1180','100','1','2');
			$._getAdvert('#advertD','1','340','220','1','3');
			$._getAdvert('#advertE','1','1180','100','1','2');
			$._getAdvert('#advertF','1','1180','100','1','2');
			$._getAdvert('#advertG','1','1180','100','1','4');
			$._getAdvert('#advertH','1','340','135','2','0');
			$._getAdvert('#advertI','1','340','220','1','3');
			//背景广告  弹窗广告
			$._closeAdverts();
			$._showBtAdvert('4');
			$._closeDlAdverts();
			$._showDlAdvert('3');
			$._showDlAdvert('4');
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
			<div id="advertA" data-type="1" data-index="0" class="adverta">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="main1">
				<div class="main1_left">
					<div class="main1_banner">
						<jsp:include page="./component/banner.jsp"></jsp:include>
					</div>
					<div class="main1_activity">
						<jsp:include page="./component/hotActivity.jsp"></jsp:include>
					</div>
				</div>
				<div class="main1_right">
					<jsp:include page="./component/topNews.jsp"></jsp:include>
				</div>
			</div>
			<div id="advertB" data-type="1" data-index="1">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="main2">
				<div class="main2_left">
					<jsp:include page="./component/xypc.jsp"></jsp:include>
				</div>
				<div class="main2_line"></div>
				<div class="main2_right">
					<jsp:include page="./component/sylb.jsp"></jsp:include>
				</div>
			</div>
			<div id="advertC" data-type="1" data-index="2">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="main3">
				<jsp:include page="./component/rmxz.jsp"></jsp:include>
			</div>
			<div class="main4">
				<div class="main4_left">
					<jsp:include page="./component/rmzq.jsp"></jsp:include>
				</div>
				<div class="main4_line_l"></div>
				<div class="main4_mid">
					<jsp:include page="./component/hbzt.jsp"></jsp:include>
				</div>
				<div class="main4_line_r"></div>
				<div class="main4_right">
					<jsp:include page="./component/kfkc.jsp"></jsp:include>
					<div id="advertD" data-type="1" data-index="3" class="advertd">
						<jsp:include page="../common/advertA.jsp"></jsp:include>
					</div>
				</div>
			</div>
			<div id="advertE" data-type="1" data-index="2">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="main5">
				<div class="main5_left">
					<jsp:include page="./component/rmpc.jsp"></jsp:include>
				</div>
				<div class="main5_line"></div>
				<div class="main5_right">
					<jsp:include page="./component/rmgl.jsp"></jsp:include>
				</div>
			</div>
			<div id="advertF" data-type="1" data-index="2" style="height:100px;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<div class="main6">
				<div class="main6_top">
					<jsp:include page="./component/cyzx.jsp"></jsp:include>
				</div>
				<div class="main6_bottom">
					<jsp:include page="./component/yxsp.jsp"></jsp:include>
				</div>
			</div>
			<div id="advertG" data-type="1" data-index="4" style="height:100px;clear: both;">
				<jsp:include page="../common/advertA.jsp"></jsp:include>
			</div>
			<jsp:include page="../rank/component/Ranks.jsp"></jsp:include>
			<jsp:include page="../common/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>