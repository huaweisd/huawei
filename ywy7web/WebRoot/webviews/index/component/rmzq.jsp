<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">热门专区</div>
<div class="more fourth" title="更多"><a href="http://area.ywy7.com">...</a></div>
 	<div class="main4_left_content">
	<ul id="hotArea"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexViewProductZQ.do",
	     	data: {
				'perNumber' : 4,
				'zqType' : 3
	        },
	        success: function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			$('#hotArea').append('<li class="zq"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="100" height="100" /><span class="zq_gameName">'+m.gameName+'</span><span class="zq_gameDesc"  title="'+$._removeHTMLTag(m.gameDesc)+'">'+$._ffsize($._removeHTMLTag(m.gameDesc), 50)+'</span><span class="zq_btns"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm" class="zq_btns_a">专区</a><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'_1.htm" class="zq_btns_a">礼包</a><a href="javascript:viod(0)" class="zq_btns_a">论坛</a></span></li>');
	        		})
	        	}
	        }
		})
	})
</script>