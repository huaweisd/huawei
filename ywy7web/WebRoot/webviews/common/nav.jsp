<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content_nav">
	<c:if test="${nav == 'index'}">
		<ul id="nav">
			<li id="nav0" class="nav_btn" data-url="http://www.hwtest.com">首页</li>
			<li id="nav1" class="nav_btn" data-url="http://xy.hwtest.com">新游</li>
			<li id="nav2" class="nav_btn" data-url="http://gl.hwtest.com">攻略</li>
			<li id="nav3" class="nav_btn" data-url="http://pack.hwtest.com">礼包</li>
			<li id="nav4" class="nav_btn" data-url="http://newswtest.com">资讯</li>
			<li id="nav5" class="nav_btn" data-url="http://www.hwtest.com/rank.htm">排行</li>
			<li id="nav6" class="nav_btn" data-url="http://area.hwtest.com">专区</li>
			<li id="nav7" class="nav_btn" data-url="http://v.hwtest.com">视频</li>
			<li id="nav8" class="nav_btn" data-url="#">社区</li>
		</ul>
	</c:if>
	<c:if test="${nav == 'sp'}">
		<ul id="nav">
			<li id="nav0" class="nav_btn nav_btn_o" data-url="/">视频首页</li>
			<li id="nav1" class="nav_btn nav_btn_o" data-url="/video/swpc.htm">试玩评测</li>
			<li id="nav2" class="nav_btn nav_btn_o" data-url="/video/yxsp.htm">游戏视频</li>
			<li id="nav3" class="nav_btn nav_btn_o" data-url="/video/xyfb.htm">新游发布</li>
		</ul>
	</c:if>
	<c:if test="${nav == 'zx'}">
		<ul id="nav">
			<li id="nav0" class="nav_btn nav_btn_o" data-url="/">资讯首页</li>
			<li id="nav1" class="nav_btn nav_btn_o" data-url="/news/sypc.htm">手游评测</li>
			<li id="nav2" class="nav_btn nav_btn_o" data-url="/news/ynzx.htm">业内资讯</li>
			<li id="nav3" class="nav_btn nav_btn_o" data-url="/news/rwzf.htm">人物专访</li>
			<li id="nav4" class="nav_btn nav_btn_o" data-url="/news/pssh.htm">拍谁谁火</li>
		</ul>
	</c:if>
	<c:if test="${nav == 'lb'}">
		<ul id="nav">
			<li id="nav0" class="nav_btn nav_btn_o" data-url="/">礼包首页</li>
			<li id="nav1" class="nav_btn nav_btn_o" data-url="/package/rmlb.htm">热门礼包</li>
			<li id="nav2" class="nav_btn nav_btn_o" data-url="/package/tjlb.htm">特价礼包</li>
			<li id="nav3" class="nav_btn nav_btn_o" data-url="/package/djlb.htm">独家礼包</li>
			<li id="nav4" class="nav_btn nav_btn_o" data-url="/package/wdlb.htm">我的礼包</li>
			<li id="nav5" class="nav_btn nav_btn_o" data-url="#">活动社区</li>
		</ul>
	</c:if>
	<c:if test="${nav == 'gl'}">
		<ul id="nav">
			<li id="nav0" class="nav_btn nav_btn_o" data-url="/">攻略首页</li>
			<li id="nav1" class="nav_btn nav_btn_o" data-url="/raiders/twgl.htm">图文攻略</li>
			<li id="nav2" class="nav_btn nav_btn_o" data-url="/raiders/spgl.htm">视频攻略</li>
			<li id="nav3" class="nav_btn nav_btn_o" data-url="http://area.hwtest.com">游戏专区</li>
		</ul>
	</c:if>
	<c:if test="${nav == 'xy'}">
		<ul id="nav">
			<li id="nav0" class="nav_btn nav_btn_o" data-url="http://xy.hwtest.com">新游首页</li>
			<li id="nav1" class="nav_btn nav_btn_o" data-url="http://ku.hwtest.com">找游戏</li>
			<li id="nav2" class="nav_btn nav_btn_o" data-url="http://xy.hwtest.com/newGame/kfkc.htm">开服测试表</li>
			<li id="nav3" class="nav_btn nav_btn_o" data-url="http://pack.hwtest.com">礼包发号</li>
			<li id="nav4" class="nav_btn nav_btn_o" data-url="http://xy.hwtest.com/newGame/xypc.htm">新游评测</li>
		</ul>
	</c:if>
</div>