<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="xypc_list_h">
	<div class="xypc_list">
		<h2></h2>
	    <ul class="xypc_list_1"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		var nav_on = '${nav_on}';
		if(nav_on=="1"){
	 		var l_data={
				params : {
		  			"tType":6,
					"perNumber": 12,
					"page":1
			  	},
			  	url : "news/getEvaluationPage.do",
			  	fun : function(data){
			  	 	$(".xypc_list_1").empty();
				 	$.each(data,function(i,m){
						$(".xypc_list_1").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="348" height="210" title="'+m.title+'"/></a><p class="title"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm">'+m.title+'</a></p><p class="name"><span>' + $._DateFormat(new Date(m.createTime), 'yyyy-MM-dd') + '</span></p></li>');
			   		});
			  	}
		 	};
		 	$("#xypc_list_h").lxhgrid(l_data);
		}else if(nav_on=="4"){
		 	var l_data={
				params : {
		  			"tType":3,
					"perNumber": 12,
					"page":1
			  	},
			  	url : "news/getEvaluationPage.do",
			  	fun : function(data){
		  	 		$(".xypc_list_1").empty();
				 	$.each(data,function(i,m){
						$(".xypc_list_1").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="348" height="210" title="'+m.title+'"/></a><p class="title"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm">'+m.title+'</a></p><p class="name"><span>' + $._DateFormat(new Date(m.createTime), 'yyyy-MM-dd') + '</span></p></li>');
				   	});
			  	}
		 	};
 			$("#xypc_list_h").lxhgrid(l_data);
		}
	})
</script>    
	



