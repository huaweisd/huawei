<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
	<div class="header_index"><a href="http://localhost">悦玩网</a></div>
	<div class="header_nav">
		<ul>
			<li><a href="#">加入收藏</a></li>
			<li>|</li>
			<li><a href="#">设为首页</a></li>
			<li>|</li>
			<li><a href="#">意见反馈</a></li>
		</ul>
	</div>
	<c:if test="${loginState != null && loginState == 1}">
		<div class="header_login">
			<ul>
				<li class="header_login_userinfo" id="info_haver">
					<img class="header_login_userinfo_img" src="${userImg }" height="20px" width="20px">
					<span>${userName }</span>
					<span style="color: rgb(153, 153, 153);"> ▼ </span>
				</li>
				<li class="login_btn"><a href="javascript:commonFn.loginOut()">[退出]</a></li>
				<c:if test="${isSign != null && isSign == 1}">
					<li class="register_btn"><a href="javascript:void(0)">已签到</a></li>
				</c:if>
				<c:if test="${isSign == null}">
					<li class="register_btn"><a href="javascript:commonFn.sign()">签到</a></li>
				</c:if>
			</ul>
			<ul class="login_info_content" id="info_content">
				<li><a href="javascript:void(0)">金币：${userMoney }</a></li>
				<li><a href="http://pack.ywy7.com/package/wdlb.htm">我的礼包</a></li>
				<li><a href="javascript:void(0)">我的信息</a></li>
				<li><a href="javascript:void(0)">修改密码</a></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${loginState == null || loginState == ''}">
		<div class="header_login">
			<ul>
				<li class="login_btn"><a href="javascript:commonFn.openLogin(true)">安全登录</a></li>
				<li class="register_btn"><a href="http://www.ywy7.com/index/register.htm">立即注册</a></li>
			</ul>
		</div>
	</c:if>
</div>