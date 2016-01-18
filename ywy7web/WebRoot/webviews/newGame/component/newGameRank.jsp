<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_xyqdb">
	<h2>新游期待榜</h2>
	<div class="xy_xyqdb_nr">
		<table width="318" border="0" cellspacing="0" cellpadding="0" class="xy_xyqdb_nr_1">
			<tr>
				<th>排名</th>
				<th width="180">游戏</th>
				<th>专区</th>
				<th>平台</th>
			</tr>
		</table>
	</div>
</div>			
<script type="text/javascript">
	$(function(){
		//新游期待榜
		getNewGameRank();
	});

	function getNewGameRank(){
	    $.ajax({
	        type: "POST",
	        url: "rank/getRanks.do",
			data: {
				 "perNumber": 10
	        },
	        success: function(data) {
				$.each(data.resultList,function(i,n){
				 	if(i == 0) {
			  	   		$(".xy_xyqdb_nr_1").append('<tr xytjtag="xytjtag'+n.id+'"><td align="center"><span class="a01">&nbsp;</span></td>    <td align="center"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm" xytjtag="xytjtag'+n.id+'">'+n.gameName+'</a><div xytjtag="xytjtag'+n.id+'" style="display:none"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td>        <td align="left"><span class="a02"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">进入</a></span></td>    <td align="center">'+n.osTypes+'</td>  </tr>');
				   	}else if(i == 1){
			   			$(".xy_xyqdb_nr_1").append('<tr xytjtag="xytjtag'+n.id+'"><td align="center"><span class="b01">&nbsp;</span></td>    <td align="center"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm" xytjtag="xytjtag'+n.id+'">'+n.gameName+'</a><div xytjtag="xytjtag'+n.id+'" style="display:none"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td>    <td align="left"><span class="a02"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">进入</a></span></td>    <td align="center">'+n.osTypes+'</td>  </tr>');
				   	}else if(i == 2){
						$(".xy_xyqdb_nr_1").append('<tr xytjtag="xytjtag'+n.id+'"><td align="center"><span class="c01">&nbsp;</span></td>    <td align="center"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm" xytjtag="xytjtag'+n.id+'">'+n.gameName+'</a><div xytjtag="xytjtag'+n.id+'" style="display:none"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td>     <td align="left"><span class="a02"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">进入</a></span></td>    <td align="center">'+n.osTypes+'</td>  </tr>');
					}else{
						$(".xy_xyqdb_nr_1").append('<tr xytjtag="xytjtag'+n.id+'"><td align="center"><span style="font-style:italic; font-size:18px;">'+(i+1)+'</span></td>    <td align="center"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm" xytjtag="xytjtag'+n.id+'">'+n.gameName+'</a><div xytjtag="xytjtag'+n.id+'" style="display:none"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src="'+commonFn.getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td>      <td align="left"><span class="a02"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">进入</a></span></td>    <td align="center">'+n.osTypes+'</td>  </tr>');
					}
				});
				$("tr",".xy_xyqdb_nr_1").bind("mouseover",function(){
					$("div[xytjtag="+$(this).attr("xytjtag")+"]").show();
					$("a[xytjtag="+$(this).attr("xytjtag")+"]").hide();
				});
				$("tr",".xy_xyqdb_nr_1").bind("mouseout",function(){
					$("div[xytjtag="+$(this).attr("xytjtag")+"]").hide();
					$("a[xytjtag="+$(this).attr("xytjtag")+"]").show();
				});
	        }
	    });
	}
</script>	
	



