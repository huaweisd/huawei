<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="container">
	<div class="phb_dj">
		<span style="text-align:center">热门排行榜</span>
		<table width="350" border="0" cellspacing="0" cellpadding="0" class="phb_nr">
			<tr>
				<th>排名</th>
				<th style="width:130px;">游戏</th>
				<th>类型</th>
				<th>热度</th>
			</tr>
			<tbody class="phb_xx1">
			</tbody>
		</table>
	</div>
	<!--end-->
	<div class="phb_dj">
		<span style="text-align:center">单机排行榜</span>
		<table width="350" border="0" cellspacing="0" cellpadding="0" class="phb_nr">
			<tr>
				<th>排名</th>
				<th style="width:130px;">游戏</th>
				<th>类型</th>
				<th>热度</th>
			</tr>
			<tbody class="phb_xx2">
			</tbody>
		</table>
	</div>
	<!--end-->
	<div class="phb_dj">
		<span style="text-align:center">网游排行榜</span>
		<table width="350" border="0" cellspacing="0" cellpadding="0"
			class="phb_nr">
			<tr>
				<th>排名</th>
				<th style="width:130px;">游戏</th>
				<th>类型</th>
				<th>热度</th>
			</tr>
			<tbody class="phb_xx3">
			</tbody>
		</table>
	</div>
</div>


