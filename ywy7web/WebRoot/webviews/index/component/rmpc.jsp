<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">热门评测</div>
<div class="more fifth" title="更多"><a href="http://news.ywy7.com/news/sypc.htm">...</a></div>
<div class="main5_left_content" id="hotEvaluation"></div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexEvaluation.do",
	     	data: {
				'perNumber' : 4,
				'tType' : 4
	        },
	        success: function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			var str = '';
	        			str += '<div class="main5_l_c_div" title="'+m.title+'"><img class="main5_l_c_img" src="'+commonFn.getImgUrl(m.timg)+'" width="200" height="110" />';
	        			str += '<span class="main5_l_c_title">'+m.title+'</span><span class="main5_l_c_desc">'+$._ffsize($._substring($._removeHTMLTag(m.content)), 75)+'<a target="_blank" href="'+commonFn.getRelLink('news')+'/evaluation/'+m.id+'.htm">详情++</a></span>';
	        			str += '<div class="main5_l_line"></div>';
	        			str += '<span class="main5_l_c_heat"><font>'+(i == 0 ? 9.3 : i == 1 ? 9.1 : i == 2 ? 8.9 : 8.5)+'</font></span>';
	        			$('#hotEvaluation').append(str);
	        		})
	        	}
	        }
		})
	})
</script>