<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="register_content">
	<dl>
		<dd class="register_content_pic">
			<img src="webviews/common/img/register_logo.jpg" width="410" height="210" />
		</dd>
        <dd class="register_content_txt">
        	<ul>
            	<form id="registerForm">
	            	<li>
	            		<input name="registerName" id="registerName" type="text" placeholder="用户名" data-validation-engine="validate[required,maxSize[15],ajax[ajaxUser]]" data-errormessage-value-missing="*&nbsp;用户名不能为空" class="register_form_txt" />
	            	</li>
	                <li>
	                	<input name="registerEmail" id="registerEmail" type="text" placeholder="邮箱" data-validation-engine="validate[required,custom[email]]" data-errormessage-value-missing="*&nbsp;邮箱不能为空" class="register_form_txt" />
	                </li>
	                <li>
	                	<input name="registerPassword" id="registerPassword" type="password" data-validation-engine="validate[required,minSize[6],custom[onlyLetterNumber]]" data-errormessage-value-missing="*&nbsp;密码不能为空" placeholder="密码" class="register_form_txt" />
	                </li>
	                <li>
	                	<input name="registerRePassword" id="registerRePassword" data-validation-engine="validate[required,minSize[6],custom[onlyLetterNumber]],equals[registerPassword]" data-errormessage-value-missing="*&nbsp;确认密码不能为空" type="password" placeholder="确认密码" class="register_form_txt" />
	                </li>
	                <li class="register_yzm">
	                	<input name="registerYzm" id="registerYzm" data-validation-engine="validate[required,minSize[4],custom[onlyLetterNumber]]" data-errormessage-value-missing="*&nbsp;验证码不能为空" type="text" placeholder="验证码" class="register_form_yzm">
	                	<jsp:include page="yzm.jsp"></jsp:include>
	                </li>
	                <li>
	               		<a href="javascript:registerFn.register()" id="subreg"><img src="webviews/common/img/register_btn.jpg" width="342" height="52" /></a>
	               	</li>
              	</form>
            </ul>
        </dd>
    </dl>
</div>
<div class="register_kjdl">
	<div class="register_kjdl_nr">
		<h2>快捷登陆方式：</h2>
		<ul>
			<li><a href="#"><img src="webviews/common/img/wbdl.jpg" width="280" height="71" /></a></li>
		    <li><a href="#"><img src="webviews/common/img/qqdl.jpg" width="280" height="71" /></a></li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$('#registerForm').validationEngine();
	})
</script>