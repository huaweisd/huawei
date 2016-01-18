<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="gl_gltt">
	<h2>
		<span><a href="http://gl.ywy7.com/raiders/twgl.htm">更多>></a></span>攻略头条
	</h2>
	<div class="gl_gltt_nr">
		<ul class="a01 gl_gltt_nr_1" style="width: 442px;height: 66px;text-align: center;"></ul>
		<dl class="gl_gltt_nr_2" style="width: 442px;height: 82px;"></dl>
		<ul class="a02 gl_gltt_nr_3" style="width: 442px;height: 278px;"></ul>
		<ul class="a02 gl_gltt_nr_4" style="width: 442px;height: 210px;"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		TTGL();
	});

	function TTGL() {
		$.ajax({
			type : "POST",
			url : "raiders/getRaiders.do",
			data : {
				"tType" : 1,
				"perNumber" : 20
			},
			success : function(data) {
				var tt = "";
				$.each(data.resultList, function(i, m) {
					if (i == 0) {
						$(".gl_gltt_nr_1").append('<li class="b01"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title,20)+ '</a></li>');
					} else if (i == 1) {
						tt += '<li>[<a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title,10)+ '</a>]';
					} else if (i == 2) {
						tt += '[<a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title,10)+ '</a>] </li>';
						$(".gl_gltt_nr_1").append(tt);
					} else if (i == 3) {
						$(".gl_gltt_nr_2").append('<dt><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title,16)+ '</a></dt><dd class="pic"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="128" height="82" /></a></dd><dd class="txt">'+ $._ffsize(m.ttitle,48)+ '</dd>');
					} else if (i == 4) {
						$(".gl_gltt_nr_3").append('<li class="b01" ><span>专区</span><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title)+ '</a></li>');
					} else if (i < 12) {
						$(".gl_gltt_nr_3").append('<li class="b02" style="width:432px;"><span>'+ $._DateFormat(new Date(m.createTimeStr),'MM-dd')+ '</span><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title,20)+ '</a></li>');
					} else if (i == 12) {
						$(".gl_gltt_nr_4").append('<li class="b01" style="width:442px"><span>专区</span><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+' >' + $._ffsize(m.title,20)+ '</a></li>');
					} else if (i < 19) {
						$(".gl_gltt_nr_4").append('<li class="b02" style="width:432px;"><span>'+ $._DateFormat(new Date(m.createTimeStr),'MM-dd')+ '</span><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>'+ $._ffsize(m.title,20)+ '</a></li>');
					}
				});

			}
		});
	}
</script>