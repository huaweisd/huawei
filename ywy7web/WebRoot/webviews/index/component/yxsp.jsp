<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">游戏视频</div>
<div class="more sixth_2" title="更多"><a href="http://v.ywy7.com/video/yxsp.htm">...</a></div>
<ul id="gameVideo"></ul>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexVideos.do",
	     	data: {
				'perNumber' : 7,
				'tType' : 2
	        },
	        success: function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			if(i == 0) {
	        				$('#gameVideo').append('<li><a target="_blank" href="'+commonFn.getRelLink('v')+'/video/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="448" height="262" /><p class="main6_bottom_gl">'+m.title+'</p></a></li>');
	        			}else{
	        				$('#gameVideo').append('<li><a target="_blank" href="'+commonFn.getRelLink('v')+'/video/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="224" height="126" /><p>'+m.title+'</p></a></li>');
	        			}
	        		})
	        	}
	        }
		})
	})
</script>