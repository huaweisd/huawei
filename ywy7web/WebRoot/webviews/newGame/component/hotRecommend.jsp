<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_rmtj">
	<h2>热门推荐</h2>
	<div class="xy_rmtj_nr">
		<ul class="middle" style="width:780px;"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		getHotRecommend();
	});

	function getHotRecommend(){
		$.ajax({
            type: "POST",
            url: "news/getHotRegion.do",
         	data: {
         		"zqType":4,
				"perNumber": 12
            },
            success: function(data) {
            	$.each(data.resultList, function(i,m) {
					$(".middle").append('<li><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="105" height="95" /><span>'+m.gameName+'</span></a></li>');  
				});
            }
		});
	}
</script>	
	



