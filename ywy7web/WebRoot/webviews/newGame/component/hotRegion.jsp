<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_rmzq">
	<h2><span><a  target="_blank" href="http://area.ywy7.com">更多>></a></span>热门专区</h2>
	<div class="xy_rmzq_nr">
		<ul class="xy_rmzq_nr_1"></ul>
	</div>
</div>
					
<script type="text/javascript">
	$(function(){
		getHotRegion();
	});

	function getHotRegion(){
		$.ajax({
			type: "POST",
			url: "region/getRegion.do",
			data: {
				"zqType":3,
				"perNumber": 4
			},
			success: function(data) {
	 	 		$.each(data.resultList, function(i,m) {
					$(".xy_rmzq_nr_1").append('<li class="right" style="float: left;"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.imgA)+' width="165" height="100" /><span>'+m.gameName+'</span></a></li>');
				});
			}
		});
	}
</script>