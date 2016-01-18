<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div  class="zx_dyjj_nr_1"></div>
<script type="text/javascript">
	$(function(){
		var l_data={
			params : {
	 			"order": "CREATE_TIME desc",
		 		"tType":9,
				"perNumber": 6
			},
		  	url : "news/queryTNewsPage.do",
		  	fun : function(data){
				$(".zx_dyjj_nr_1").empty();
		   		$.each(data,function(i,m) {
					    $(".zx_dyjj_nr_1").append('<dl><dt><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title="'+m.title+'">'+m.title.substring(0,40)+'</a></dt><dd class="pic"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="220" height="128" /></a></dd><dd class="txt"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm"></a></dd><dd class="txt02">发表于 '+$._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd')+'</dd></dl>');
				});
		  	}
	 	};
	 	$("#mgrid").lxhgrid(l_data);
	})
</script>