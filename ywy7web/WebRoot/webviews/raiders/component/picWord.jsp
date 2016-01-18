<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="gl_fivepic" class="area-girl-wall">
	<ul>
   		<li class="a01 "><a href="javascript:void(0)" class="girl-item"><img twtag="1" src="" width="378" height="470" /></a></li>
		<li class="a02 qiehuan" >
 			<div id="fsD12" class="focus" style=" height: 232px;  width: 470px;">
				<div id="D1pic12" class="fPic" style=" height: 232px;  width: 470px;"></div>
				<div class="fbg">
					<div class="D1fBt mgt34" id="D1fBt2">
						<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
						<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
						<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
						<a href="javascript:void(0)" hidefocus="true" target="_self"></a>
					</div>
				</div>
				<span class="prev"></span><span class="next"></span>
			</div>
		</li>
		<li class="a03"><a href="javascript:void(0)" class="girl-item"><img twtag="3" src="" width="310" height="232" /></a></li>
		<li class="a04"><a href="javascript:void(0)" class="girl-item"><img twtag="4" src="" width="310" height="230" /></a></li>
		<li class="a05"><a href="javascript:void(0)" class="girl-item"><img twtag="5" src="" width="470" height="230" /></a></li>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		getTuWen();
	});
	function getTuWen() {
		$.ajax({
			type: "POST",
            url: "news/getNewsImages.do",
			data: {
				"tType":8,
				"perNumber": 10
		 	},
            success: function(data) {
				if (data.state) {
					$.each(data.resultList, function(i, m) {
						if( m.tindex == 2){
							if($(".fcon","#D1pic12").length < 4){
								$("#D1pic12").append('<div class="fcon" style="display: none;"><a href="'+commonFn.getRelLink('news')+'/image/'+m.id+'.htm"><img src='+commonFn.getImgUrl(m.turl)+' style="opacity: 1; height:232px  !important;  width:470px  !important; "></a><span class="shadow"><a href="javascript:">'+$._ffsize(m.tdesc, 16)+'</a></span></div>');
					        }
						}else{
							$("img[twtag="+m.tindex+"]").attr({src:commonFn.getImgUrl(m.turl),tid:m.id,tag:commonFn.getRelLink('news')+"/image/"+m.id+".htm"}).bind("click", function() {
								window.open($(this).attr('tag'));
							}).after($("<p/>").html(m.tdesc).attr("style", "overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"));
						}
                    });
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
						})
					});
				}
     		}
        });
	}
</script>	
	



