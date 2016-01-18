<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2><span style='float: right; font-size: 14px;font-weight: normal;'><a target="_blank" href="http://xy.ywy7.com/newGame/zyx.htm">更多>></a></span>专区推荐</h2>
<div class="zq_zqtj_nr_1" style="height:485px;"></div>
    
<script type="text/javascript">
	$(function(){
		 $.ajax({
			type: "POST",
			url: "region/getRegion.do",
			data : {
				"zqType":9,
				"perNumber" : 9
			},
			success: function(data) {
				$.each(data.resultList, function(i,m) {
					$(".zq_zqtj_nr_1").append('<ul><li class="pic"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.imgA)+'" width="210" height="125" title="'+m.gameName+'" /></a></li><li class="txt"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm">'+m.gameName+'</a></li></ul>');  
				});
			}
		})
	})
</script>


