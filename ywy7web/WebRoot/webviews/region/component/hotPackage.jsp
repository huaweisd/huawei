<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<h2><span><a  target="_blank" href="package/rmlb.htm">更多>></a></span>热门礼包</h2>
<div class="zq_fllb_nr_1"></div>
    
<script type="text/javascript">
	$(function(){
		 $.ajax({
			type: "POST",
			url: "newGame/getHotPackage.do",
			data : {
				"perNumber" : 2,
				"tType":2
			},
			 success:function (data){
	        	$.each(data.resultList, function(i, m) {
					$(".zq_fllb_nr_1").append('<dl><dt>已有<font color="#FF0000">'+m.scount+'</font>人领取</dt><dd class="pic"><img src='+commonFn.getImgUrl(m.timg)+' width="230" height="155" /><span>'+m.packageName+'</span></dd><dd class="txt"><a target="_blank" href="'+ commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">抢号</a></dd> <dd class="txt2"><a href='+m.turl+'>立即下载</a></dd></dl>');    
	      		}); 
	        }
		})
	})
</script>