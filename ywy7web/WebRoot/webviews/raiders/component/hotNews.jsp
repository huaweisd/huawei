<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="gl_rmzq">
	<h2><span><a  target="_blank" href="http://area.ywy7.com">更多>></a></span>热门专区</h2>
       <div id="gl_rmzq_nr" class="rwzf_rmzq_nr_1"></div>
</div>
<script type="text/javascript">
	//业内资讯  人物专访
	$(function(){
		//热门专区
		$.ajax({
			type: "POST",
			url: "index/getIndexViewProductZQ.do",
			data: {
				"zqType":3,
				"perNumber":4
			},
			success: function(data) {
		   		$.each(data.resultList, function(i,m) {
			 		$(".rwzf_rmzq_nr_1").append('<ul><li class="a01"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.imgA)+'" width="330" height="130" /><span style="width:330px;">'+m.gameName+'</span></a></li> <li style="width:100%;"><p ><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm">专区</a></p><p><a href="javascript:void(0)">论坛</a></p><p class="right"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'_1.htm">礼包</a></p></li></ul>');
				});
			}
		})
	})
</script>