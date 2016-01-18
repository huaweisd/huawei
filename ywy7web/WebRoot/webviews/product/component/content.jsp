<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(document).ready(function (){
		$("iframe")[0].height = 0;
		$("iframe")[0].width = "800px";
		$("iframe")[0].contentWindow.document.write($("iframe").text());
		$("iframe")[0].contentWindow.document.close();
		$("iframe")[0].height = $("iframe")[0].contentWindow.document.body.scrollHeight;
		console.log('${content}');
		Qfast(false, 'widgets',
			function() {
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
			}
		);
	});
</script>
<div class="pd-content">
	<h2>基础信息</h2>
	<div style="border:1px solid #ccc;margin-top:10px;">
		<div class="qrode-content">
			<span style="margin-right: 90px;">
				Android<br/>
				<img id="androidPic" src="${fn:replace(content.APIC, '..', 'http://www.ywy7.com')}"  height="130px" width="130px"/>
			</span>
			<span>
				IOS<br/>
				<img id="iosPic" src="${fn:replace(content.IPIC, '..', 'http://www.ywy7.com')}"  style="" height="130px" width="130px"/>
			</span>
		</div>
		<iframe frameborder="0" scrolling="no">
			${content.gameDesc }
		</iframe>
		<div  style="postion:relative;width:100%;height:405px;bottom:0px;">
			<div style="position: absolute ;left:50%">
				<div id="fsD12" class="focus" style=" height: 405px;  width: 580px;left:-50%;">
					<div id="D1pic12" class="fPic" style=" height: 405px;  width: 580px;">
						<div class="fcon" style="display: none;">
							<img src="${fn:replace(content.IMG_A, '..', 'http://www.ywy7.com')}" style="opacity: 1; height:405px !important;  width:580px !important;">
							<span class="shadow">
								<a href="javascript:">游戏截图</a>
							</span>
						</div>
						<div class="fcon" style="display: none;">
							<img src="${fn:replace(content.IMG_B, '..', 'http://www.ywy7.com')}" style="opacity: 1; height:405px !important;  width:580px !important;">
							<span class="shadow">
								<a href="javascript:">游戏截图</a>
							</span>
						</div>
						<div class="fcon" style="display: none;">
							<img src="${fn:replace(content.IMG_C, '..', 'http://www.ywy7.com')}" style="opacity: 1; height:405px !important;  width:580px !important;">
							<span class="shadow">
								<a href="javascript:">游戏截图</a>
							</span>
						</div>
						<div class="fcon" style="display: none;">
							<img src="${fn:replace(content.IMG_D, '..', 'http://www.ywy7.com')}" style="opacity: 1; height:405px !important;  width:580px !important;">
							<span class="shadow">
								<a href="javascript:">游戏截图</a>
							</span>
						</div>
						<div class="fcon" style="display: none;">
							<img src="${fn:replace(content.IMG_E, '..', 'http://www.ywy7.com')}" style="opacity: 1; height:405px !important;  width:580px !important;">
							<span class="shadow">
								<a href="javascript:">游戏截图</a>
							</span>
						</div>
					</div>
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
			</div>
		</div>
	</div>
</div>

