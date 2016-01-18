<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${nav == 'index'}">
<div class="area-title">开服开测</div>
<div class="more fourth kfkc_nav">
	<ul>
		<li><a href="javascript:void(0)" class="kfkc_nav_on" id="kfkc_nav0" tag="1">开测表</a></li>
		<li><a href="javascript:void(0)" id="kfkc_nav1" tag="2">开服表</a></li>
		<li><a href="javascript:void(0)" id="kfkc_nav2" tag="3">单机表</a></li>
	</ul>
</div>
</c:if>
<c:if test="${nav =='xy'}">
<div id="xy_kfkc" style="width: 318px;border-top-width: 0px; clear: both;overflow: hidden;padding: 16px 15px;background:url(common/img/xy_xyqdb_x.jpg) no-repeat top;padding-top:0px;">
<span style="color: #000;font-size: 24px;line-height: 50px;">开服开测</span>
<div class="more fourth kfkc_nav">
	<ul>
		<li><a href="javascript:void(0)" class="kfkc_nav_on" id="kfkc_nav0" tag="1">开测表</a></li>
		<li><a href="javascript:void(0)" id="kfkc_nav1" tag="2">开服表</a></li>
		<li><a href="javascript:void(0)" id="kfkc_nav2" tag="3">单机表</a></li>
	</ul>
</div>
</div>
</c:if>
<div class="kfkc_content" id="kfkcContent"></div>
<script type="text/javascript">
	function KFKC(type){
		$.ajax({
			type: "POST",
	        url: "index/getIndexKFKC.do",
	     	data: {
				'perNumber' : 10,
				'type' : type
	        },
	        success: function(data) {
	        	if(data.state) {
	        		var str = '';
	        		if(type == 1){
        				str += '<dl class="kc"><dt><ul class="kc_title"><li class="kc_time">时间</li><li class="kc_game">游戏</li><li class="kc_state">状态</li><li class="kc_package">礼包</li></ul></dt><dd>';
        				$.each(data.resultList, function(i, m){
    	        			str += '<ul class="kc_title"><li class="kc_time">'+m.prodTestTimeStr.substring(5, 11)+'</li><li class="kc_game">'+m.gameName+'</li><li class="kc_img"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="45" height="45" /></li><li class="kc_state">'+$._testState(m.prodTestType)+'</li><li class="kc_package" tag="'+m.packNum+'"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'_1.htm">领取</a></li></ul>'
    	        		})
    	        		str += '<div class="kfkc_more"><a href="http://xy.ywy7.com/newGame/kfkc.htm">更多</a></div></dd></dl>';
    	        		$('#kfkcContent').html(str);
    	        		$('.kc').find('dd').find('ul').eq(0).height(49).find('.kc_game').hide();
    	        		$('.kc').find('dd').find('ul').eq(0).find('.kc_img').show();
    	        		$('.kc').find('dd').find('ul').hover(function(){
    	        			$('.kc').find('dd').find('ul').height(29).find('.kc_game').show();
    	        			$('.kc').find('dd').find('ul').find('.kc_img').hide();
    	        			$(this).height(49).find('.kc_game').hide();
    	        			$(this).find('.kc_img').show();
    	        		})
        			}else if(type == 2){
        				str += '<dl class="kf"><dt><ul class="kf_title"><li class="kf_time">时间</li><li class="kf_game">游戏</li><li class="kf_server">服务器</li><li class="kf_package">礼包</li></ul></dt><dd>';
        				$.each(data.resultList, function(i, m){
    	        			str += '<ul class="kf_title"><li class="kf_time">'+m.openTimeStr.substring(5, 11)+'</li><li class="kf_game">'+m.gameName+'</li><li class="kf_img"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="45" height="45" /></li><li class="kf_server">'+m.gameArea+'</li><li class="kf_package" tag="'+m.packNum+'"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'_1.htm">领取</a></li></ul>';
    	        		})
    	        		str += '<div class="kfkc_more"><a href="'+commonFn.getRelLink('xy')+'/newGame/kfkc.htm">更多</a></div></dd></dl>';
        				$('#kfkcContent').html(str);
        				$('.kf').find('dd').find('ul').eq(0).height(49).find('.kf_game').hide();
        				$('.kf').find('dd').find('ul').eq(0).find('.kf_img').show();
        				$('.kf').find('dd').find('ul').hover(function(){
        					$('.kf').find('dd').find('ul').height(29).find('.kf_game').show();
        					$('.kf').find('dd').find('ul').find('.kf_img').hide();
        					$(this).height(49).find('.kf_game').hide();
        					$(this).find('.kf_img').show();
        				})
        			}else{
        				str += '<dl class="dj"><dt><ul class="dj_title"><li class="dj_time">时间</li><li class="dj_game">游戏</li><li class="dj_type">类型</li><li class="dj_area">专区</li></ul></dt><dd>';
        				$.each(data.resultList, function(i, m){
        					str += '<ul class="dj_title"><li class="dj_time">'+$._DateFormat(new Date(m.startTimeStr), 'MM-dd')+'</li><li class="dj_game">'+m.gameName+'</li><li class="dj_img"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="45" height="45" /></li><li class="dj_type">'+m.procductsTypes+'</li><li class="dj_area"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm">专区</a></li></ul>';
        				})
        				str += '<div class="kfkc_more"><a href="'+commonFn.getRelLink('xy')+'/newGame/kfkc.htm">更多</a></div></dd></dl>';
        				$('#kfkcContent').html(str);
        				$('.dj').find('dd').find('ul').eq(0).height(49).find('.dj_game').hide();
        				$('.dj').find('dd').find('ul').eq(0).find('.dj_img').show();
        				$('.dj').find('dd').find('ul').hover(function(){
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
	$(function(){
		KFKC(1);
		$.each($('.kfkc_nav').find('ul').find('li').find('a'), function(i, m){
			$('#kfkc_nav' + i).click(function(){
				if($(this).hasClass('kfkc_nav_on')){
					return;
				}
				$('.kfkc_nav').find('ul').find('li').find('a').removeClass('kfkc_nav_on');
				$(this).addClass('kfkc_nav_on');
				switch ($(this).attr('tag')) {
					case '1' :
						KFKC(1);
						break;
					case '2' :
						KFKC(2);
						break;
					case '3' :
						KFKC(3);
						break;
					default : 
						break;
				}
			})
		})
	})
</script>