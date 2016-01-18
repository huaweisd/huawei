<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main1_activity_title">
	<div class="main1_activity_title_name"><img src="webviews/common/img/hotActivityIcon.png" width="24" height="24" /><span>火爆活动</span></div>
	<div class="more" title="更多"><a href="http://news.ywy7.com">...</a></div>
</div>
<div class="main1_activity_text" id="main1_activity_text"></div>
<script type="text/javascript">
	$(function(){
		$._post("index/getIndexNews.do", {
			'perNumber' : 3,
			'tType' : 5
        }, function(data) {
        	if(data.state){
        		$.each(data.resultList, function(i, m){
        			$('#main1_activity_text').append('<div><span class="hotActiviteDate">'+$._DateFormat(new Date(m.createTime), 'yyyy-MM-dd')+'</span><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" style="float:right;">详情++</a><span class="hotActiviteImg"><img src="'+commonFn.getImgUrl(m.timg)+'" width="240" height="100" /></span><span class="hotActiviteTitle"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+m.title+'</a></span></div>')
        		})
        	}
        });
	})
</script>