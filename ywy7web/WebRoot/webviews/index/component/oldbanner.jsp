<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="sixpic" class="area-girl-wall">
	<ul>
		<li class="e01" ><a class="girl-item" ><img twtag="1" src="" width="282" height="415" /></a></li>
		<!-- <li class="e02" ><a class="girl-item" ><img twtag="2" src="" width="624" height="264" /></a></li> -->
		<li class="e02 qiehuan">
			<div id="fsD12" class="focus" style=" height: 260px;  width: 630px;">
				<div id="D1pic12" class="fPic" style=" height: 260px;  width: 630px;"></div>
				<div class="fbg">
					<div class="D1fBt" id="D1fBt2">
						<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
						<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
						<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
						<a href="javascript:void(0)" hidefocus="true" target="_self" ></a>
					</div>
				</div>
				<span class="prev"></span><span class="next"></span>
			</div>
			<!-- end 三图切换 -->
		</li>
		<li class="e03" ><a class="girl-item" ><img twtag="3" src="" width="256" height="264" /></a></li>
		<li class="e04" ><a class="girl-item" ><img twtag="4" src="" width="290" height="143" /></a></li>
		<li class="e05" ><a class="girl-item" ><img twtag="5" src="" width="290" height="143" /></a></li>
		<li class="e06" ><a class="girl-item" ><img twtag="6" src="" width="290" height="143" /></a></li>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
			data: {"tType": 3, "tindex": 2, "order": "T_URL desc"},// 临时解决方案，之后需要增加排序字段
			url: "http://boss.ywy7.com/tms/index/querytImages.do",
			success: function(msg) {
				$("#D1pic12").empty();
				$.each(msg, function(i, m) {
					if( m.tindex == 2){
						if($(".fcon","#D1pic12").length < 4){
							$("#D1pic12").append('<div class="fcon" style="display: none;"><a href="tw_info.htm?id='+m.id+'"><img src='+m.turl+' style="opacity: 1; height:260px;  width:630px;"></a><span class="shadow"><span style="width:465px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><a href="javascript:void(0)" style:"overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">'+m.tdesc+'</a></span></span></div>');
				        }
					}else{
						$("img[twtag="+m.tindex+"]").attr({src:m.turl,tid:m.id,tag:"tw_info.htm?id="+m.id}).bind("click", function() {
							location.href = $(this).attr('tag');
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
	    });
	})
</script>