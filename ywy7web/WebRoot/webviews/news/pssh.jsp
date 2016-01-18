<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript">
		String.prototype.format=function(){
			if(arguments.length==0) return this;
				for(var s=this, i=0; i<arguments.length; i++)
		    		s=s.replace(new RegExp("\\{"+i+"\\}","g"), arguments[i]);
  			return s;
		};

		Namespace.register("com.lz.yh.pssh");
		
		com.lz.yh.pssh.fn = function (){
			this.getImages = function (){
				var nodeStr = 
				"<a href='{6}'>"
					+"<li>"
							+"<img width='250' height='210' src='{0}' />"
						+"<p>"
							+"<span class='fll'>{1}</span>"
							+"<span class='flr'>{2}</span>"
						+"</p>"
						+"<p>"
							+"<span class='fll'>{3}</span>"
							+"<span class='flr'>{4}</span>"
						+"</p>"
						+"<p>"
							+"<span class='fll'>{5}</span>"
						+"</p>"
					+"</li>"
				+"</a>";
				$.post("/news/getPssh.htm",{tType:1},function (data){
					$.each(data,function (k,v){
						$(".rwzx-content").append(nodeStr.format(commonFn.getImgUrl(v.turl)
								,"姓名 : " + v.tdesc 
								,"年龄 : " + (v.tage?v.tage:"未知")
								,"身高 : " + (v.theight?v.theight:"未知")
								,"体重 : " + (v.tweight?v.tweight:"未知")
								,"三维 : " + (v.tmeasure?v.tmeasure:"未知")
								, commonFn.getRelLink("news") +"/news/psshxq/"+v.id+".htm"));
					});
				});
				
			};
		};
		
		var psshFn = new com.lz.yh.pssh.fn();
		
		$(function (){
			psshFn.getImages();
		});
		
	</script>
	<style type="text/css">
		
	</style>
</head>
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/logo.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>
		<div class="w1180 marb10">
			<div class="rwzx-body">
				<ul class="rwzx-content clearfix">
					
				</ul>
			</div>
		</div>
		<div class="common_bottom">
			<jsp:include page="../common/friendLink.jsp"></jsp:include>
			<jsp:include page="../common/copyRight.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>