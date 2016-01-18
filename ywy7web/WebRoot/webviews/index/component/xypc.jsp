<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">新游评测</div>
<div class="more second" title="更多"><a href="http://xy.ywy7.com/newGame/xypc.htm">...</a></div>
<ul id="newGameTest"></ul>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexEvaluation.do",
	     	data: {
				'perNumber' : 18,
				'tType' : 1
	        },
	        success: function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			if(i == 0){
	        				$('#newGameTest').append('<li class="newGameTestGL"><a target="_blank" href="'+commonFn.getRelLink('news')+'/evaluation/'+m.id+'.htm" title="'+m.title+'"><img src="'+commonFn.getImgUrl(m.timg)+'" width="328" height="100" /><span>'+m.title+'</span></a></li>');
	        			} else{
	        				$('#newGameTest').append('<li class="newGameTestPT"><a target="_blank" href="'+commonFn.getRelLink('news')+'/evaluation/'+m.id+'.htm" title="'+m.title+'">'+m.title+'</a></li>');
	        			}
	        		})
	        	}
	        }
		})
	})
</script>