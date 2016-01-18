<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="video_swpc_content header01">
	<h2>
		<span><a target="_blank" href="#">更多&gt;&gt;</a></span>试玩评测
	</h2>
	<div class="video_swpc_nr">
		<div class="video_swpc_nr_1">
			<ul id="video_swpc_nr_1"></ul>
		</div>
		<div class="video_swpc_nr_2" id="video_swpc_nr_2"></div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$._post("video/getVideoVideos.do", {
     		'perNumber' : 3,
			'tType' : 1
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			if(i==0){
        				$('#video_swpc_nr_1').append('<li class="video_swpc1_li1"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank"><img src="'+commonFn.getImgUrl(m.timg)+'" height="200" width="305"></a></li><li class="video_swpc1_li2"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank"><strong>'+m.title+'</strong></a></li><li class="video_swpc1_txt">'+m.ttitle+'</li><li class="video_swpc1_more">[<a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank">详细</a>]</li>');
        			}else{
        				$('#video_swpc_nr_2').append('<dl><dt><strong><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm" target="_blank">'+m.title+'</a></strong></dt><dd class="video_swpc2_pic"><a href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" height="138" width="210"></a></dd><dd class="video_swpc2_txt">'+m.ttitle+'</dd><dd class="video_swpc2_more">[<a target="_blank" href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm">详细</a>]</dd></dl>');
        			}
        		})
        	}
        });
	})
</script>
<div class="video_xyfb_content header01">
	<h2>
		<span><a target="_blank" href="#">更多&gt;&gt;</a></span>新游发布
	</h2>
	<div id="sp_xyfb_nr" class="video_xyfb_nr h810"></div>
</div>
<script type="text/javascript">
	$(function(){
		$._post("video/getVideoVideos.do", {
     		'perNumber' : 4,
			'tType' : 3
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#sp_xyfb_nr').append('<dl><dt><a target="_blank" href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm">'+m.title+'</a></dt><dd class="video_xyfb_pic"><a target="_blank" href="'+ commonFn.getRelLink("v") + '/video/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" height="155" width="305"></a></dd><dd class="video_xyfb_txt">'+m.ttitle+'</dd><dd class="video_xyfb_riqi">'+$._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd')+'</dd></dl>');
        		})
        	}
        });
	})
</script>