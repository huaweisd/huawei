<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2><span style='float: right;font-size: 14px; font-weight: normal;'><a target="_blank" href="http://news.ywy7.com/zx.htm">更多>></a></span>产业专访</h2>
<div id="zq_cyzf_nr" class="zq_cyzf_nr_1"></div>
<script type="text/javascript">
//产业专访			
		$(function(){
			 $.ajax({
				type: "POST",
				url: "news/getGamesNews.do",
				data : {
					"tType":2,
		           	"perNumber": 4
				},
				success: function(data) {
					 $(".zq_cyzf_nr_1").empty();
		            $.each(data.resultList, function(i, m) {
						$(".zq_cyzf_nr_1").append('<dl> <dt><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm">'+m.title+'</a></dt><dd class="pic"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="108" height="118" /></a></dd><dd class="txt"></dd></dl>');    
		            });
				}
			})
		})
</script>


