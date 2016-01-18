<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="gl_tjsp_xbtj_qsyk">
	<div class="gl_rmzq">
		<h2>
			<span><a href="http://gl.ywy7.com/raiders/spgl.htm">更多>></a></span>视频攻略
		</h2>
		<div class="gl_tjsp_nr">
			<dl class="gl_tjsp_nr_1"></dl>
			<ul class="gl_tjsp_nr_2"></ul>
		</div>
	</div>
	<!--end-->
	<div class="gl_rmzq">
		<h2>
			<span><a target="_blank" href="http://gl.ywy7.com/raiders/twgl.htm">更多>></a></span>小编推荐
		</h2>
		<div class="gl_tjsp_nr">
			<dl class="gl_xbtj_nr_1"></dl>
			<ul class="gl_xbtj_nr_2"></ul>
		</div>
	</div>
	<!--end-->
	<div class="gl_rmzq">
		<h2>
			<span><a target="_blank" href="http://gl.ywy7.com/raiders/twgl.htm">更多>></a></span>轻松一刻
		</h2>
		<div id="gl_qsyk_nr" style="height:90px;">
			<ul class="gl_qsyk_nr_1"></ul>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		TJSP();
		XBTJ();
		QSYK();
	});

	function TJSP() {
		$.ajax({
			type : "POST",
			url : "video/getVideoRaiders.do",
			data : {
				"tType" : 3,
				"perNumber" : 6
			},
			success : function(data) {
				$.each(data.resultList, function(i, n) {
					if (i == 0) {
						$(".gl_tjsp_nr_1").append('<dt><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+n.id+'.htm" title='+n.title+'>' + $._ffsize(n.title, 10) + '</a></dt><dd class="pic"><img src='+commonFn.getImgUrl(n.timg)+' width="160" height="105" title='+n.title+' /></dd><dd class="txt">' + n.ttitle+ '</dd>');
					} else {
						$(".gl_tjsp_nr_2").append('<li><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+n.id+'.htm" title='+n.title+'>' + $._ffsize(n.title, 18) + '</a></li>');
					}
				});
			}
		});
	}

	function XBTJ() {
		$.ajax({
			type : "POST",
			url : "video/getVideoRaiders.do",
			data : {
				"tType" : 4,
				"perNumber" : 6
			},
			success : function(data) {
				$.each(data.resultList, function(i, m) {
					if (i == 0) {
						$(".gl_xbtj_nr_1").append('<dt><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>' + $._ffsize(m.title, 10) + '</a></dt><dd class="pic"><img src='+commonFn.getImgUrl(m.timg)+' width="160" height="105" title='+m.title+' /></dd><dd class="txt">' + m.ttitle + '</dd>');
					} else {
						$(".gl_xbtj_nr_2").append('<li><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title='+m.title+'>' + $._ffsize(m.title, 18) + '</a></li>');
					}
				});
			}
		});
	}

	function QSYK() {
		$.ajax({
			type : "POST",
			url : "raiders/getRaiders.do",
			data : {
				"tType" : 5,
				"perNumber" : 2
			},
			success : function(data) {
				$.each(data.resultList, function(i, m) {
					if (i == 0) {
						$(".gl_qsyk_nr_1").append('<li style="width:154px;height:90px;"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="154" height="90" title='+m.title+' /><span>' + $._ffsize(m.title, 10) + '</span></a></li>');
					}
					if (i == 1) {
						$(".gl_qsyk_nr_1").append('<li class="right" style="width:154px;height:90px;"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="154" height="90" title='+m.title+' /><span>' + $._ffsize(m.title, 10) + '</span></a></li>');
					}
				});
			}
		});
	}
</script>