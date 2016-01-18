<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<ul class="zx_rh_1">
        </ul>
<script type="text/javascript">
	//国内资讯
	$(function(){
		getGlobalNews();
	})
	
	function getGlobalNews(){
	$.ajax({
            type: "POST",
            url: "news/getGamesNews.do",
         	data: {
				"tType":21,
				"perNumber": 19
			 },
            success: function(data) {
	            $.each(data.resultList,
	            function(i, m) {
				    if(i < 12)
					{
					 $(".zx_rh_1").append('<li><span>'+$._DateFormat(new Date(m.createTime), 'MM-dd')+'</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+m.title.substring(0,25)+'</a></li>');
					}
	               
	            });
			}
        });
	}
	
</script>    
	



