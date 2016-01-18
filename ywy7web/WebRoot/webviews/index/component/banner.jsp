<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="fsD12" class="focus" style=" height: 450px !important;  width: 800px !important;">
	<div id="D1pic12" class="fPic" style=" height: 450px !important;  width: 800px !important;"></div>
	<div class="fbg">
		<div class="D1fBt" id="D1fBt2">
			<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
			<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
			<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
			<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
			<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
		</div>
	</div>
	<span class="prev"></span><span class="next"></span>
</div>
<script type="text/javascript">
	$(function(){
		$._post("index/getIndexImages.do", {
			'perNumber' : 5,
			'tType' : 3
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#D1pic12').append('<div class="fcon" style="display: none;"><a target="_blank" href="'+commonFn.getRelLink('news')+'/image/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.turl)+'" width="800" height="450" style=" height: 450px !important;  width: 800px !important;" /><p>'+m.tdesc+'</p></a></div>')
        		})
        		Qfast(false, 'widgets', function() {
	    			K.tabs({
	    				id: 'fsD12',
	    				// 焦点图包裹id
	    				conId: "D1pic12",
	    				// ** 大图域包裹id
	    				tabId: "D1fBt2",
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
	    				bns: ['.prev', '.next'],
	    				// ** 前后按钮配置class
	    				interval: 3000
	    				// ** 停顿时间
	    			});
	    		});
        	}
        });
	})
</script>