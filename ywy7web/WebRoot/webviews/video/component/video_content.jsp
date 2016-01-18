<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="video_content_container">
	<div class="video_content_left">
		<div id="mgrid">
			<c:if test="${nav_on == 1}">
				<div class="video_xyfb_nr h810 video_border" id="video_content_left_list"></div>
			</c:if>
			<c:if test="${nav_on == 2 || nav_on == 3}">
				<div class="video_content_left_list">
					<ul id="video_content_left_list"></ul>
				</div>
			</c:if>
		</div>
	</div>

	<div  class="video_content_right">
		<div class="video_content_rmzx header03">
        	<h2><span><a target="_blank" href="#">更多&gt;&gt;</a></span>热门资讯</h2>
            <div class="video_content_rmzx_nr">
            	<ul id="video_content_rmzx_content"></ul>
            </div>
		</div>
        <c:if test="${nav_on == 1}">
			<div id="advertD" data-type="22" data-index="11" class="advertg">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</c:if>
		<c:if test="${nav_on == 2}">
			<div id="advertE" data-type="21" data-index="12" class="advertg">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</c:if>
		<c:if test="${nav_on == 3}">
			<div id="advertF" data-type="23" data-index="12" class="advertg">
				<jsp:include page="../../common/advertA.jsp"></jsp:include>
			</div>
		</c:if>
       	<c:if test="${nav_on == 2 || nav_on == 3}">
	        <div class="video_content_rmzx header03">
	        	<h2><span><a target="_blank" href="#">更多&gt;&gt;</a></span>评测专辑</h2>
	            <div class="video_content_rmzx_nr h350">
	            	<ul id="video_content_pczj_content"></ul>
	            </div>
	        </div>
		</c:if>
    </div>
</div>
<script type="text/javascript">
	$(function(){
        var nav_on = '${nav_on}';
        
        var l_data = {
	   		perNumber:12,
	   	  	url : 'video/getVideoVideosPage.do',
	   	 	params : {},
	   	  	fun : function(data){
	   			
	   	  	}
		};
		switch(parseInt(nav_on)){
			case 1:
				l_data.perNumber = 4;
				l_data.params = {'tType' : 1, 'page' : 1};
				l_data.fun = function(data){
					$("#video_content_left_list").empty();
					$.each(data, function(i, m){
						$("#video_content_left_list").append('<dl><dt class="w458"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" title="'+m.title+'" target="_blank">'+m.title+'</a></dt><dd class="video_xyfb_pic"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank"><img src="'+commonFn.getImgUrl(m.timg)+'" width="308" height="158" title="'+m.title+'"/></a></dd><dd class="video_xyfb_txt w458">'+m.ttitle+'</dd><dd class="video_xyfb_riqi w458">'+$._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd')+'</dd></dl>');
					})
				}
		  		break;
			case 2:
				l_data.params = {'tType' : 2, 'page' : 1};
				l_data.fun = function(data){
					$("#video_content_left_list").empty();
					$.each(data, function(i,m) {
						$("#video_content_left_list").append('<li><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" title="'+m.title+'" target="_blank"><img src="'+commonFn.getImgUrl(m.timg)+'" width="230" height="150"/><span>'+m.title+'</span></a></li>');
					});
				}
		  		break;
			case 3:
				l_data.params = {'tType' : 3, 'page' : 1};
				l_data.fun = function(data){
					$("#video_content_left_list").empty();
					$.each(data,function(i,m) {
				 		$("#video_content_left_list").append('<li><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" title="'+m.title+'" target="_blank"><img src="'+commonFn.getImgUrl(m.timg)+'" width="230" height="150"/><span>'+m.title+'</span></a></li>');
					});
				}
		  		break;
			default:
		  		break;
		}
		$("#mgrid").lxhgrid(l_data);
        
		$._post("video/getVideoNews.do", {
     		'perNumber' : 9,
			'tType' : 7
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			if(data.state) {
	        			if(i == 0) {
	    					$("#video_content_rmzx_content").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="290" height="150" title="'+m.title+'"/><span title="'+m.title+'">'+m.title+'</span></a></li>');
	    				} else {
	    					$("#video_content_rmzx_content").append('<li class="list"><a title="'+m.title+'" target="_blank" href="'+ commonFn.getRelLink("news") + 'news/'+m.id+'.htm">'+m.title+'</a></li>');
	    			    }
        			}
        		})
        	}
        });
		
		if(nav_on != 1){
			$._post("video/getVideoEvaluation.do", {
	     		'perNumber' : 2,
				'tType' : 7
	        }, function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			$("#video_content_pczj_content").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="290" height="150" title="'+m.title+'"/><span title="'+m.title+'">'+m.title+'</span></a></li>');
	        		})
	        	}
	        });
		}
		
	})
</script>