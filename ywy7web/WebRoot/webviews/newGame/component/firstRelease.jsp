<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_dyfb">
	<h2><span><a target="_blank" href="http://news.ywy7.com">更多>></a></span>第一发布</h2>
	<div class="xy_dyfb_nr">
		<ul class="a001 xy_dyfb_nr_1"></ul>
		<ul class="a002 xy_dyfb_nr_2"></ul>
		<ul class="a003 xy_dyfb_nr_3"></ul>
		<ul class="a004 xy_dyfb_nr_4"></ul>
	</div>
</div>
						
					
<script type="text/javascript">
	$(function(){
		//第一发布
		getFirstRelease();
	});

	function getFirstRelease(){
		$.ajax({
	        type: "POST",
	        url: "news/getGamesNews.do",
	     	data: {
	     		"tType":22,
	        	"perNumber":19
	        },
	        success:function (data){
	        	var tt="";
			  	$.each(data.resultList,function(i,m){
			  		if(i == 0){
				  		$(".xy_dyfb_nr_1").append('<li class="b01" style="width:390px"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,20)+'</a></li>');
				  	}else if(i ==1) {
				   		tt = '<li style="width:390px"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,10)+'</a>| ';
				  	}else if(i ==2) {
						tt = tt + '<a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,10)+'</a></li>';
						$(".xy_dyfb_nr_1").append(tt);
				  	}else if(i ==3) {
						$(".xy_dyfb_nr_1").append('<li class="b02" style="width:390px"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,20)+'</a></li>');
				  	}else if(i< 8){
					    $(".xy_dyfb_nr_2").append('<li><span class="b04"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm">火爆</a></span><a target="_blank" href="news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,20)+'</a></li>');
				  	}else if(i == 8 ){
					   	$(".xy_dyfb_nr_3").append('<li><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'"><img src="'+m.timg+'" width="188" height="55" /></a></li>');
				  	}else if( i == 9){
					   	$(".xy_dyfb_nr_3").append('<li class="right"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'"><img src="'+commonFn.getImgUrl(m.timg)+'" width="188" height="55" /></a></li>');
				  	}else if( i< 18){
					  	$(".xy_dyfb_nr_4").append('<li><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,20)+'</a></li>');
				  	}
				});
	        }
		});
	}
</script>	
	



