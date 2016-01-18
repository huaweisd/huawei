<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <div class="rwzf_rmzxgl">
    <ul class="tabrmzxgl">
        <li class="current">热门资讯</li>
        <li>热门攻略</li>
    </ul>
    <div class="contentrmzxgl">
        <ul style="display:block;" class="rmzx_1">
        	
        </ul>
        <ul class="rmgl_1">
           
        </ul>
        
    </div>
</div><!--end-->
<div>
		<c:if test="${nav_on == 2}">
			<div id="advertC" data-type="9" data-index="9" class="adverth">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</c:if>
		<c:if test="${nav_on == 3}">
			<div id="advertC" data-type="8" data-index="9" class="adverth">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</c:if>
</div><!--end-->
<div class="rwzf_zxlb">
    <h2>最新礼包</h2>
	    <c:if test="${nav_on == 2}">
	    	<div id="rwzf_zxlb_nr">
	    	<dl class="rwzf_zxlb_nr_1">
            </dl>
            <ul  class="rwzf_zxlb_nr_2">
	        </ul>
      		</div>
	    </c:if>
	    <c:if test="${nav_on == 3}">
	    	<div id="rwzf_zxlb_nr" class="rwzf_zxlb_nr_1">
	    	</div>
	    </c:if>
</div><!--end-->
		<c:if test="${nav_on == 2}">
			<div class="gl_rmzq">
				<h2><span><a  target="_blank" href="http://area.ywy7.com/">更多>></a></span>热门专区</h2>
		        <div id="gl_rmzq_nr" class="rwzf_rmzq_nr_1">
		        </div>
			</div>
		</c:if>
		<c:if test="${nav_on == 3}">
			<div class="rwzf_rmzq">
				<h2>热门专区</h2>
		        <div id="rwzf_rmzq_nr" class="rwzf_rmzq_nr_1">
		        </div>
		    </div>
		</c:if>
<!--end-->

<script type="text/javascript">
	//业内资讯  人物专访
	$(function(){
		//获得参数
		 var nav_on = '${nav_on}';
		//新闻攻略切换js
		$(".tabrmzxgl li").click(function(){
		$(".contentrmzxgl ul").hide().eq($(".tabrmzxgl li").removeClass().index($(this).addClass("current"))).show(); 	
		});
		
		//热门新闻
		 $.ajax({
				type: "POST",
				url: "news/getGamesNews.do",
				data: {
					"tType":7,
					"perNumber": 10
				},
				success: function(data) {
			   		$.each(data.resultList, 
			   			function(i,m) {
			   			if(i < 3){
					   		$(".rmzx_1").append('<li><span class="pot">'+(i+1)+'</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm">'+$._ffsize(m.title,18)+'</a></li>');
					   	}else{
					  		$(".rmzx_1").append('<li><span >'+(i+1)+'</span><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm">'+$._ffsize(m.title,18)+'</a></li>');
					   	}
					});
				}
			});
		//热门攻略
		$.ajax({
				type: "POST",
				url: "news/getHotRaiders.do",
				data: {
					"tType":1,
					"perNumber": 10
				},
				success: function(data) {
			   		$.each(data.resultList, 
			   			function(i,m) {
			   			if(i < 3){
					   		$(".rmgl_1").append('<li><span class="pot">'+(i+1)+'</span><a target="_blank" href="'+ commonFn.getRelLink("gl") + '/raiders/'+m.id+'.htm">'+$._ffsize(m.title,18)+'</a></li>');
					   	}else{
					   		$(".rmgl_1").append('<li><span >'+(i+1)+'</span><a target="_blank" href="'+ commonFn.getRelLink("gl") + '/raiders/'+m.id+'.htm">'+$._ffsize(m.title,18)+'</a></li>');
					   	}
					});
				}
			});
			
		if(nav_on=="2"){
			$.ajax({
				type: "POST",
				url: "news/getNewPackage.do",
				data: {
					"tType":2,
					"perNumber": 3,
					'startRecordNum': 0
				},
				success: function(data) {
			   		$.each(data.resultList,
						function(i,m) {
						   if(i ==0)
						   {
						   $(".rwzf_zxlb_nr_1").append('<dt>'+m.packageName+'</dt> <dd class="pic"><img src='+commonFn.getImgUrl(m.timg)+' width="140" height="105" /></dd><dd class="txt">系统： Android<br />剩余： '+(m.tcount-m.scount)+'<br /><span><a target="_blank" href="'+ commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">怒领</a></span></dd>');
						   }
						   else
						   {
						   $(".rwzf_zxlb_nr_2").append('<li><a target="_blank" href="'+ commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">'+m.packageName+'</a></li>');
						   }
					});
				}
			});
			
			//热门专区
			$.ajax({
				type: "POST",
				url: "news/getHotRegion.do",
				data: {
					"zqType":3,
					"perNumber": 4
				},
				success: function(data) {
			   		$.each(data.resultList, function(i,m) {
				 		$(".rwzf_rmzq_nr_1").append('<ul> 	<li class="a01"><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.imgA)+'" width="330" height="130" /><span style="width:330px;">'+m.gameName+'</span></a></li> <li style="width:100%;"><p ><a target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm">专区</a></p><p><a href="#">论坛</a></p><p class="right"><a target="_blank" href="'+ commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">礼包</a></p></li></ul>');
					});
				}
			});
		
		}else if(nav_on=="3"){
			$.ajax({
				type: "POST",
				url: "news/getNewPackage.do",
				data: {
					"tType":2,
					"perNumber": 3,
					'startRecordNum':0
				},
				success: function(data) {
				   $.each(data.resultList,
						function(i,m) {
						   $(".rwzf_zxlb_nr_1").append('<dl class="first_lbt_'+i+'"><dt>'+m.packageName+'</dt><dd class="pic lbt"><img src='+commonFn.getImgUrl(m.timg)+' width="140" height="105" /></dd><dd class="txt lbt">系统： Android<br />剩余： '+(m.tcount-m.scount)+'<br /><span><a target="_blank" href="'+ commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">怒领</a></span></dd><dl>');
						  });
					$(".lbt",".first_lbt_0").show();
				  	$("dl",".rwzf_zxlb_nr_1").bind("mouseover",function(){
				    $(".lbt").hide();
					$(".lbt",$(this)).show();
				   });
				 }
			});
			
			$.ajax({
				type: "POST",
				url: "news/getHotRegion.do",
				data: {
					"zqType":3,
					"perNumber": 4
				},
				success: function(data) {
			   		$.each(data.resultList, function(i,m) {
						$(".rwzf_rmzq_nr_1").append('<dl><dt>'+m.gameName+'</dt><dd class="pic"><img src="'+commonFn.getImgUrl(m.imgA)+'" width="98" height="98" /></dd><dd class="txt" title='+$._removeHTMLTag(m.gameDesc)+'>'+$._ffsize($._removeHTMLTag(m.gameDesc), 15)+'</dd><dd class="txt"><p ><a  target="_blank" href="'+ commonFn.getRelLink("ku") + '/product/'+m.id+'.htm">专区</a></p><p><a href="#">论坛</a></p><p class="right"><a target="_blank" href="'+ commonFn.getRelLink("pack") + '/package/'+m.id+'_1.htm" >礼包</a></p></dd></dl>');
					});
				}
			});
		}
		
	})
	
	
</script>    
	



