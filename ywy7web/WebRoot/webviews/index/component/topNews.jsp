<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">今日头条</div>
<div class="more first" title="更多"><a href="http://news.ywy7.htm">...</a></div>
<div class="main1_right_topNews" id="main1_right_topNews">
	<ul>
		<li><p data-i="0" class="u1 gl sl"></p></li>
		<li><p data-i="1" class="u1 pt sl"></p></li>
		<li><p data-i="2" class="u1 gl sl"></p></li>
		<li><p data-i="3" class="u1 pt sl"></p></li>
	</ul>
	<ul>
		<li><p data-i="4" class="sl u2" style="margin-top:10px;"></p></li>
		<li><p data-i="5" class="sl u2"></p></li>
		<li><p data-i="6" class="sl u2"></p></li>
		<li><p data-i="7" class="sl u2"></p></li>
	</ul>
	<ul>
		<li><p data-i="8" class="u1 gl sl"></p></li>
		<li><p data-i="9" class="u1 gl sl"></p></li>
	</ul>
	<ul>
		<li><p data-i="10" class="sl u2" style="margin-top:10px;"></p></li>
		<li><p data-i="11" class="sl u2"></p></li>
		<li><p data-i="12" class="sl u2"></p></li>
		<li><p data-i="13" class="sl u2"></p></li>
		<li><p data-i="14" class="sl u2"></p></li>
		<li><p data-i="15" class="sl u2"></p></li>
		<li><p data-i="16" class="sl u2"></p></li>
		<li><p data-i="17" class="sl u2"></p></li>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexNews.do",
	     	data: {
				'perNumber' : 18,
				'tType' : 7
	        },
	        success: function(data) {
	        	if(data.state){
	        		$.each(data.resultList, function(i, m){
	        			if(i<4 || (i>7 && i<10)){
	        				if (i==1 || i==3) {
	        					$('#main1_right_topNews').find('p[data-i='+i+']').attr('title', m.title).html('<a href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" target="_blank">'+m.title+'</a>');
							}else{
								$('#main1_right_topNews').find('p[data-i='+i+']').attr('title', m.title).html('<a class="clF08116" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" target="_blank">'+m.title+'</a>');
							}
	        			} else {
	        				$('#main1_right_topNews').find('p[data-i='+i+']').attr('title', m.title).html('<a href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" target="_blank">'+m.title+'</a>').after('<span style="width: 50px; float: left;">['+$._DateFormat(new Date(m.createTime), 'MM-dd')+']</span>')
	        			}
	        		})
	        	}
	        }
		})
	})
</script>