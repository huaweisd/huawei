<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2><span><a target="_blank" href="http://news.ywy7.com/">更多>></a></span>今日热点</h2>
<div class="zq_jrrd_nr">
	<ul class="zq_jrrd_nr_1"></ul>
</div>

<script type="text/javascript">
	$(function(){
		 $.ajax({
			type: "POST",
			url: "region/getRegion.do",
			data : {
				"zqType": 5,
				"perNumber" : 5
			},
			success: function(data) {
				$.each(data.resultList, function(i,m) {
					if(i == 0) {
						$(".zq_jrrd_nr_1").append('<li class="a01"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.imgB)+' width="572" height="378" title="'+m.gameName+'" /><p style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">'+m.gameName+'</p></a></li>');
					}else{
						$(".zq_jrrd_nr_1").append('<li class="a0'+(i+1)+'"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.imgA)+' width="280" height="182" title="'+m.gameName+'" /><p style="overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">'+m.gameName+'</p></a></li>');  
					}
				});
			}
		})
	})
</script>


