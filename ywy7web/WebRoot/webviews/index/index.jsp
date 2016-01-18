<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>最良心的游戏门户站_悦玩网</title>
<meta content="悦玩网，手机游戏，安卓游戏，苹果游戏，IOS，TV游戏，电视游戏" http-equiv="keywords"/>
<meta content="悦玩网是专注于手机游戏、TV游戏的专业媒体网站，为玩家提供最新最好玩的手机、TV游戏下载、推荐，发布专业手机游戏资讯、攻略、评测，以及手机网游礼包发放、玩家交流等，是专注于攻略、评测为主体的游戏媒体网站。" http-equiv="description" />
<link rel="shortcut icon" href="http://boss.ywy7.com/html/images/yww.ico" /> 
<link href="http://boss.ywy7.com/html/common/main.css?v=1.0" rel="stylesheet" type="text/css">
<link href="http://boss.ywy7.com/html/css/login.css?v=1.0" rel="stylesheet" type="text/css">
<link href="http://boss.ywy7.com/html/css/validationEngine.jquery.css" rel="stylesheet" type="text/css">

<!-- JS非空校验 -->
<script type="text/javascript" src="http://boss.ywy7.com/html/js/jquery-1.8.3.min.js"></script>
<!-- 模态窗口 -->
<script type="text/javascript" src="http://boss.ywy7.com/html/js/koala.min.1.5.js"></script>
<script type="text/javascript" src="http://boss.ywy7.com/html/js/json2.js"></script>

<script type="text/javascript" src="http://boss.ywy7.com/html/js/jquery.leanModal.min.js"></script>
<script type="text/javascript" src="http://boss.ywy7.com/html/js/jquery.validationEngine.js"></script>
<script type="text/javascript" src="http://boss.ywy7.com/html/js/languages/jquery.validationEngine-zh_CN.js"></script>

<script type="text/javascript" charset="utf-8" src="webviews/index/component/main.js"></script>
<script type="text/javascript" charset="utf-8" src="webviews/index/component/tms.js"></script>
<script type="text/javascript" charset="utf-8">
	function doSomething(){
		if(document.body.clientWidth >= 1720){
			$('#clickImg').find('a').width(1720);
			$('#closebackground').css('right', -1720/2+'px');
		}
		if(document.body.clientWidth < 1720 && document.body.clientWidth > 1180){
			$('#clickImg').find('a').width(document.body.clientWidth);
			$('#closebackground').css('right', -document.body.clientWidth/2+'px');
		}
		if(document.body.clientWidth <= 1180){
			$('#backImg').css('background', 'url()');
			$('#bg').css('margin-top', '0');
			$(".background_close").hide();
			$('#clickImg').hide();
		}
	}
	
	$(function(){
		$.ajax({
			type: "POST",
            url: "http://boss.ywy7.com/tms/index/querytAdvert.do",
            data: {tType:28},
            success: function(msg) {
            	var tin1 = 0;
            	var tin2 = 0;
            	$.each(msg, function(i, m){
            		if(msg[i].tindex == 1){
            			tin1++;
            		}else if(msg[i].tindex == 2){
            			tin2++;
            		}
            	})
            	if(tin1 == 0 || tin2 == 0){
            		return;
            	}
            	$('#dladvert').show();
            	$.each(msg, function(i, m){
            		if(i<2){
	            		if(msg[i].tindex == 1){
	            			if($('#dladvert1').attr('src') == ''){
	            				$('#dladvert1').attr('src', getImgUrl(msg[i].timg)).click(function(){
		            				window.open(msg[i].turl);
		            			})
	            			}
	            		}else if(msg[i].tindex == 2){
	            			if($('#dladvert2').attr('src') == ''){
		            			$('#dladvert2').attr('src', getImgUrl(msg[i].timg)).click(function(){
		            				window.open(msg[i].turl);
		            			})
	            			}
	            		}
            		}
            	})
            }
		})
		$.ajax({
			type: "POST",
            url: "http://boss.ywy7.com/tms/index/querytAdvert.do",
            data: {tType:28},
            success: function(msg) {
            	$.each(msg, function(i, m){
            		if(m.tindex == 3){
	            		$('#tk_bottom').html('<span style="width:270px; height:20px;float:left;text-align:center;font-size:16px;background:rgb(217,223,240);color:#000;">'+msg[i].ttitle+'</span><img src="'+getImgUrl(msg[i].timg)+'" width="270" height="170" onclick="window.open(\''+msg[i].turl+'\')" /><img src="images/close.png" style="position: absolute;right: 0;top: 0;" onclick="$(\'#tk_bottom\').fadeOut();"/>');
	            		$('#tk_bottom').fadeIn();
            		}
            	})
            }
		})
	})
	
	function hideImg(obj, id){
		$('#dladvert').hide();
	}
