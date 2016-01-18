<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 热门评测 -->
<div class="zyx_rmzq">
	<h2>热门评测</h2>
	<div class="zyx_rmzq_nr">
		<ul class="rwzf_rmzq_nr_1"></ul>
	</div>
</div>
<!--广告-->
<div ggtag="3" style="margin:5px"><a href="#"></a></div>
<!-- 开服开测 -->
<div class="main4_right" style="height:640px;border: 1px solid #e1e1e1;">
	<div id="xy_kfkc" style="width: 318px;border-top-width: 0px;clear: both;overflow: hidden;padding: 16px 15px;background:url(webviews/common/img/xy_xyqdb_x.jpg) no-repeat top;padding-top:0px;">
		<span style="color: #000;font-size: 24px;line-height: 50px;">开服开测</span>
		<div class="more fourth kfkc_nav">
			<ul>
				<li><a href="javascript:void(0)" class="kfkc_nav_on" id="kfkc_nav0" tag="1">开测表</a></li>
				<li><a href="javascript:void(0)" id="kfkc_nav1" tag="2">开服表</a></li>
				<li><a href="javascript:void(0)" id="kfkc_nav2" tag="3">单机表</a></li>
			</ul>
		</div>
	</div>
	<div class="kfkc_content" id="kfkcContent"></div>
</div>
<!-- 热门礼包 -->
<div class="phb_dj" style="width: 327px;height:300px;clear: both;">
	<div class="phb_zx">
		<span style="text-align:left;">热门网络礼包</span>
		<table width="350" border="0" cellspacing="0" cellpadding="0" class="phb_nr">
			<tr>
				<th style="width:50px;">排名</th>
				<th style="width:290px;">礼包</th>
			</tr>
			<tbody class="phb_xx7"></tbody>
		</table>
	</div>
