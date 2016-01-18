<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2><span><a target="_blank" href="http://xy.ywy7.com/newGame/xypc.htm">更多>></a></span>悦玩评测</h2>
<div class="zq_ywpc_nr_1"></div>
    
<script type="text/javascript">
	$(function(){
		 $.ajax({
			type: "POST",
			url: "region/getEvaluation.do",
			data : {
				"perNumber" : 3,
				"tType":5
			},
			success: function(data) {
				$(".zq_ywpc_nr_1").empty();
	            $.each(data.resultList, function(i, m) {
					$(".zq_ywpc_nr_1").append('<dl><dt><a target="_blank" href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm">'+m.gameName+'</a></dt><dd class="pic"><a target="_blank" href="evaluation/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="270" height="205" /></a></dd><dd class="txt" style="font-size:16px;">'+m.title+'</dd><dd class="txt" style="overflow:hidden;height:90px;">'+m.ttitle+'</dd><dd class="txt"><font color="#239efe">游戏类型</font>'+m.gameType+'</dd><dd class="txt">上传时间：'+$._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd')+' </dd><dd class="txt"><font color="#FF0000">'+m.renQi+'</font>人气 / <font color="#FF0000">'+m.pingLun+'</font>评论 / <font color="#FF0000">'+m.tuiJian+'</font>推荐</dd></dl>');    
	            });
			}
		})
	})
</script>


