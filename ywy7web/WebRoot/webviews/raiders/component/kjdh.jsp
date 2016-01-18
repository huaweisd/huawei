<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="info_r_yxzx_title">快捷导航</div>
<div class="info_r_yxzx_list w328">
	<div class="info_r_yxzx_list_nav">
		<ul id="kjdh_nav">
			<li class="selectOn" data-i="1">攻略</li>
			<li data-i="2">资讯</li>
			<li data-i="3">视频</li>
		</ul>
	</div>
	<div class="info_r_yxzx_list_div" id="kjdh_list">
		<dl id="info_gl" class="kjdh_hide kjdh_show"></dl>
		<dl id="info_zx" class="kjdh_hide"></dl>
		<dl id="info_sp" class="kjdh_hide"></dl>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$._post("index/getIndexNews.do", {
			'perNumber' : 10,
			'order' : 1
		}, function(data){
			$.each(data.resultList, function(i, m){
				if(i==0){
					$('#info_zx').append('<dd class="info_r_yxzx_list_1 fll ellipsis"><a href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}else if(i==1){
					$('#info_zx').append('<dd class="info_r_yxzx_list_2 fll"><a href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" target="_blank"><img class="fll" src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><p class="fll">'+m.title+'</p></a></dd>');
				}else{
					$('#info_zx').append('<dd class="info_r_yxzx_list_3 fll ellipsis"><a href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}
			})
		})
		$._post("index/getIndexRaiders.do", {
			'perNumber' : 10,
			'order' : 1
		}, function(data){
			$.each(data.resultList, function(i, m){
				if(i==0){
					$('#info_gl').append('<dd class="info_r_yxzx_list_1 fll ellipsis"><a href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}else if(i==1){
					$('#info_gl').append('<dd class="info_r_yxzx_list_2 fll"><a href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" target="_blank"><img class="fll" src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><p class="fll">'+m.title+'</p></a></dd>');
				}else{
					$('#info_gl').append('<dd class="info_r_yxzx_list_3 fll ellipsis"><a href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}
			})
		})
		$._post("index/getIndexVideos.do", {
			'perNumber' : 10,
			'order' : 1
		}, function(data){
			$.each(data.resultList, function(i, m){
				if(i==0){
					$('#info_sp').append('<dd class="info_r_yxzx_list_1 fll ellipsis"><a href="'+commonFn.getRelLink('v')+'/video/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}else if(i==1){
					$('#info_sp').append('<dd class="info_r_yxzx_list_2 fll"><a href="'+commonFn.getRelLink('v')+'/video/'+m.id+'.htm" target="_blank"><img class="fll" src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><p class="fll">'+m.title+'</p></a></dd>');
				}else{
					$('#info_sp').append('<dd class="info_r_yxzx_list_3 fll ellipsis"><a href="'+commonFn.getRelLink('v')+'/video/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}
			})
		})
		$.each($('#kjdh_nav').find('li'), function(i, m){
			$(this).click(function(){
				if($(this).hasClass('selectOn')){
					return;
				}
				$('#kjdh_nav').find('li').removeClass('selectOn');
				$(this).addClass('selectOn');
				var index = $(this).attr('data-i');
				$('#kjdh_list').find('dl').removeClass('kjdh_show');
				if(index==1){
					$('#info_gl').addClass('kjdh_show');
				}else if(index==2){
					$('#info_zx').addClass('kjdh_show');
				}else{
					$('#info_sp').addClass('kjdh_show');
				}
			})
		})
	})
</script>