<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<!--热门礼包-->
<div class="gl_fllb">
	<h2><span><a  target="_blank" href="rmlb.htm">更多>></a></span>热门礼包</h2>
    <div class="gl_fllb_nr" class="gl_fllb_nr_1">
    	
           
    </div>
</div>
<!--end-->

<script type="text/javascript">
	//热门礼包
	$(function(){
			RMLB();
	})
	function RMLB(){
		 $.ajax({
			type: "POST",
			url: "package/getPackageInfo.do",
			data: {
				"tType":2,
				"perNumber": 10
			},
			success: function(data) {
			   $.each(data.resultList,
					function(i,m) {
					//var gameType = $._gameType(m.gameType) == undefined ? '未知' : $._gameType(m.gameType);
					 $(".gl_fllb_nr_1").append('<dl><dt>'+m.gameType+'</dt><dd class="pic"><a target="_blank" href="package/'+m.id+'.htm"><img src="'+m.timg+'" width="82" height="82" /></a></dd><dd class="txt"><a target="_blank" href="package/'+m.id+'.htm">'+$._ffsize(m.packageName,5)+'</a></dd><dd class="txt2">剩余：'+(m.tcount-m.scount)+'</dd></dl>');
					   
											
					});
			}
		});
	}
</script>    
	