</script>
</head>

<body onresize="javascript:doSomething();">
<div id="tk_bottom" style="width:270px;height:190px; position: fixed; bottom: 0; right: 10px;display: none;"></div>
<div id="backImg">
<div id="dladvert" style="width: 100%; height: 600px; position: fixed; z-index: -90;top: 125px;display: none;">
	<img src="webviews/common/img/close.png" alt="" style="position: absolute;left: 140px; top: 0;z-index: 1000;" onclick="hideImg()" />
	<img src="webviews/common/img/close.png" alt="" style="position: absolute;right: 50px; top: 0;z-index: 1000;" onclick="hideImg()" />
	<img id="dladvert1" src="" alt="" width="110" height="600" style="position: absolute;left: 50px;z-index: 999;" />
	<img id="dladvert2" src="" alt="" width="110" height="600" style="position: absolute;right: 50px;z-index: 999;" />
</div>
	<div id="bg">
		<div id="top01"></div>

		<div id="ny_logo_search">
			
		</div>
		<!--end LOGO 搜索 APP下载微信扫一扫图标-->
		<div id="nav">
			<ul>
				<li class="btn01"><a href="http://www.ywy7.com"><img src="http://boss.ywy7.com/html/images/nav_bt01_.jpg" width="131" height="48" /></a></li>
				<li class="btn02"><a  target="_blank"  href="http://xy.ywy7.com"></a></li>
				<li class="btn03"><a target="_blank" href="http://gl.ywy7.com"></a></li>
				<li class="btn04"><a target="_blank" href="http://pack.ywy7.com"></a></li>
				<li class="btn05"><a target="_blank" href="http://news.ywy7.com"></a></li>
				<li class="btn06"><a href="http://www.ywy7.com/rank.htm"></a></li>
				<li class="btn07"><a href="http://area.ywy7.com"></a></li>
				<li class="btn08"><a target="_blank" href="http://v.ywy7.com"></a></li>
				<li class="btn09"><a href="#"></a></li>
			</ul>
		</div>
		<!--end 导航-->
		<div id="sixpic" class="area-girl-wall">
			<ul>
				<li class="e01" ><a class="girl-item" ><img twtag="1" src="" width="282" height="415" /></a></li>
				<!-- <li class="e02" ><a class="girl-item" ><img twtag="2" src="" width="624" height="264" /></a></li> -->
				<li class="e02 qiehuan">
					<div id="fsD12" class="focus" style=" height: 260px;  width: 630px;">
						<div id="D1pic12" class="fPic" style=" height: 260px;  width: 630px;"></div>
						<div class="fbg">
							<div class="D1fBt" id="D1fBt2">
								<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
								<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
								<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
								<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
							</div>
						</div>
						<span class="prev"></span><span class="next"></span>
					</div>
					<!-- end 三图切换 -->
				</li>
				<li class="e03" ><a class="girl-item" ><img twtag="3" src="" width="256" height="264" /></a></li>
				<li class="e04" ><a class="girl-item" ><img twtag="4" src="" width="290" height="143" /></a></li>
				<li class="e05" ><a class="girl-item" ><img twtag="5" src="" width="290" height="143" /></a></li>
				<li class="e06" ><a class="girl-item" ><img twtag="6" src="" width="290" height="143" /></a></li>
			</ul>
		</div>
		<!--end 六图广告-->
		<div id="twopic">
			<ul>
				<li ggtag="1"><a href="#"><img src=""
						width="585" height="100" title="标题名称" /></a></li>
				<li class="right" ggtag="2"><a href="#"><img
						src="" width="585" height="100" title="标题名称" /></a></li>
			</ul>
		</div>
		<!--end 两图广告位-->
		<div id="rmxz_title">热门下载 <span style="float:right;font-size:14px;"><a tag="more_g" uri="zyx.htm">更多</a></span></div>
		<div id="rmxz_container">
			<div id="rmxz_search_list">
				<div id="rmxz_search">
					<form>
						<span class="s_ipt_wr2"><input type="text" name="wd"
							id="gameName" maxlength="100" class="s_ipt2" /></span> <input
							id="QUERY_BTN" type="button" class="btn" value="" />
					</form>
				</div>
				<div id="rmxz_list">
					<dl>
						<dt>类型</dt>
						<dd>
							<ul class="DOWNLOAD_GAME_TYPE">
								<li><a class="rmxz_active all_type">全部</a></li>

							</ul>
						</dd>
					</dl>
					<dl>
						<dt>系统</dt>
						<dd>
							<ul class="DOWNLOAD_OS_TYPE">
								<li><a class="rmxz_active all_type">全部</a></li>

							</ul>
						</dd>
					</dl>
					<dl>
						<dt>价格</dt>
						<dd>
							<ul class="DOWNLOAD_PRICE_TYPE">
								<li><a class="rmxz_active all_type">全部</a></li>

							</ul>
						</dd>
					</dl>
					<dl>
						<dt>语言</dt>
						<dd>
							<ul class="DOWNLOAD_LANGUAGE_TYPE">
								<li><a class="rmxz_active all_type">全部</a></li>

							</ul>
						</dd>
					</dl>
				</div>
			</div>
			<!--end-->
			<div id="rmxz_icon">
				<ul class="result_rmyx">

				</ul>
			</div>
			<!--end 右侧图标-->
		</div>

		<!--end 热门下载-->
		<div id="container">
			<div id="tlzx">
				<h2>
					<span><a tag="more_g" uri="http://news.ywy7.com">更多</a></span>头条资讯
				</h2>
				<div id="tlzx_nr">
					<ul class="ltitle ttzx_1">

					</ul>
					<ul class="tlzx_nr_list ttzx_2">

					</ul>
					<ul class="ltitle ttzx_3">

					</ul>
					<ul class="tlzx_nr_list ttzx_4">

					</ul>
				</div>

			</div>
			<!--end 头条资讯-->
			<a name="anchor_1">&nsbp;</a>
			<div id="rmhd_lb">
				<div id="rmhd">
					<h2>
						<span><a tag="more_g" uri="http://news.ywy7.com">更多</a></span>热门活动
					</h2>
					<div id="rmhd_nr">
						<div id="fsD1" class="focus">
							<div id="D1pic1" class="fPic">
							
							</div>
							<div class="fbg">
								<div class="D1fBt" id="D1fBt">
									<a href="javascript:void(0)" hidefocus="true" target="_self" ><i></i></a>
									<a href="javascript:void(0)" hidefocus="true" target="_self" ><i></i></a>
									<a href="javascript:void(0)" hidefocus="true" target="_self" ><i></i></a>
									<a href="javascript:void(0)" hidefocus="true" target="_self" ><i></i></a>
								</div>
							</div>
							<span class="prev"></span><span class="next"></span>
						</div>
						<!--end 三图切换-->
					</div>
				</div>
				<div id="lb">
					<h2>
						<span><a tag="more_g" uri="http://pack.ywy7.com">更多</a></span><span style="padding-left: 20px;padding-right:20px;"><a href="#">我的礼包</a></span><span>今日新增礼包<font class="today_package"></font>个</span>推荐礼包
					</h2>
					<div id="lb_nr" class="lb_nr_1" style="height: 330px;"></div>
				</div>
			</div>
			<!--end 热门活动 礼包-->
			<div id="mem_kfkc">
				<div id="mem">
					
				</div>
				<!--end -->
				<div id="kfkc">
					<ul	style="float: left; color: #000; font-weight: bold; font-size: 24px; line-height: 50px; width: 120px; font-family:"黑体";"><a tag="more_g" uri="http://xy.ywy7.com/newGame/kfkc.htm">开服开测</a>
					</ul>
					<ul id="taba">
						<li class="current">开测表</li>
						<li>开服表</li>
						<li>单机表</li>
					</ul>
					<div id="contenta">
						<ul style="display: block;">
							<table width="270" border="0" cellspacing="0" cellpadding="0" id="kfkc_kcb">
								<tr>
									<th><b>时间</b></th>
									<th><b>游戏</b></th>
									<th><b>状态</b></th>
									<th><b>礼包</b></th>
								</tr>
								
							</table>
						</ul>
						<ul>
							<table width="270" border="0" cellspacing="0" cellpadding="0"  id="kfkc_kfb">
								<tr>
									<th><b>时间</b></th>
									<th><b>游戏</b></th>
									<th><b>服务器</b></th>
									<th><b>礼包</b></th>
								</tr>
								
							</table>
						</ul>
						<ul>
							<table width="270" border="0" cellspacing="0" cellpadding="0" id="kfkc_djb">
								<tr>
									<th><b>时间</b></th>
									<th><b>游戏</b></th>
									<th><b>类型</b></th>
									<th><b>专区</b></th>
								</tr>
								
							</table>
						</ul>
						<div class="more_div"><a tag="more_g" uri="http://www.ywy7.com/rank.htm">更多</a></div>
					</div>
				</div>
			</div>
			<!--end 登陆注册 开服开测-->
		</div>
		<!--end 头条资讯 热门活动 礼包 登录注册 开服开测-->
		<div id="ad_pic09" ggtag="3">
			<a href="#"><img src="" width="1180"
				height="84" title="标题名称" /></a>
		</div>
		<a name="anchor_2">&nsbp;</a>
		<div id="xypc_title">新游评测</div>
		<div id="container">
			<div id="xypc">
				<h2>
					<span><a tag="more_g" uri="http://xy.ywy7.com/newGame/xypc.htm">更多</a></span>新游评测
				</h2>
				<div id="xypc_nr">
					<ul class="pic xypc_nr_1">

					</ul>
					<ul class="xypc_second">

					</ul>
				</div>
			</div>
			<!--end 新游评测-->
			<div id="hbzt_jpzq">
				<div id="hbzt">
					<h2>
						<span><a tag="more_g" uri="http://xy.ywy7.com/newGame/xypc.htm">更多</a></span>火爆专题
					</h2>
					<div id="hbzt_nr">
						<ul class="hbzt_nr_1">
							
						</ul>
					</div>
				</div>
				<!--end-->
				<div id="jpzq">
					<h2>精品专区</h2>
					<div id="jpzq_nr" class="jpzq_nr_1">
						
					</div>
				</div>
			</div>
			<!--end 火爆专题 精品专区-->
			<div id="xytj">
				<h2><span><a tag="more_g" uri="http://xy.ywy7.com">更多</a></span>新游推荐</h2>
				<div id="xytj_nr">
					
					<ul class="pic xytj_nr_1">

					</ul>
					<ul class="xytj_nr_2" style="padding-top:8px;">

					</ul>
				</div>
			</div>
			<!--end-->
		</div>
		<!--end 新游评测 火爆专题 精品专区APP 新游推荐-->
		<a name="anchor_3">&nsbp;</a>
		<div id="zqrm_title">专区热门</div>
		<div id="container">
			<div id="rmzq">
				<ul
					style='float: left; color: #000; font-weight: bold; font-size: 24px; line-height: 50px; width: 120px; font-family:"黑体";'>热门专区
				</ul>
				<!--
				<ul id="tabeb">
					<li class="currentb">网游</li>
					<li>单机</li>
				</ul>
				-->
				<div id="contentb">
					<ul style="display: block;" class="rmzq_wy">

					</ul>
					<!--
					<ul class="rmzq_dj">

					</ul>
					-->
				</div>
			</div>
			<!--end 热门专区-->
			<div id="rmtj">
				<h2>
					<span><a tag="more_g" uri="http://area.ywy7.com">更多</a></span>热门推荐
				</h2>
				<div id="rmtj_nr" class="rmtj_nr_1">
					
				</div>
			</div>
			<!--end-->
			<div id="zf_zyxw">
				<div id="zf">
					<h2>
						<span><a tag="more_g" uri="http://news.ywy7.com">更多</a></span>专访
					</h2>
					<div id="zf_nr">
						<div id="zf_nra">
							<ul class="zf_1">

							</ul>
						</div>
						<div id="zf_nrb">
							<ul class="zf_2">

							</ul>
						</div>
					</div>
				</div>
				<!--end-->
				<div id="cyxw">
					<h2>
						<span><a tag="more_g" uri="http://news.ywy7.com">更多</a></span>产业新闻
					</h2>
					<div id="cyxw_nr">
						<ul class="cyxw_nr_1">

						</ul>
					</div>
				</div>
				<!--end 产业新闻-->
			</div>
		</div>
		<!--end 热门专区 热门推荐 专访 产业新闻-->
		<div id="ad_pic10" ggtag="4">
			<img src="" width="1180" height="84" />
		</div>
		<a name="anchor_4">&nsbp;</a>
		<div id="pcgl_title">评测攻略</div>
		<div id="container">
			<div id="rmpc">
				<h2>
					<span><a tag="more_g" uri="http://xy.ywy7.com/newGame/xypc.htm" style="margin-right:50px;">更多</a></span>热门评测
				</h2>
				<div id="rmpc_nr">
					<ul class="rmpc_nr_1" style="padding-top:0px;padding-bottom:0px;">
					</ul>
				</div>
			</div>
			<!--end-->
			<div id="rmgl">
				<h2>
					<span><a tag="more_g" uri="http://gl.ywy7.com">更多</a></span>热门攻略
				</h2>
				<div id="rmgl_nr">
					<ul class="rmgl_nr_1">

						</ul>
					</div>
				<div id="rmgl_nr" ggtag="5">
					
			    <a href="#"><img src="" width="270px"
				    height="90px" title="标题名称" /></a>
		
				</div>
			</div>
		</div>
		<!--end 热门评测 热门攻略-->
		<a name="anchor_5">&nsbp;</a>
		<div id="lbsp_title">礼包视频</div>
		<div id="container">
			<div id="tylb">
				<h2>
					<span><a tag="more_g" uri="http://pack.ywy7.com">更多</a></span>特约礼包
				</h2>
				<div id="tylb_nr" class="tylb_nr_1" style="height: 512px;"></div>
			</div>
			<!--end-->
			<div id="zrlb_zxlb">
				<div id="zrlb">
					<h2>
						<span><a tag="more_g" uri="http://pack.ywy7.com">更多</a></span>最热礼包
					</h2>
					<div id="zrlb_nr">
						<ul class="zrlb_nr_1">

						</ul>
					</div>
				</div>
				<div id="zxlb">
					<h2>
						<span><a tag="more_g" uri="http://pack.ywy7.com">更多</a></span>最新礼包
					</h2>
					<div id="zxlb_nr">
						<ul class="zxlb_nr_1">

						</ul>
						<ul style="padding: 8px 10px 0px 10px; clear: both;"
							class="zxlb_nr_2">

						</ul>
					</div>
				</div>
			</div>
			<!--end-->
			<div id="yxsp">
				<h2>
					<span><a tag="more_g" uri="http://v.ywy7.com">更多</a></span>游戏视频
				</h2>
				<div id="yxsp_nr">
					<ul class="yxsp_nr_yxsp_nr">
						
					</ul>
				</div>
			</div>
			<!--end-->
		</div>
		<!--end 特约礼包 最热礼包  最新礼包 游戏视频-->
		<a name="anchor_6">&nsbp;</a>
		<div id="phb_title">排行榜</div>
		<div id="container">
			<div id="phb_dj">
				<dl>
					<dt>单机排行榜</dt>
					<dd class="phb_dj_1">
						<ul style="font-size: 14px; font-weight: bold; color: #f9821a;">
							<li>排名</li>
							<li><span class="a">游戏</span></li>
							<li>类型</li>
							<li class="rd">热度</li>
						</ul>

					</dd>
				</dl>
			</div>
			<!--end-->
			<div id="phb_dj">
				<dl>
					<dt>网游排行榜</dt>
					<dd class="phb_dj_2">
						<ul style="font-size: 14px; font-weight: bold; color: #f9821a;">
							<li>排名</li>
							<li><span class="a">游戏</span></li>
							<li>状态</li>
							<li class="rd">热度</li>
						</ul>

					</dd>
				</dl>
			</div>
			<!--end-->
			<div id="phb_dj" style="margin-right: 0px; float: right;">
				<dl>
					<dt>新游期待榜</dt>
					<dd class="phb_dj_3">
						<ul style="font-size: 14px; font-weight: bold; color: #f9821a;">
							<li>排名</li>
							<li><span class="a">游戏</span></li>
							<li>状态</li>
							<li class="rd">热度</li>
						</ul>

					</dd>
				</dl>
			</div>
			<!--end-->
		</div>
		<!--end 单机排行榜 网游排行榜  新游期待榜-->
		<div id="ad_pic11" ggtag="6">
			<a href="#"><img src="" width="1180" height="84" title="标题名称" /></a>
		</div>
		<div id="area_girl_wall" class="area-girl-wall clearfix"> </div>
		
		<div id="link">
			<h2>友情链接</h2>
			<div id="link_nr">
				<ul></ul>
			</div>
		</div>
		<!--end link-->
		<div id="copyright">
			<div style="display: none;">
				<script type="text/javascript">
					var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1255592155'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1255592155%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
				</script>
			</div>
		</div>
		<!--end copyright-->
	</div>
