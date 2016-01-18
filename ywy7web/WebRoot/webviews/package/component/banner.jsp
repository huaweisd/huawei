<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="fsD12" class="focus" style=" height: 506px !important;  width: 1180px !important; overflow: hidden;">
	<div id="D1pic12" class="fPic" style=" height: 506px !important;  width: 1180px !important;"></div>
	<div class="fbg">
		<div class="D1fBt" id="D1fBt2">
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
		var d = {
				'tType' : 6,
				'perNumber' : 4
	        };
		var pageIndex = '${nav_on}';
		if(pageIndex == '1'){
			d = {
				'tType' : 2,
				'perNumber' : 4
	        };
		}
		$._post("package/getPackageImages.do", d, function(data) {
        	if(data.state) {
        		if(data.resultList.length == 0){
        			$('#fsD12').hide();
        			return;
        		}
        		$.each(data.resultList, function(i, m){
        			$('#D1pic12').append('<div class="fcon" style="display: none;"><a href="' + commonFn.getRelLink("news") + "/news/'+m.id+'.htm" + '"><img src="'+  commonFn.getImgUrl(m.turl)+'" width="1180" height="506" style=" height: 506px !important;  width: 1180px !important;" /><p style="width:1144px;max-width:1144px;">'+m.tdesc+'</p></a></div>')
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