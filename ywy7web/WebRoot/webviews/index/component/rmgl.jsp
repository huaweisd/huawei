<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">热门攻略</div>
<div class="more fifth" title="更多"><a href="http://gl.ywy7.com">...</a></div>
<div class="main5_right_content">
	<div class="main5_r_c_top" id="hotRaidersTop"></div>
	<div class="main5_r_c_mid" id="hotRaidersMid"></div>
	<div id="advertI" data-type="1" data-index="3" class="advertd">
		<jsp:include page="../../common/advertA.jsp"></jsp:include>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexRaiders.do",
	     	data: {
				'perNumber' : 3,
				'tType' : 1
	        },
	        success: function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			if(i == 0) {
	        				$('#hotRaidersTop').append('<a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title="'+m.title+'"><img class="main5_r_c_top_img" src="'+commonFn.getImgUrl(m.timg)+'" width="340" height="160" /><div class="main5_r_c_top_div">'+m.title+'</div></a></div>');
	        			}else{
	        				$('#hotRaidersMid').append('<a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title="'+m.title+'"><div class="main5_r_c_mid_a"><img class="main5_r_c_mid_img" src="'+commonFn.getImgUrl(m.timg)+'" width="165" height="80" /><div class="main5_r_c_mid_div">'+m.title+'</div></div></a></div>');
	        			}
	        		})
	        		$('.main5_r_c_mid_a').eq(1).css('margin-right', '0');
	        	}
	        }
		})
	})
</script>