</div>


<div id="to_top" class="to_top">
	<ul>
		<li class="to_top_1"><a href="#anchor_1">资讯</a></li>
		<li class="to_top_2"><a href="#anchor_2">评测</a></li>
		<li class="to_top_3"><a href="#anchor_3">专区</a></li>
		<li class="to_top_4"><a href="#anchor_4">攻略</a></li>
		<li class="to_top_5"><a href="#anchor_5">礼包</a></li>
		<li class="to_top_6"><a href="#anchor_6">排行</a></li>
	</ul>
</div>
<style>
.to_top{width:65px; height:255px; font:14px/20px arial; position:fixed; cursor:pointer; color:#000;right: 100px;bottom: 40px;display: none;padding-left:10px;}
.to_top ul li{line-height: 30px;height: 25px;padding-top:5px;padding-bottom:10px;padding-right:10px;text-align: right;width: 55px;background: url("webviews/common/img/m-fast-nav-icon.png");}
.to_top ul li:hover{background-color: #f55;color: #fff;}
.to_top_1{background-position: -10px 0 !important;}
.to_top_2{background-position: -10px -45px !important;}
.to_top_3{background-position: -10px -90px !important;}
.to_top_4{background-position: -10px -178px !important;}
.to_top_5{background-position: -10px -355px !important;}
.to_top_6{background-position: -10px -265px !important;}
.to_top_1_on{background-position: right 0 !important;background-color: #f55 !important;color: #fff !important;}
.to_top_2_on{background-position: right -45px !important;background-color: #f55 !important;color: #fff !important;}
.to_top_3_on{background-position: right -90px !important;background-color: #f55 !important;color: #fff !important;}
.to_top_4_on{background-position: right -178px !important;background-color: #f55 !important;color: #fff !important;}
.to_top_5_on{background-position: right -355px !important;background-color: #f55 !important;color: #fff !important;}
.to_top_6_on{background-position: right -265px !important;background-color: #f55 !important;color: #fff !important;}
.to_top_1:hover{background-position: right 0 !important;}
.to_top_2:hover{background-position: right -45px !important;}
.to_top_3:hover{background-position: right -90px !important;}
.to_top_4:hover{background-position: right -178px !important;}
.to_top_5:hover{background-position: right -355px !important;}
.to_top_6:hover{background-position: right -265px !important;}
</style>
<script>
	window.onload = function(){
  		window.onscroll = function(){
    		var scrolltop = document.documentElement.scrollTop || document.body.scrollTop;
    		if (scrolltop >= 800 && scrolltop < 2000) {
    			$('#to_top').find('ul li').eq(1).removeClass('to_top_2_on');
    			$('#to_top').find('ul li').eq(0).addClass('to_top_1_on');
    			$('#to_top').show();
			}else if(scrolltop >= 2000 && scrolltop < 2720){
				$('#to_top').find('ul li').eq(0).removeClass('to_top_1_on');
				$('#to_top').find('ul li').eq(2).removeClass('to_top_3_on');
				$('#to_top').find('ul li').eq(1).addClass('to_top_2_on');
			}else if(scrolltop >= 2720 && scrolltop < 3520){
				$('#to_top').find('ul li').eq(1).removeClass('to_top_2_on');
				$('#to_top').find('ul li').eq(3).removeClass('to_top_4_on');
				$('#to_top').find('ul li').eq(2).addClass('to_top_3_on');
			}else if(scrolltop >= 3520 && scrolltop < 3980){
				$('#to_top').find('ul li').eq(2).removeClass('to_top_3_on');
				$('#to_top').find('ul li').eq(4).removeClass('to_top_5_on');
				$('#to_top').find('ul li').eq(3).addClass('to_top_4_on');
			}else if(scrolltop >= 3980 && scrolltop < 4640){
				$('#to_top').find('ul li').eq(3).removeClass('to_top_4_on');
				$('#to_top').find('ul li').eq(5).removeClass('to_top_6_on');
				$('#to_top').find('ul li').eq(4).addClass('to_top_5_on');
			}else if(scrolltop >= 4640){
				$('#to_top').find('ul li').eq(4).removeClass('to_top_5_on');
				$('#to_top').find('ul li').eq(5).addClass('to_top_6_on');
			}else{
				$('#to_top').hide();
			}
  		}
	} 
</script>
</body>

<script>
	$(function() {
		$("#taba li").click(
				function() {
					$("#contenta ul").hide().eq(
							$("#taba li").removeClass().index(
									$(this).addClass("current"))).show();
				});
		$("#ny_logo").find("img").attr({src:"webviews/common/img/logo_home.jpg",height:"120px",width:"230px"});
	})
</script>
<!--end 开服开测 JS-->
<script>
	$(function() {
		$("#tabeb li").click(
				function() {
					$("#contentb ul").hide().eq(
							$("#tabeb li").removeClass().index(
									$(this).addClass("currentb"))).show();
				});
		
	})
</script>
<!--end 热门专区 JS-->
</html>