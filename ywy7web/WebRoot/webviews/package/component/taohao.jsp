<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="taohaoDiv" class="taohao_div">
	<div class="taohao_div_contentA">
		<div class="taohao_div_contentB">
			<div class="taohao_div_content_title">
				<span >淘号成功</span>
				<a class="aui_close" href="javascript:packageinfoFn.closeTaohaoDiv()">×</a>
			</div>
			<div class="taohao_div_content_content">
				<div class="taohao_div_content_content_t">淘号成功！快激活试试，看人品爆发了没~~</div>
				<div class="taohao_div_content_content_m">
					<span>账号：</span><input id="taohaoCode" class="style-input" type="text" value="" />
					<input type="button" class="copyit" value="复制" onclick="commonFn.copyToClipboard($('#taohaoCode').val())"/>
				</div>
				<div class="taohao_div_content_content_b">
					<input class="taohaoAgain" type="button" value="再淘一次" onclick="packageinfoFn.taohaoAgain()"/>
					<input id="copyCode" type="hidden"/>
				</div>
			</div>
		</div>
	</div>
</div>