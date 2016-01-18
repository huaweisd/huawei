<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="video_yxsp header02 padding-b0">
	<h2><span><a target="_blank" href="http://gl.ywy7.com/raiders/spgl.htm">更多&gt;&gt;</a></span>视频攻略</h2>
	<div class="video_yxsp_nr">
		<ul id="video_spgl_nr"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$._post("video/getVideoRaiders.do", {
     		'perNumber' : 4,
			'tType' : 3
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#video_spgl_nr').append('<li title='+m.title+'><a target="_blank" href="'+ commonFn.getRelLink("gl") + '/raiders/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" height="145" width="280"><span>'+m.title+'</span></a></li>');
        		})
        	}
        });
	})
</script>