</div>
<!--end-->
<!-- 热门资讯 -->
<div class="xy_dyfb" style="height: 255px;width:315px;">
	<h2>热门资讯</h2>
	<div class="xy_dyfb_nr" style="width:320px;">
		<ul class="a004 xy_dyfb_nr_4"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		QieHuan();
		//热门评测
		getHotTest();
		//开服开测
		KFKC(1);
		//热门网络礼包
		RMWLLB();
		//热门资讯
		getHotNews();
	});
	function getHotTest() {
		$.ajax({
			type : "POST",
			url : "newGame/getGameTest.do",
			data : {
				"tType" : 4,
				"perNumber" : 2
			},
			success : function(data) {
				$.each(data.resultList, function(i, n) {
					$(".rwzf_rmzq_nr_1").append('<li><a target="_blank" href="'+commonFn.getRelLink('news')+'/evaluation/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.timg)+'" width="300" height="160" title="'+n.title+'"/><span title="'+n.title+'">'+$._ffsize(n.title, 18)+'</span></a></li>');
				});
			}
		});
	}

	function KFKC(type) {
		$.ajax({
			type : "POST",
			url : "index/getIndexKFKC.do",
			data : {
				'perNumber' : 10,
				'type' : type
			},
			success : function(data) {
				if (data.state) {
					var str = '';
					if (type == 1) {
						str += '<dl class="kc"><dt><ul class="kc_title"><li class="kc_time">时间</li><li class="kc_game">游戏</li><li class="kc_state">状态</li><li class="kc_package">礼包</li></ul></dt><dd>';
						$.each(data.resultList, function(i, m) {
							str +='<ul class="kc_title"><li class="kc_time">'+m.prodTestTimeStr.substring(5, 11)+'</li><li class="kc_game">'
								+ m.gameName+'</li><li class="kc_img"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="45" height="45" /></li><li class="kc_state">'+$._testState(m.prodTestType)
								+ '</li><li class="kc_package" tag="'+m.packNum+'"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm">领取</a></li></ul>'
						})
						$('#kfkcContent').html(str);
						$('.kc').find('dd').find('ul').eq(0).height(49).find('.kc_game').hide();
						$('.kc').find('dd').find('ul').eq(0).find('.kc_img').show();
						$('.kc').find('dd').find('ul').hover(function() {
							$('.kc').find('dd').find('ul').height(29).find('.kc_game').show();
							$('.kc').find('dd').find('ul').find('.kc_img').hide();
							$(this).height(49).find('.kc_game').hide();
							$(this).find('.kc_img').show();
						})
					} else if (type == 2) {
						str += '<dl class="kf"><dt><ul class="kf_title"><li class="kf_time">时间</li><li class="kf_game">游戏</li><li class="kf_server">服务器</li><li class="kf_package">礼包</li></ul></dt><dd>';
						$.each(data.resultList, function(i, m) {
							str +='<ul class="kf_title"><li class="kf_time">'
								+ m.openTimeStr.substring(5, 11)+'</li><li class="kf_game">'
								+ m.gameName+'</li><li class="kf_img"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="45" height="45" /></li><li class="kf_server">'
								+ m.gameArea+'</li><li class="kf_package" tag="'+m.packNum+'"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm">领取</a></li></ul>';
						})
						$('#kfkcContent').html(str);
						$('.kf').find('dd').find('ul').eq(0).height(49).find('.kf_game').hide();
						$('.kf').find('dd').find('ul').eq(0).find('.kf_img').show();
						$('.kf').find('dd').find('ul').hover(function() {
							$('.kf').find('dd').find('ul').height(29).find('.kf_game').show();
							$('.kf').find('dd').find('ul').find('.kf_img').hide();
							$(this).height(49).find('.kf_game').hide();
							$(this).find('.kf_img').show();
						})
					} else {
						str += '<dl class="dj"><dt><ul class="dj_title"><li class="dj_time">时间</li><li class="dj_game">游戏</li><li class="dj_type">类型</li><li class="dj_area">专区</li></ul></dt><dd>';
						$.each(data.resultList, function(i, m) {
							str += '<ul class="dj_title"><li class="dj_time">'
								+ $._DateFormat(new Date(m.startTimeStr), 'MM-dd')+'</li><li class="dj_game">'
								+ m.gameName+'</li><li class="dj_img"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="45" height="45" /></li><li class="dj_type">'
								+ m.procductsTypes+'</li><li class="dj_area"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm">专区</a></li></ul>';
						})
						$('#kfkcContent').html(str);
						$('.dj').find('dd').find('ul').eq(0).height(49).find('.dj_game').hide();
						$('.dj').find('dd').find('ul').eq(0).find('.dj_img').show();
						$('.dj').find('dd').find('ul').hover(function() {
							$('.dj').find('dd').find('ul').height(29).find('.dj_game').show();
							$('.dj').find('dd').find('ul').find('.dj_img').hide();
							$(this).height(49).find('.dj_game').hide();
							$(this).find('.dj_img').show();
						})
					}
				}
			}
		})
	}

	function QieHuan() {
		$.each($('.kfkc_nav').find('ul').find('li').find('a'), function(i, m) {
			$('#kfkc_nav' + i).click(function() {
				if ($(this).hasClass('kfkc_nav_on')) {
					return;
				}
				$('.kfkc_nav').find('ul').find('li').find('a').removeClass('kfkc_nav_on');
				$(this).addClass('kfkc_nav_on');
				switch ($(this).attr('tag')) {
				case '1':
					KFKC(1);
					break;
				case '2':
					KFKC(2);
					break;
				case '3':
					KFKC(3);
					break;
				default:
					break;
				}
			})
		})
	}

	function RMWLLB() {
		$.ajax({
			type : "POST",
			url : "newGame/getHotPackage.do",
			data : {
				"tType" : 2,
				"perNumber" : 5
			},
			success : function(data) {
				$.each(data.resultList, function(i, n) {
					if (i < 3) {
						$(".phb_xx7").append('<tr class="phb_tr"><td align="center"><div class="pm1">'+(i+1)+'</div></td><td align="left" width="180"><div id="phb_bt"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+n.id+'.htm" style="width:270px !important;text-align: center;">'+n.packageName+'</a></div></td> </tr> ');
					} else {
						$(".phb_xx7").append('<tr class="phb_tr"><td align="center"><div class="pm2">'+(i+1)+'</div></td><td align="left" width="180"><div id="phb_bt"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+n.id+'.htm" style="width:270px !important;text-align: center;">'+n.packageName+'</a></div></td></tr> ');
					}
				});
			}
		});
	}

	function getHotNews() {
		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 22,
				"perNumber" : 8
			},
			success : function(data) {
				$.each(data.resultList, function(i, m) {
					$(".xy_dyfb_nr_4").append('<li><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title, 20)+'</a></li>');
				});
			}
		});
	}
</script>