<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<ul class="tabec">
	<li class="currentc">热门游戏</li>
	<li class="">精品推荐</li>
</ul>
<div class="contentc">
	<ul style="display: block;" class="contenttc_rmyx"></ul>
   	<ul class="contenttc_jptj" style="display: none;"></ul>
</div>
<script type="text/javascript">
	$(function(){
		rmyx();
		jptj();
		$(".tabec li").bind("mouseover",function(){
			$(".contentc ul").hide().eq($(".tabec li").removeClass().index($(this).addClass("currentc"))).show(); 	
		});
	})
	function rmyx(){
		 $.ajax({
			type: "POST",
			url: "region/getRegion.do",
			data: {
				"zqType":7,
				"perNumber": 10
			},
			success: function(data) {
				$.each(data.resultList, function(i,m) {
					$(".contenttc_rmyx").append('<li><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.gameImg)+' width="72" height="72" title="'+m.gameName+'" /><span>'+m.gameName+'</span></a></li>');
				});
			}
		});
	}
	function jptj(){
 		$.ajax({
			type: "POST",
			url: "region/getRegion.do",
			data: {
				"zqType":6,
				"perNumber": 10
			},
			success: function(data) {
				$.each(data.resultList, function(i,m) {
					$(".contenttc_jptj").append('<li><a target="_blank" href="'+ commonFn.getRelLink("ku") + 'product/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.gameImg)+' width="72" height="72" title="'+m.gameName+'" /><span>'+m.gameName+'</span></a></li>');  
				});
			}
		});	
	}
</script>

	



