<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

			<div  class="zx_dyjj_nr_1">
			</div>
			<div class="tfoot">
				<div>
					<div class="btn-group pages">
					<ul class="pagination">
					<li class="disabled" data-role="firstPage"><a>«</a></li>
					<li class="" data-role="prev"><a>‹</a></li>
					<li data-role="role_prev" style="display: none;"><a>...</a></li>
					<li data-role="pageNo" data-value="1"  class="active"><a>1</a></li>
					<li data-role="pageNo" data-value="2"><a>2</a></li>
					<li data-role="pageNo" data-value="3"><a>3</a></li>
					<li data-role="pageNo" data-value="4"><a>4</a></li>
					<li data-role="pageNo" data-value="5"><a>5</a></li>
					<li data-role="pageNo" data-value="6"><a>6</a></li>
					<li data-role="role_next"><a>...</a></li>
					<li class="" data-role="next"><a>›</a></li>
					<li class="" data-role="lastPage"><a>»</a></li>
					</ul></div></div></div>

<script type="text/javascript">
	$(function(){
		//获得参数
		 var nav_on = '${nav_on}';
		//业内资讯
		 if(nav_on=="2"){
		 	var l_data={
				perNumber:10,
			  	params : {
					"order": "CREATE_TIME desc",
					"tType":2,
					'page':1
				},
			  	url : "news/queryTNewsPage.do",
			  	fun : function(data){
					$(".zx_dyjj_nr_1").empty();
					   	$.each(data, function(i,m) {
		  					$(".zx_dyjj_nr_1").append('<dl><dt><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title="'+m.title+'">'+m.title.substring(0,40)+'</a></dt><dd class="pic"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="220" height="128" /></a></dd><dd class="txt"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm">发表于 '+$._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd')+'</a></dd>');
						});
		  			}
				};
			$("#mygrid").lxhgrid(l_data);
		 }
		 //人物专访
		 else if(nav_on=="3"){
		 	var l_data={
				perNumber:10,
			  	params : {
					"order": "CREATE_TIME desc",
					"tType":13,
					'page':1
				},
			  	url : "news/queryTNewsPage.do",
			  	fun : function(data) {
					$(".zx_rwzflist_1").empty();
					$.each(data, function(i,m) {
						$(".zx_dyjj_nr_1").append('<dl><dt><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title="'+m.title+'">'+m.title.substring(0,40)+'</a></dt><dd class="pic"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="220" height="128" /></a></dd><dd class="txt"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm">发表于 '+$._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd')+'</a></dd>');
					});
				}
			};
		 	$("#mygrid").lxhgrid(l_data);
		 }
		
	})
</script>    
	



