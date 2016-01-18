<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="friendLink">
	<h2>友情链接</h2>
	<div id="link_nr" class="link_nr">
		<ul class="link_nr_ul">
			<div id="link-content" class="link_nr_ul_content"></div>
		</ul>
		<div style="width: 20px; height: 50px; float: left; margin-top: 5px;" id="up-down" class="btns_up_down">
			<a id="friendLink_up" class="btn_up"></a>
			<a id="friendLink_down" class="btn_down"></a>
		</div>
	</div>
</div>
<script type="text/javascript">
	$.ajax({
		type: "POST",
  		url: "index/getIndexFriendLink.do",
		data:{
        	'tGroup' : 1
    	},
		success: function(data) {
   			if(data.state){
       			$.each(data.resultList, function(i, m){
       				$('#link-content').append('<a target="_blanck" href="'+getFriendLink(m.titleLink)+'">'+m.title+'</a>');
    			})
    			$('#friendLink_up').click(function(){
    				$("#link-content").stop(true,true);
                	var top = Math.abs(parseInt($("#link-content").css("top")));
                	if(top){
                		$("#link-content").animate({"top":((top-30)*(-1))+"px"});
                	}
    			})
    			$('#friendLink_down').click(function(){
    				$("#link-content").stop(true,true);
                	var contentHeight = parseInt($("#link-content").css("height"));
                	var top = Math.abs(parseInt($("#link-content").css("top")));
                	var lHeight =  parseInt($("ul", "#link_nr").css("height"));
                	if(contentHeight-top <= lHeight ){
                		return;
                	}
                	$("#link-content").animate({"top":((top+30)*(-1))+"px"});
    			})
  			}
        
         }
	})
	function getFriendLink(url){
		if (url.indexOf('http') < 0) {
			url = 'http://' + url;
		}
		return url;
	}
</script>