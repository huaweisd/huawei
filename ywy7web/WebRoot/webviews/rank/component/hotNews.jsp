<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2>最热资讯榜</h2>
<div class="phb_zrzxb_nr_1">
</div>
<script type="text/javascript">
		//最热资讯				
		$(function(){
			$.ajax({
				type: "POST",
				url: "news/getGamesNews.do",
				data : {
					'perNumber' : 10
				},
				success: function(data) {
				   $.each(data.resultList, function(i,n){
						if(i == 0){
						  	$(".phb_zrzxb_nr_1").append('<dl><dt><span class="pot1">' + (i+1) + '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+n.id+'.htm">' + n.title.substring(0, 20) + '</a></dt> <dd class="pic"><img src=' + commonFn.getImgUrl(n.timg) + ' width="150" height="90" /></dd><dd class="txt">' + $._DateFormat(new Date(n.createTime), 'yyyy-MM-dd') + '<br />浏览数：' + n.clickCount + '</dd></dl>');
						}else if(i<10){
						  	$(".phb_zrzxb_nr_1").append(' <dl><dt><span class="pot2">' + (i+1) + '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + 'news/'+n.id+'.htm">' + n.title.substring(0, 20) + '</a></dt></dl>');
						}
				   });
				}
			});
		})
</script>


