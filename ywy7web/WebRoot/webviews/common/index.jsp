<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		Namespace.register("com.lz.yh.register");
		// fn存放该页面定义方法
		com.lz.yh.register.fn = function() {
			this.register = function(){
				$._post('index/registerNewUser.do', {
					'loginName' : $('#registerName').val(),
					'email' : $('#registerEmail').val(),
					'password' : $('#registerPassword').val(),
					'repassword' : $('#registerRePassword').val(),
					'yzm' : $('#registerYzm').val()
				}, function(data){
					if(data.state){
						window.location.href = commonFn.getRelLink('www');
					}else{
						$('#subreg').validationEngine('showPrompt', data.msg, 'error');
					}
				});
			}
		}
		// param存放该页面定义对象
		com.lz.yh.register.param = function() {
			
		}
		
		var registerParam = new com.lz.yh.register.param();
		var registerFn = new com.lz.yh.register.fn();
		
		$(function(){
			
		})
	</script>
</head>
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/register.jsp"></jsp:include>
	</div>
</body>
</html>