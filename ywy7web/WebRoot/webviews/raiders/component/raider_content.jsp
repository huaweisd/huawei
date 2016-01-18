<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="zx_left">
	<div id="xypc_list_h">
		<div class="xypc_list" style="width: 815px;">
			<c:if test="${nav_on == 1}">
				<ul class="twgl"></ul>
			</c:if>
			<c:if test="${nav_on == 2}">
				<ul class="spgl"></ul>
			</c:if>
		</div>
	</div>
</div>
<div class="zx_right">
	<c:if test="${nav_on == 1}">
		<div class="glny_xbtj">
			<h2>小编推荐</h2>
			<div class="glny_xbtj_nr">
				<dl class="gl_xbtj_nr_1"></dl>
				<div class="video_content_rmzx_nr" style="padding: 0px;height: 100px;border: 0px none;">
					<ul id="gl_xbtj_list"></ul>
				</div>
			</div>
		</div>
		<div class="glny_zydph">
			<h2>周阅读排行</h2>
			<div class="glny_zydph_nr">
				<ul class="glny_zydph_nr_1"></ul>
			</div>
		</div>
		<div class="gl_rmzq">
			<h2><span><a target="_blank" href="http://area.ywy7.com">更多>></a></span>热门专区</h2>
			<div id="gl_rmzq_nr" class="rwzf_rmzq_nr_1"></div>
		</div>
	</c:if>
	<c:if test="${nav_on == 2}">
		<div class="video_content_rmzx header03">
        	<h2><span><a target="_blank" href="http://news.ywy7.com">更多&gt;&gt;</a></span>热门资讯</h2>
            <div class="video_content_rmzx_nr">
            	<ul id="gl_rmzx_list"></ul>
            </div>
		</div>
		<div id="glny_spgl_right">
			<div id="advertC" data-type="19" data-index="11">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</div>
	</c:if>
</div>
<script type="text/javascript">
	$(function() {
		var nav_on = '${nav_on}';
		if (nav_on == "1") {
			var l_data = {
				params : {
					"perNumber" : 18,
					"page" : 1
				},
				url : "raiders/getRaidersPage.do",
				fun : function(data) {
					$(".twgl").empty();
					$.each(data, function(i, m) {
						$(".twgl").append('<li style="width:236px;height:280px;padding:10px;margin-left:12px;"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="230" height="150" title="'+m.title+'"/></a><p class="title"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" class="fs12">'+ $._ffsize(m.title, 18)+ '</a></p><p><span style="color:#828282;">发表于：' + $._DateFormat(new Date(m.createTime), 'yyyy-MM-dd') + '</span></p></li>');
					});
				}
			};
			$("#xypc_list_h").lxhgrid(l_data);
			XBTJ();
			ZYDPHB();
			RMZQ();
		}
		if (nav_on == "2") {
			var l_data = {
				params : {
					"tType" : 3,
					"perNumber" : 12,
					"page" : 1
				},
				url : "raiders/getRaidersPage.do",
				fun : function(data) {
					$(".spgl").empty();
					$.each(data, function(i, m) {
						$(".spgl").append('<li style="width:236px;height:280px;padding:10px;margin-left:12px;"><a href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.timg)+' width="230" height="150" title="'+m.title+'"/></a><p class="title"><a href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" style="font-size:12px;">'
						+ $._ffsize(m.title, 18)+ '</a></p><p><span>'+ $._DateFormat(new Date(m.createTime),'yyyy-MM-dd')+ '</span></p></li>');
					});
				}
			};
			$("#xypc_list_h").lxhgrid(l_data);
			RMZX();
		}
	})

	function XBTJ() {
		$.ajax({
			type : "POST",
			url : "raiders/getRaiders.do",
			data : {
				"tType" : 4,
				"perNumber" : 4,
				'order' : 1
			},
			success : function(data) {
				$.each(data.resultList, function(i, m) {
					if (i == 0) {
						$(".gl_xbtj_nr_1").append('<dt class="fs12"><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm">' + m.title+ '</a></dt><dd class="pic fs12"><img src="'+commonFn.getImgUrl(m.timg)+'" width="95" height="95" /></dd><dd class="txt fs12">发布时间：'+ $._DateFormat(new Date(m.createTimeStr),'yyyy-MM-dd') + '<br />推荐指数：'+ m.clickCount+ '</dd>');
					} else if (i < 4) {
						$("#gl_xbtj_list").append('<li class="list" style="width: 288px !important;"><a title="'+m.title+'" target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm">'+m.title+'</a></li>');
					}
				});
			}
		});
	}

	function ZYDPHB() {
		var st = new Date();
		st.setTime(st.getTime() - (1000 * 60 * 60 * 24 * 7));
		$.ajax({
			type : "POST",
			url : "raiders/getRaidersByTime.do",
			data : {
				"startCreateTimeStr" : $._DateFormat(st, "yyyy-MM-dd") + " 00:00:00",
				"perNumber" : 10
			},
			success : function(data) {
				if (data.state) {
					$.each(data.resultList, function(i, m) {
						$(".glny_zydph_nr_1").append('<li><span>' + (i + 1) + '</span><a target="_blank" href="'+commonFn.getRelLink('gl')+'/raiders/'+m.id+'.htm" title="'+m.title+'">'+ $._ffsize(m.title, 17)+ '</a></li>');
					});
				}
			}
		});
	}
	function RMZQ() {
		$.ajax({
			type : "POST",
			url : "news/getHotRegion.do",
			data : {
				"zqType" : 3,
				"perNumber" : 5
			},
			success : function(data) {
				$.each(data.resultList, function(i, m) {
					$(".rwzf_rmzq_nr_1").append('<ul><li class="a01"><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.imgA)+'" width="330" height="130" /><span style="width:330px;">'+ m.gameName+ '</span></a></li> <li style="width:100%;"><p ><a target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+m.id+'.htm">专区</a></p><p><a href="javascript:void(0)">论坛</a></p><p class="right"><a target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'_1.htm">礼包</a></p></li></ul>');
				});
			}
		})
	}
	function RMZX() {
		$._post("video/getVideoNews.do", {
     		'perNumber' : 9,
			'tType' : 7
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			if(data.state) {
	        			if(i == 0) {
	    					$("#gl_rmzx_list").append('<li><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="290" height="150" title="'+m.title+'"/><span title="'+m.title+'">'+m.title+'</span></a></li>');
	    				} else {
	    					$("#gl_rmzx_list").append('<li class="list"><a title="'+m.title+'" target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm">'+m.title+'</a></li>');
	    			    }
        			}
        		})
        	}
        });
	}
</script>    
	



