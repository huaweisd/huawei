<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_xysp">
	<h2><span><a    target="_blank" href="http://v.ywy7.com/video/yxsp.htm">更多>></a></span>新游视频</h2>
	<div class="xy_xysp_nr">
		<ul class="xy_xysp_nr_1"></ul>
	</div>
</div>					
<script type="text/javascript">
	$(function(){
		getNewGameVideo();
	});

	function getNewGameVideo(){
		$.ajax({
            type: "POST",
            url: "video/getVideoVideos.do",
         	data: {
         		"tType": 3,
				"perNumber": 10
            },
            success: function(data) {
            	$.each(data.resultList,function(i,n){
			  		if(i == 0){
				    	$(".xy_xysp_nr_1").append('<li><a href="'+commonFn.getRelLink('v')+'/video/'+n.id+'.htm"><img src='+n.timg+' width="188" height="100" /><span>'+$._ffsize(n.title, 7)+'</span></a></li>');
			  		}else if(i == 1){
					   	$(".xy_xysp_nr_1").append('<li class="right"><a href="'+commonFn.getRelLink('v')+'/video/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.timg)+' width="188" height="100" /><span>'+$._ffsize(n.title, 7)+'</span></a></li>');
			  		}
				});
            }
		});
	}
</script>	
	



