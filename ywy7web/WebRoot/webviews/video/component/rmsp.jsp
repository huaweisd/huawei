<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="video_yxsp header02">
	<h2>热门视频</h2>
	<div class="video_yxsp_nr">
		<ul id="video_rmsp_nr"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$._post("video/getVideoVideos.do", {
     		'perNumber' : 2,
			'tType' : 4
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#video_rmsp_nr').append('<li title='+m.title+'><a target="_blank" href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" height="145" width="280"><span>'+m.title+'</span></a></li>');
        		})
        	}
        });
	})
</script>