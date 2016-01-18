<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="zx_gnzx">
					<h2>国内资讯</h2>
		<div class="zx_rdzx">
			<h2>热点资讯</h2>
		    <ul class="zx_rdzx_1">
		    	
		    </ul>
		</div>
		<div class="zx_yxzhyhd_middle">
			<ul class="zx_yxzhyhd_middle_1">
		    	
		    </ul>
		</div>
	</div>
<script type="text/javascript">
	//国内资讯
	$(function(){
		getDomesticNews();
	})
	
	function getDomesticNews(){
	$.ajax({
            type: "POST",
            url: "news/getGamesNews.do",
         	data: {
				"tType":20,
				"perNumber": 19
            },
            success: function(data) {
	            $.each(data.resultList,
	            function(i, m) {
	          	if(i == 0)
					{
					  $(".zx_rdzx_1").append('<li class="pic"><a target="_blank" href="' + commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'><img src='+commonFn.getImgUrl(m.timg)+' width="365" height="130" /><span>'+m.title.substring(0,20)+'</span></a></li>');
					}
				    else if(i < 7)
					{
					 $(".zx_rdzx_1").append('<li class="txt"><a target="_blank" href="news/'+m.id+'.htm" title='+m.title+'>'+m.title.substring(0,30)+'</a></li>');
					}
					else if(i < 19 )
					{
					$(".zx_yxzhyhd_middle_1").append('<li><span>'+$._DateFormat(new Date(m.createTime), 'MM-dd')+'</span><a target="_blank" href="news/'+m.id+'.htm" title='+m.title+'>'+m.title.substring(0,30)+'</a></li>');
					}
	               
	            });
			}
        });
	}
	
</script>    
	



