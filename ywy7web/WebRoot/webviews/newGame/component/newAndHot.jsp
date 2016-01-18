<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="zyx_zxzr" class="zyx_zxzr mh2050">
	<ul class="tabzxzr">
		<li class="current" tag="PRIORITY">最新</li>
		<li tag="START_TIME DESC">最热</li>
	</ul>
	<div id="mgrid">
		<div class="contentzxzr mh1960">
			<ul style="display: block;" class="new_list">
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
	var searchData = {"gameType":0,"osType":0,"priceType":0,"languageType":0};// 搜索条件
	
	$(function(){
		//切换
		$("li",".tabzxzr").bind("click",function(){
			$("li",".tabzxzr").removeClass("current");
			$(this).addClass("current");
			searchData["order"] = $(this).attr("tag");
			getNewAndHot();
	 	});
		$("#gameName").bind('keypress',function(event){
        	if(event.keyCode == "13"){
       	 		getNewAndHot();
       		}
        });
		//最热最新
		searchData["order"] = 'PRIORITY';
		getNewAndHot();
	})
	
	//查询最新最火游戏
	function getNewAndHot(){
		var l_data={
	 		params : $.extend(searchData, {
		 		 'page' : 1,
				"perNumber": 60
			}),
		  	url : "newGame/getGamePage.do",
		  	fun : function(data){
		  		$(".new_list").empty();
			  	$.each(data, function(i,m) {
			   		$(".new_list").append('<li><a target="_blank" href="product/'+m.ID+'.htm"><img src='+commonFn.getImgUrl(m.gameImg)+' width="99" height="99" /><br/><span style="width:115px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">'+m.gameName+'</span></a></li>');
				});
		  	}
	 	};
	 	$("#mgrid").lxhgrid(l_data);
	}  
</script>	
	



