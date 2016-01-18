<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_tylb">
	<h2><span><a target="_blank" href="http://pack.ywy7.com/package/djlb.htm">更多>></a></span>特约礼包</h2>
	<div class="xy_tylb_nr"></div>
</div>
<!--end-->
<div class="xy_jr">
	<h2>今日</h2>
	<div class="xy_jr_nr">
		开服<a class="kaifu_count">0</a>款游戏　　开测<a class="kaice_count">0</a>款游戏
	</div>
</div>
<!--end-->
<div class="xy_tylb2">
	<ul class="xy_tylb2_1"></ul>
</div>
<script type="text/javascript">
	$(function(){
		getTYLB();
		getKFGame();
	});

	function getTYLB(){
		$.ajax({
	        type: "POST",
	        url: "news/getNewPackage.do",
	     	data: {
	     		"tType":5,
	        	"perNumber":4,
	        	"startRecordNum": 0,
	        },
	        success:function (data){
	        	$.each(data.resultList,function(i,n){
					$(".xy_tylb_nr").append('<dl> <dt><a href="javascript:void(0)">'+n.gameName+'</a></dt>  <dd class="pic"><a href="#"><img src='+commonFn.getImgUrl(n.timg)+' width="72" height="72" /></a></dd>  <dd class="txt01"><span><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+n.id+'.htm">怒领</a></span>适用系统：<img src="webviews/common/img/az_pot.jpg" width="14" height="14" /> <img src="webviews/common/img/ap_pot.jpg" width="14" height="14" /></dd>     <dd class="txt01"><font color="#fe8a0f">'+n.scount+'</font>人领取 <font color="#999999">剩余：'+(n.tcount-n.scount)+'</font></dd> </dl>');						   
				});
	        }
		});
	}
			
	function getKFGame() {
	    $.ajax({
			type: "POST",
	        url: "newGame/getOpenServerGame.do",
		  	data: {
	            "perNumber": 3
	        },
	        success: function(data) {
		 		$(".kaifu_count").html(data.resultMap.kfCount);
		 		$('.kaice_count').html(data.resultMap.kcCount);
		 		$.each(data.resultList,function(i,n){
			 		$(".xy_tylb2_1").append('<li><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.gameImg)+' width="95" height="95" /></a><span class="ellipsis" style="width:95px;"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">'+n.gameName+'</a></span></li>');
			 	});
			}
		});
	}
</script>	
	



