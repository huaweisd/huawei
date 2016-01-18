<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_xypc">
	<h2><span><a target="_blank" href="http://xy.ywy7.com/newGame/xypc.htm">更多>></a></span>新游评测</h2>
	<div class="xy_xypc_nr">
		<ul class="xy_xypc_nr_1"></ul>
	</div>
</div>
<script type="text/javascript">
	//新游评测
	$(function(){
		getnewGameTest();
	});

	function getnewGameTest(){
		$.ajax({
	        type: "POST",
	        url: "news/getMobileGameTest.do",
	     	data: {
	     		"tType":1,
	        	"perNumber":6
	        },
	        success:function (data){
	        	$.each(data.resultList,function(i,n){
					if(i%2 == 0){
						$(".xy_xypc_nr_1").append('<li><a href="'+commonFn.getRelLink('news')+'/evaluation/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.timg)+' width="140" height="95" title='+n.title+'/></a><span><a href="evaluation/'+n.id+'.htm" title='+n.title+'><strong>'+$._ffsize(n.title,8)+'</strong></a></span><span style="font-size:12px;">'+$._DateFormat(new Date(n.createTimeStr), 'MM-dd')+'</span></li>');
					}else{
				  		$(".xy_xypc_nr_1").append('<li class="right"><a href="'+commonFn.getRelLink('news')+'/evaluation/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.timg)+' width="140" height="95" /></a><span><a href="evaluation/'+n.id+'.htm" title='+n.title+'><strong>'+$._ffsize(n.title,8)+'</strong></a></span><span style="font-size:12px;">'+$._DateFormat(new Date(n.createTimeStr), 'MM-dd')+'</span></li>');
					}
				});
   			}
		});
	}
</script>