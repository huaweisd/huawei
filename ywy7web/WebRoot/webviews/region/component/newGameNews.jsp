<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2><span style='float: right;font-size: 14px; font-weight: normal;'><a target="_blank" href="http://xy.ywy7.com/newGame.htm">更多>></a></span>新游新闻</h2>
<div class="zq_ttzx_nr">
	<ul class="zq_ttzx_nr_1"></ul>
</div>
    
<script type="text/javascript">
	$(function(){
		 $.ajax({
			type: "POST",
			url: "news/getGamesNews.do",
			data : {
				"tType":8,
	           	"perNumber": 13
			},
			success: function(data) {
				 $(".zq_ttzx_nr_1").empty();
	            $.each(data.resultList, function(i, m) {
	            	if(i ==0){
						$(".zq_ttzx_nr_1").append('<li class="a001"><span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title="'+m.title+'">'+m.title.substring(0,17)+'</a></span><img title="'+m.title+'" src='+commonFn.getImgUrl(m.timg)+' width="348" height="152" /></li>');  
					}else{
						$(".zq_ttzx_nr_1").append('<li class="a02"><span>' + $._DateFormat(new Date(m.createTime), 'yyyy-MM-dd').substring(5) + '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title="'+m.title+'">'+m.title.substring(0,22)+'</a></li>');   
					}
	            })
			}
		})
	})
</script>


