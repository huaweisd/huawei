<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="info_r_yxzx_title">游戏资讯</div>
<div class="info_r_yxzx_list">
	<div class="info_r_yxzx_list_div">
		<dl id="info_yxzx"></dl>
	</div>
</div>
<div class="info_r_yxzx_title">热门攻略</div>
<div class="info_r_yxzx_list">
	<div class="info_r_yxzx_list_div">
		<dl id="info_rmgl"></dl>
	</div>
</div>
<div class="info_r_yxzx_title">热门视频</div>
<div class="info_r_yxzx_list">
	<div class="info_r_yxzx_list_div">
		<dl id="info_rmsp"></dl>
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
					$('#info_yxzx').append('<dd class="info_r_yxzx_list_1 fll ellipsis"><a href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}else if(i==1){
					$('#info_yxzx').append('<dd class="info_r_yxzx_list_2 fll"><a href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" target="_blank"><img class="fll" src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><p class="fll">'+m.title+'</p></a></dd>');
				}else{
					$('#info_yxzx').append('<dd class="info_r_yxzx_list_3 fll ellipsis"><a href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}
			})
		})
		$._post("index/getIndexRaiders.do", {
			'perNumber' : 10,
			'order' : 1
		}, function(data){
			$.each(data.resultList, function(i, m){
				if(i==0){
					$('#info_rmgl').append('<dd class="info_r_yxzx_list_1 fll ellipsis"><a href="'+ commonFn.getRelLink("gl") + '/raider/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}else if(i==1){
					$('#info_rmgl').append('<dd class="info_r_yxzx_list_2 fll"><a href="'+ commonFn.getRelLink("gl") + 'raider/'+m.id+'.htm" target="_blank"><img class="fll" src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><p class="fll">'+m.title+'</p></a></dd>');
				}else{
					$('#info_rmgl').append('<dd class="info_r_yxzx_list_3 fll ellipsis"><a href="'+ commonFn.getRelLink("gl") + '/raider/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}
			})
		})
		$._post("index/getIndexVideos.do", {
			'perNumber' : 10,
			'order' : 1
		}, function(data){
			$.each(data.resultList, function(i, m){
				if(i==0){
					$('#info_rmsp').append('<dd class="info_r_yxzx_list_1 fll ellipsis"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}else if(i==1){
					$('#info_rmsp').append('<dd class="info_r_yxzx_list_2 fll"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank"><img class="fll" src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><p class="fll">'+m.title+'</p></a></dd>');
				}else{
					$('#info_rmsp').append('<dd class="info_r_yxzx_list_3 fll ellipsis"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank">'+m.title+'</a></dd>');
				}
			})
		})
	})
</script>