<div class="container h500">
	<div class="phb_dj text_align_l h460">
		<div class="phb_zx">
			<span class="new_game_phb_title">热门资讯TOP10</span>
			<span class="new_game_phb_rd">热度</span>
			<table width="350" border="0" cellspacing="0" cellpadding="0" class="phb_nr">
				<tbody class="phb_xx4">
				</tbody>
			</table>
		</div>
	</div>
	<!--end-->
	<div class="phb_dj text_align_l h460">
		<div class="phb_zx">
			<span class="new_game_phb_title">热门评测TOP10</span>
			<span class="new_game_phb_rd">热度</span>
			<table width="350" border="0" cellspacing="0" cellpadding="0" class="phb_nr">
				<tbody class="phb_xx5">
				</tbody>
			</table>
		</div>
	</div>
	<!--end-->
	<div class="phb_dj text_align_l h460">
		<div class="phb_zx">
			<span class="new_game_phb_title">热门视频TOP10</span>
			<span class="new_game_phb_rd">热度</span>
			<table width="350" border="0" cellspacing="0" cellpadding="0" class="phb_nr">
				<tbody class="phb_xx6">
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		//游戏排行榜
		XZGame();
		DjGames();
		WyGames();
		//资讯排行榜
		ZXnews();
		PCnews();
		SPnews();
	});
	//下载排行榜
	function XZGame(){
	 	$.ajax({
	        type: "POST",
	        url: "rank/getRanks.do",
			data: {
	            "perNumber": 10
	        },
        	success: function(data) {
       			$.each(data.resultList, function(i,n){
			   		if(i<3) {
				   		$(".phb_xx1").append('<tr class="phb_tr"><td align="center"><div class="pm1">'+(i+1)+'</div></td><td align="center" width="180"><div style="display:block" id="phb_bt">'+n.gameName+'</div><div style="display:none;text-align:center;" id="phb_content"><dl><dt>'+n.gameName+'</dt><dt><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="64" height="64"/></a></dt><dd>大小：'+n.fileSize+' &nbsp; 系统：'+n.osTypes+'</dd></dl></div></td><td align="center">'+n.procductsTypes+'</td><td align="center">'+n.clickCount+'</td></tr>');
				   	} else{
					    $(".phb_xx1").append('<tr class="phb_tr"><td align="center"><div class="pm2">'+(i+1)+'</div></td><td align="center" width="180"><div style="display:block" id="phb_bt">'+n.gameName+'</div><div style="display:none;text-align:center;" id="phb_content"><dl><dt>'+n.gameName+'</dt><dt><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="64" height="64"/></a></dt><dd>大小：'+n.fileSize+' &nbsp; 系统：'+n.osTypes+'</dd></dl></div></td><td align="center">'+n.procductsTypes+'</td><td align="center">'+n.clickCount+'</td> </tr> ');
				   	}
				});
				$(".phb_tr").bind("mouseover", function(){
					$(this).find("#phb_content").show();
					$(this).find("td #phb_bt").hide();
				});
				$(".phb_tr").bind("mouseout", function(){
					$(this).find("#phb_content").hide();
					$(this).find("td #phb_bt").show();
				});
        	}
	    });
  	}  
	
	//单机排行榜
	function DjGames(){
	 	$.ajax({
	        type: "POST",
	        url: "rank/getRanks.do",
			data: {
	            "tGroup":2,
	            "perNumber": 10
	        },
	        success: function(data) {
	       		$.each(data.resultList, function(i,n){
		   			if(i<3) {
						$(".phb_xx2").append('<tr class="phb_tr"><td align="center"><div class="pm1">'+(i+1)+'</div></td><td align="center" width="180"><div style="display:block" id="phb_bt">'+n.gameName+'</div><div style="display:none;text-align:center;" id="phb_content"><dl><dt>'+n.gameName+'</dt><dt><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="64" height="64"/></a></dt><dd>大小：'+n.fileSize+' &nbsp; 系统：'+n.osTypes+'</dd></dl></div></td><td align="center">'+n.procductsTypes+'</td><td align="center">'+n.clickCount+'</td></tr>');
				   	} else{
					    $(".phb_xx2").append('<tr class="phb_tr"><td align="center"><div class="pm2">'+(i+1)+'</div></td><td align="center" width="180"><div style="display:block" id="phb_bt">'+n.gameName+'</div><div style="display:none;text-align:center;" id="phb_content"><dl><dt>'+n.gameName+'</dt><dt><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="64" height="64"/></a></dt><dd>大小：'+n.fileSize+' &nbsp; 系统：'+n.osTypes+'</dd></dl></div></td><td align="center">'+n.procductsTypes+'</td><td align="center">'+n.clickCount+'</td> </tr> ');
				   	}
				});
				$(".phb_tr").bind("mouseover",function(){
					$(this).find("#phb_content").show();
					$(this).find("td #phb_bt").hide();
				});
				$(".phb_tr").bind("mouseout",function(){
					$(this).find("#phb_content").hide();
					$(this).find("td #phb_bt").show();
				});
        	}
    	});
 	}  
	
	//网游排行榜
	function WyGames(){
		$.ajax({
	        type: "POST",
	        url: "rank/getRanks.do",
			data: {
	            "tGroup":1,
	            "perNumber": 10
	        },
	        success: function(data) {
       			$.each(data.resultList, function(i,n){
			   		if(i<3) {
				   		$(".phb_xx3").append('<tr class="phb_tr"><td align="center"><div class="pm1">'+(i+1)+'</div></td><td align="center" width="180"><div style="display:block" id="phb_bt">'+n.gameName+'</div><div style="display:none;text-align:center;" id="phb_content"><dl><dt>'+n.gameName+'</dt><dt><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="64" height="64"/></a></dt><dd>大小：'+n.fileSize+' &nbsp; 系统：'+n.osTypes+'</dd></dl></div></td><td align="center">'+n.procductsTypes+'</td><td align="center">'+n.clickCount+'</td> </tr> ');
			   		} else{
				    	$(".phb_xx3").append('<tr class="phb_tr"><td align="center"><div class="pm2">'+(i+1)+'</div></td><td align="center" width="180"><div style="display:block" id="phb_bt">'+n.gameName+'</div><div style="display:none;text-align:center;" id="phb_content"><dl><dt>'+n.gameName+'</dt><dt><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="64" height="64"/></a></dt><dd>大小：'+n.fileSize+' &nbsp; 系统：'+n.osTypes+'</dd></dl></div></td><td align="center">'+n.procductsTypes+'</td><td align="center">'+n.clickCount+'</td> </tr> ');
			   		}
				});
				$(".phb_tr").bind("mouseover",function(){
					$(this).find("#phb_content").show();
					$(this).find("td #phb_bt").hide();
				});
				$(".phb_tr").bind("mouseout",function(){
					$(this).find("#phb_content").hide();
					$(this).find("td #phb_bt").show();
				});
	        }
	    });
	}
	
	
	function ZXnews(){
		$.ajax({
	        type: "POST",
	        url: "news/getHotNews.do",
			data: {
	            "perNumber": 10
	        },
	        success: function(data) {
	       		$.each(data.resultList, function(i,n){
			   		if(i<3) {
				   		$(".phb_xx4").append('<tr class="phb_tr"><td align="center" style="width:60px;"><div class="pm1">'+(i+1)+'</div></td><td align="left" style="width:200px;"><div><a href="'+commonFn.getRelLink('news')+'/news/'+n.id+'.htm">'+n.title+'</a></div></td><td align="center">'+n.clickCount+'</td> </tr> ');
				   	} else{
					    $(".phb_xx4").append('<tr class="phb_tr"><td align="center" style="width:60px;"><div class="pm2">'+(i+1)+'</div></td><td align="left" style="width:200px;"><div><a href="'+commonFn.getRelLink('news')+'/news/'+n.id+'.htm">'+n.title+'</a></div></td><td align="center">'+n.clickCount+'</td> </tr> ');
				   	}
				});
			}
	    });
	}
	
	function PCnews(){
		$.ajax({
	        type: "POST",
	        url: "news/getHotTest.do",
			data: {
	            "perNumber": 10
	        },
	        success: function(data) {
	       		$.each(data.resultList, function(i,n){
			   		if(i<3) {
				   		$(".phb_xx5").append('<tr class="phb_tr"><td align="center" style="width:60px;"><div class="pm1">'+(i+1)+'</div></td><td align="left" style="width:200px;"><div><a href="'+commonFn.getRelLink('news')+'/evaluation/'+n.id+'.htm">'+n.title+'</a></div></td><td align="center">'+n.renQi+'</td> </tr> ');
				   	} else{
					    $(".phb_xx5").append('<tr class="phb_tr"><td align="center" style="width:60px;"><div class="pm2">'+(i+1)+'</div></td><td align="left" style="width:200px;"><div><a href="'+commonFn.getRelLink('news')+'/evaluation/'+n.id+'.htm">'+n.title+'</a></div></td><td align="center">'+n.renQi+'</td> </tr> ');
				   	}
				});
			}
	    });
	}
	
	function SPnews(){
		$.ajax({
	        type: "POST",
	        url: "video/getVideoVideos.do",
			data: {
	            "perNumber": 10,
	            'tType' : 4
	        },
	        success: function(data) {
	       		$.each(data.resultList, function(i,n){
			   		if(i<3) {
				   		$(".phb_xx6").append('<tr class="phb_tr"><td align="center" style="width:60px;"><div class="pm1">'+(i+1)+'</div></td><td align="left" style="width:200px;"><div><a href="'+commonFn.getRelLink('v')+'/video/'+n.id+'.htm">'+n.title+'</a></div></td><td align="center">'+n.clickCount+'</td> </tr> ');
				   	} else{
					    $(".phb_xx6").append('<tr class="phb_tr"><td align="center" style="width:60px;"><div class="pm2">'+(i+1)+'</div></td><td align="left" style="width:200px;"><div><a href="'+commonFn.getRelLink('v')+'/video/'+n.id+'.htm">'+n.title+'</a></div></td><td align="center">'+n.clickCount+'</td> </tr> ');
				   	}
				});
			}
	    });
	}
</script>	
	



