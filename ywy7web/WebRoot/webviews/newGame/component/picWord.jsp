<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="xy_fiveqh">
	<div id="fsD12" class="focus" style=" height: 405px;  width: 580px;">
		<div id="D1pic12" class="fPic" style=" height: 405px;  width: 580px;"></div>
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
</div>
<div class="xy_threepic">
	<ul>
		<li class="area-girl-wall" style="margin-bottom:10px;padding-bottom:0px;">
			<a twtag="2" href="#" class="girl-item"><img twtag="2" src="" width="200" height="128" /></a>
		</li>
		<li class="area-girl-wall" style="margin-bottom:10px;padding-bottom:0px;">
			<a twtag="3" href="#" class="girl-item"><img twtag="3" src="" width="200" height="128" /></a>
		</li>
		<li class="area-girl-wall" style="margin-bottom:10px;padding-bottom:0px;">
			<a twtag="4" href="#" class="girl-item"><img twtag="4" src="" width="200" height="128" /></a>
		</li>
	</ul>
</div>
<div class="xy_ad04" class="area-girl-wall" style="margin-bottom:10px;padding-bottom:0px;">
	<a twtag="5" href="#" class="girl-item"><img twtag="5" src="" width="350" height="405" /></a>
</div>
<script type="text/javascript">
	$(function() {
		getTuWen();
	});

	function getTuWen() {
		$.ajax({
			type : "POST",
			url : "news/getNewsImages.do",
			data : {
				"tType" : 9,
				"perNumber" : 10
			},
			success : function(data) {
				if (data.state) {
					$.each(data.resultList, function(i, m) {
						if (m.tindex == 1) {
							if ($(".fcon", "#D1pic12").length < 4) {
								$("#D1pic12").append('<div class="fcon" style="display: none;"><a href="'+commonFn.getRelLink('news')+'/image/'+m.id+'.htm"><img src='
														+ commonFn.getImgUrl(m.turl)
														+ ' style="opacity: 1; height:405px !important;width:580px !important;"></a><span class="shadow"><a href="'+commonFn.getRelLink('news')+'/image/'+m.id+'.htm">'
														+ m.tdesc
														+ '</a></span></div>');
							}
						} else {
							$("img[twtag=" + m.tindex + "]").attr({
								src : commonFn.getImgUrl(m.turl),
								id : m.id,
								tag : "tw_info.htm?id="
										+ m.id
							}).bind("click", function() {
								location.href = $(this).attr('tag');
							}).after($("<p/>").html(m.tdesc).attr("style","overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"));
							$('a[twtag=' + m.tindex + ']').attr('href', commonFn.getRelLink('news')+'/image/' + m.id + '.htm');
						}
					});
					Qfast(false, 'widgets', function() {
						K.tabs({
							id : 'fsD12',
							// 焦点图包裹id
							conId : "D1pic12",
							// ** 大图域包裹id
							tabId : "D1fBt2",
							tabTn : "a",
							conCn : '.fcon',
							// ** 大图域配置class
							auto : 1,
							// 自动播放 1或0
							effect : 'fade',
							// 效果配置
							eType : 'click',
							// ** 鼠标事件
							pageBt : true,
							// 是否有按钮切换页码
							bns : [ '.prev', '.next' ],
							// ** 前后按钮配置class
							interval : 3000
							// ** 停顿时间
						})
					});
				}
			}
		});
	}
</script>	
	



