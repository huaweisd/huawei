<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="gl_twoad">
	<div id="advertC" data-type="3" data-index="7" style="">
		<jsp:include page="../../common/advertA.jsp"></jsp:include>
	</div>
</div>
<div class="gl_syhhdq">
	<div id="advertD" data-type="3" data-index="4" style="">
		<jsp:include page="../../common/advertA.jsp"></jsp:include>
	</div>
	<h2><span><a  target="_blank" href="http://area.ywy7.com">更多>></a></span>手游汉化大全</h2>
	<div class="gl_syhhdq_nr gl_syhhdq_nr_1"></div>
</div>
<div class="gl_fllb">
	<h2><span><a  target="_blank" href="http://pack.ywy7.com/package/rmlb.htm">更多>></a></span>热门礼包</h2>
    <div class="gl_fllb_nr gl_fllb_nr_1"></div>
</div>
<script type="text/javascript">
	$(function(){
		HHQZ();
		RMLB();
	})
	function HHQZ(){
		$.ajax({
			type: "POST",
			url: "news/getHotRegion.do",
			data: {
				"zqType":10,
				"perNumber":5
			},
			success: function(data) {
		   		$.each(data.resultList, function(i,m) {
			 		 $(".gl_syhhdq_nr_1").append('<dl><dt>'+commonFn._getGameType(m.tType)+'</dt><dd class="pic"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.gameImg)+'" width="82" height="82" /></a></dd><dd class="txt"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm">'+m.gameName+'</a></dd><dd class="txt2">热度：'+m.clickCount+'</dd></dl>');
				});
			}
		})
	}
	
	
	function RMLB(){
		 $.ajax({
			type: "POST",
			url: "package/getPackageInfo.do",
			data: {
				"tType":2,
				"perNumber": 10
			},
			success: function(data) {
	   			$.each(data.resultList, function(i,m) {
					var gameType = m.gameType == undefined ? '未知' : commonFn._getGameType(m.gameType);
					$(".gl_fllb_nr_1").append('<dl><dt>'+gameType+'</dt><dd class="pic"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="82" height="82" /></a></dd><dd class="txt"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm">'+$._ffsize(m.packageName,5)+'</a></dd><dd class="txt2">剩余：'+(m.tcount-m.scount)+'</dd></dl>');
				});
			}
		});
	}
</script>