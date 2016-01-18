<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">火爆专题</div>
<div class="more fourth" title="更多"><a href="http://xy.ywy7.com">...</a></div>
<div class="main4_mid_content">
	<ul id="hotSpecial"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("index/getIndexEvaluation.do", {
			'perNumber' : 10,
			'tType' : 2
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			if(i < 2){
        				$('#hotSpecial').append('<li class="hotSpecial_gl" title="'+m.title+'"><a target="_blank" href="'+commonFn.getRelLink('news')+'/evaluation/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="350" height="130" /><div><p>'+m.title+'</p></div></a></li>');
        			} else{
        				$('#hotSpecial').append('<li class="hotSpecial_pt"><a target="_blank" href="'+commonFn.getRelLink('news')+'/evaluation/'+m.id+'.htm" title="'+m.title+'">'+m.title+'</a></li>');
        			}
        		})
        	}
        });
	})
</script>