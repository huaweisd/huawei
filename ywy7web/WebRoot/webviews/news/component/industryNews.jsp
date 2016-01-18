<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="zx_cyzx">
	<h2>产业资讯</h2>
	<div class="zx_cyzx_container">
		<div class="zx_cyzx01_fourlist">
			<div class="zx_cyzx01">
				<dl>
					<dt class="zx_cyzx01_1"></dt>
					<dd class="pic zx_cyzx01_2"></dd>
					<dd class="txt">
						<ul class="zx_cyzx01_3">
						</ul>
					</dd>
				</dl>
			</div>
			<div class="zx_fourlist">
				<div class="zx_fourlist01">
					<h2>
						<span><a target="_blank" href="http://news.ywy7.com/news/ynzx.htm">更多>></a></span>资本风向
					</h2>
					<dl class="zbfx_1">
					</dl>
					<ul class="zbfx_2">
					</ul>
				</div>
				<div class="zx_fourlist01" style="float:right;">
					<h2>
						<span><a target="_blank" href="http://news.ywy7.com/news/ynzx.htm">更多>></a></span>市场前沿
					</h2>
					<ul class="scqy_1">
					</ul>
				</div>
				<div class="zx_fourlist01">
					<h2>
						<span><a target="_blank" href="http://news.ywy7.com/news/ynzx.htm">更多>></a></span>公司新闻
					</h2>
					<ul class="gsxw_1">
					</ul>
				</div>
				<div class="zx_fourlist01" style="float:right;">
					<h2>
						<span><a target="_blank" href="http://news.ywy7.com/news/ynzx.htm">更多>></a></span>海外动态
					</h2>
					<ul class="hwdt_1">
					</ul>
				</div>
			</div>
		</div>
		<div class="zx_rwzf_zxch">
			<div class="zx_rwzf">
				<h2>人物专访</h2>
				<div class="zx_rwzf_nr">
					<ul class="zx_rwzf_nr_1">
					</ul>
				</div>
			</div>
			<div id="advertC" data-type="7" data-index="7" class="adverth" style="width: 340px;margin-top: 20px;">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		IndustryNews();
	})

	function IndustryNews() {
		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 2,
				"perNumber" : 20
			},
			success : function(data) {
				$.each(data.resultList,function(i, m) {
					if (i == 0) {
						$(".zx_cyzx01_2").append('<a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'><img src='+commonFn.getImgUrl(m.timg)+' width="300" height="370" title='+m.title+' /><span>'+ m.title+ '</span></a>');
					} else if (i == 1) {
						$(".zx_cyzx01_1").append('<a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+ '</a>');
					}
					if (i < 13) {
						$(".zx_cyzx01_3").append('<li><span>'+ $._DateFormat(new Date(m.createTime),'MM-dd')+ '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+ '</a></li>');
					}
				});

			}
		});

		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 14,
				"perNumber" : 3
			},
			success : function(data) {
				$.each(data.resultList,function(i, m) {
					if (i == 0) {
						$(".zbfx_1").append('<dt><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+'</a></dt><dd class="pic"><img src='+commonFn.getImgUrl(m.timg)+' width="160" height="105" title='+m.title+' /></dd><dd class="txt">'+ m.title+ '</dd>');
					} else {
						$(".zbfx_2").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+ '</a></li>');
					}
				});
			}
		});

		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 15,
				"perNumber" : 6
			},
			success : function(data) {
				$.each(data.resultList,function(i, m) {
					$(".scqy_1").append('<li><span>'+ $._DateFormat(new Date(m.createTime),'MM-dd')+ '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+ '</a></li>');
				});
			}
		});

		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 16,
				"perNumber" : 6
			},
			success : function(data) {
				$.each(data.resultList,function(i, m) {
					$(".gsxw_1").append('<li><span>'+ $._DateFormat(new Date(m.createTime),'MM-dd')+ '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+ '</a></li>');
				});
			}
		});

		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 17,
				"perNumber" : 6
			},
			success : function(data) {
				$.each(data.resultList,function(i, m) {
					$(".hwdt_1").append('<li><span>'+ $._DateFormat(new Date(m.createTime),'MM-dd')+ '</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+' >'+ m.title+ '</a></li>');
				});
			}
		});

		$.ajax({
			type : "POST",
			url : "news/getGamesNews.do",
			data : {
				"tType" : 13,
				"perNumber" : 10
			},
			success : function(data) {
				$.each(data.resultList,function(i, m) {
					if (i == 0) {
						$(".zx_rwzf_nr_1").append('<li class="pic" style="border:1xp solid #fff;"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'><img src='+commonFn.getImgUrl(m.timg)+'  width="320" height="170" title='+m.title+' /></a></li>');
					} else if (i < 5) {
						$(".zx_rwzf_nr_1").append('<li class="txt"><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'>'+ m.title+ '</a></li>');
					}
				});
			}
		});
	}
</script>    
	



