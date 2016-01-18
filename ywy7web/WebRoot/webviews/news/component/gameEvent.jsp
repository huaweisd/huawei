<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="zx_yxzhyhd">
		<h2>游戏展会与活动</h2>
	    <ul class="zx_yxzhyhd_1">
	    </ul>
	</div>
<script type="text/javascript">
	//游戏会展活动
	$(function(){
		getGameEvent();
	})
	
	function getGameEvent(){
	$.ajax({
            type: "POST",
            url: "news/getGamesNews.do",
         	data: {
				"tType":19,
				"perNumber": 6
            },
            success: function(data) {
	            $.each(data.resultList,
		            function(i, m) {
		           	if(i < 6)
						{
						 $(".zx_yxzhyhd_1").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'><img src='+commonFn.getImgUrl(m.timg)+' width="160" height="105" title='+m.title+' /></a></li>');
						}
		               
		        });
			}
        });
	}
	
</script>    
	



