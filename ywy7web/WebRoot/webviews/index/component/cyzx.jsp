<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main6_t_l">
	<div class="main6_t_l_banner">
		<div id="fsD12_1" class="focus" style=" height: 280px !important;  width: 350px !important;">
			<div id="D1pic12_1" class="fPic" style=" height: 280px !important;  width: 350px !important;"></div>
		</div>
	</div>
</div>
<div class="main6_t_r">
	<h2>产业资讯</h2>
	<div class="more sixth" title="更多"><a href="http://news.ywy7.com/news/ynzx.htm">...</a></div>
	<div class="main6_t_r_content">
		<div class="cyzx_gl" id="industryNewsGL"></div>
		<ul id="industryNewsPT"></ul>
	</div>
</div>
<div id="advertH" data-type="1" data-index="0" class="advert_D">
	<jsp:include page="../../common/advertA.jsp"></jsp:include>
</div>
<script type="text/javascript">
	$(function(){
		$._post("index/getIndexNews.do", {	
			'perNumber' : 5,
			'tType' : 2
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			if(i == 0) {
        				$('#industryNewsGL').append('<a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'"><span class="cyzx_gl_title">'+m.title+'</span><img class="cyzx_gl_img" src="'+commonFn.getImgUrl(m.timg)+'" width="160" height="90" /><span class="cyzx_gl_desc">'+$._ffsize($._substring($._removeHTMLTag(m.content)), 75)+'</span></a>');
        			}else{
        				$('#industryNewsPT').append('<li class="cyzx_pt"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm" title="'+m.title+'">'+m.title+'</a></li>');
        			}
        		})
        	}
        });
		
		$._post("index/getIndexNews.do", {	
			'perNumber' : 4,
			'tType' : 6
        }, function(data) {
        	if(data.state) {
        		for(var i = 0; i < data.resultList.length; i++){
        			$('#D1fBt2_1').append('<a href="javascript:void(0)" hidefocus="true" target="_self"></a>');
        		}
        		$.each(data.resultList, function(i, m){
        			$('#D1pic12_1').append('<div class="fcon" style="display: none;"><a target="_blank" href="'+commonFn.getRelLink('news')+'/news/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="350" height="280" style="width:350px !important;height: 280px !important;" /><p>'+m.title+'</p></a></div>');
        		})
        		Qfast(false, 'widgets', function() {
	    			K.tabs({
	    				id: 'fsD12_1',
	    				// 焦点图包裹id
	    				conId: "D1pic12_1",
	    				// ** 大图域包裹id
	    				tabTn: "a",
	    				conCn: '.fcon',
	    				// ** 大图域配置class
	    				auto: 1,
	    				// 自动播放 1或0
	    				effect: 'fade',
	    				// 效果配置
	    				eType: 'click',
	    				// ** 鼠标事件
	    				pageBt: true,
	    				// 是否有按钮切换页码
	    				//bns: ['.prev', '.next'],
	    				// ** 前后按钮配置class
	    				interval: 3000
	    				// ** 停顿时间
	    			});
	    		});
        	}
        });
	})
</script>