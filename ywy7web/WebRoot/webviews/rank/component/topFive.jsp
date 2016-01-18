<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2>最近七天前五名</h2>
<div class="phb_szqwm_nr_1"></div>
<script type="text/javascript">
	$(function(){
		$.ajax({
	        type: "POST",
	        url: "rank/getRankTopFive.do",
	        data : {
	       		"perNumber" : 5
			},
	        success: function(data) {
				$.each(data.resultList, function(i,n){
		           	if(i == 0){
						$(".phb_szqwm_nr_1").append('<ul><li><span class="pot1">'+(i+1)+'</span></li><li><img src='+commonFn.getImgUrl(n.gameImg)+' width="95" height="95" /></li><li><div style="position: relative;font-size: 14px;"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+n.id+'.htm" style="font-size: 24px;width:190px !important;">'+n.gameName+'</a><br /><div style="width: 178px;position: relative;top: 12px;">类型：'+n.procductsTypes+'</div></div></li></ul>');
					}else if(i<3){
						$(".phb_szqwm_nr_1").append('<ul><li><span class="pot2">'+(i+1)+'</span></li><li><img src='+commonFn.getImgUrl(n.gameImg)+' width="95" height="95" /></li><li><div style="position: relative;font-size: 14px;"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+n.id+'.htm" style="font-size: 24px;width:190px !important;">'+n.gameName+'</a><br /><div style="width: 178px;position: relative;top: 12px;">类型：'+n.procductsTypes+'</div></div></li></ul>');
					}else{
						$(".phb_szqwm_nr_1").append('<ul><li><span class="pot">'+(i+1)+'</span></li><li><img src='+commonFn.getImgUrl(n.gameImg)+' width="95" height="95" /></li><li><div style="position: relative;font-size: 14px;"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+n.id+'.htm" style="font-size: 24px;width:190px !important;">'+n.gameName+'</a><br /><div style="width: 178px;position: relative;top: 12px;">类型：'+n.procductsTypes+'</div></div></li></ul>');
					}
				});
			}
		})
	})
</script>


