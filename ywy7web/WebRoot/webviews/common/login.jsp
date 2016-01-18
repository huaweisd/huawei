<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="login_body" class="login_body">
	<div class="login_content">
		<div class="login_content_l">
			<ul>
				<li ggtag="26">
					<img src="webviews/common/img/login_pic.jpg" height="170" width="142">
				</li>
				<li>
					<img src="webviews/common/img/login_logo.jpg" height="86" width="142">
				</li>
			</ul>
		</div>
		<div class="login_content_r">
			<ul>
				<form method="post" id="loginForm">
					<li class="login_content_r_header">
						悦玩网登陆中心<span title="关闭" class="hidemodal login_close" onclick="commonFn.openLogin(false)">×</span>
					</li>
					<li class="fs12">悦玩网安全中心：<a href="http://www.ywy7.com">http://www.ywy7.com</a></li>
					<li>
						<input class="login_input bg_user" data-errormessage-value-missing="用户名不能为空" data-validation-engine="validate[required]" placeholder="用户名" name="loginName" id="loginName" type="text">
						<a href="index/register.htm">
							<font style="font-size: 14px; color: #F00;">注册新账号</font>
						</a>
					</li>
					<li>
						<input class="login_input bg_psw" data-errormessage-value-missing="密码不能为空" data-validation-engine="validate[required]" placeholder="密码" name="password" type="password">
						<a href="#">
							<font style="font-size: 14px; color: #2f88e2;">忘记密码？</font>
						</a>
					</li>
					<li>
						快捷登陆：
						<img src="webviews/common/img/login_icon01.jpg" height="24" width="24">
						<img class="icon_ml" src="webviews/common/img/login_icon02.jpg" height="24" width="24">
						<img class="icon_ml" src="webviews/common/img/login_icon03.jpg" height="24" width="24">
					</li>
					<li><input class="login_submit" id="loginSubmit" type="button"></li>
				</form>
			</ul>
		</div>
	</div>
</div>