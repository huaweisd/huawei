<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../common/common.jsp" />
<script type="text/javascript">
Namespace.register("com.lz.yh.search");
com.lz.yh.search.param = function (){
	this.pageIndex = ${requestScope.msg.curPage};
	this.recordCount = ${requestScope.msg.countNum};
	this.pageCount = parseInt((${requestScope.msg.countNum}-1) / 10 + 1);
};
com.lz.yh.search.fn = function (param){
	this.toPage = function (pageIndex){
		var turnForm = document.createElement("form");   
		 //一定要加入到body中！！   
		document.body.appendChild(turnForm);
		turnForm.method = 'post';
		turnForm.action = window.location.href;
		turnForm.target = '_self';
					  //创建隐藏表单
		var newElement = document.createElement("input");
		newElement.setAttribute("name","pageIndex");
		newElement.setAttribute("type","hidden");
		newElement.setAttribute("value",pageIndex);
		turnForm.appendChild(newElement);
		turnForm.submit();
	};
	this.createPageBtn = function (){
		var thisObj = this;
		/* var showHeadEllipsis = false ; //是否显示头部省略号
		var showTailEllipsis = false; //是否显示尾部省略号
		if(param.pageIndex - 4 > 0){ //显示 ... 2 3 4 5
			showHeadEllipsis = true;
		}
		if(param.pageIndex + 4 < pageCount){ //显示  2 3 4 5 ...
			showTailEllipsis = true;
		}
		if(showHeadEllipsis){
			var btn = "";
			if(showHeadEllipsis){
				btn += "<span>...<span>";
			}
			
		} */
		$(".search-page").append("<span class=\"toIndex\">首页</span><span class=\"prevPage\">上一页</span><span class=\"pageNext\">下一页</span><span class=\"toTail\">尾页</span>");
		var btn = "";
		var start = param.pageIndex - 3 < 1 ? 1 : param.pageIndex - 3;
		var end = param.pageIndex + 3 > param.pageCount ? param.pageCount + 1 : start + 7;
		for(var i = start
				;i < end
				;i++){
			
			if(i == param.pageIndex){
				btn += "<span class='page' style='color:red;background-color:white'>" + i +"</span>";
				continue;
			}
			btn += "<span class='page'>" + i +"</span>";
		};
		$(".prevPage").after(btn);
		$(".toIndex").bind("click",function (){
			//alert(1);
			thisObj.toPage(1);
		});
		/* $(".toIndex").click(function (){
			alert(2);
			//thisObj.toPage(1);
		}); */
		$(".toTail").click(function (){
			thisObj.toPage(param.pageCount);
		});
		$(".nextPage").click(function (){
			thisObj.toPage(param.pageIndex+1);
		});
		$(".prevPage").click(function (){
			thisObj.toPage(param.pageIndex-1);
		});
		$(".page").click(function (){
			thisObj.toPage($(this).html());
		});
	};
};
var searchParam = new com.lz.yh.search.param();
var searchFn = new com.lz.yh.search.fn(searchParam);
$(document).ready(function (){
	searchFn.createPageBtn();
});
</script>
<style type="text/css">
	.search-nav{clear:both;width:100%;border-top: 1px solid #cdcdcd;background-color: #f6f6f6;	/*height:50px;*/}
	.search-nav ul:after{content:"";display:block;clear:both;}
	ul,li{margin:0px;padding:0px;list-style:none;}
	.search-nav-btns{width:1180px;margin:0px auto;}
	.search-nav-btns li{font-size:18px;}
	.search-nav-btns li a{line-height:50px;padding:0 20px;display:block;border-bottom: 2px solid #f6f6f6;}
	.search-nav-btns li a:hover{border-bottom: 2px solid #f28216;}
	.search-result{width:1180px;margin:20px auto;}
	.search-result:after{content:"";display:block;clear:both;}
	.search-result-left{width:836px;}
	.search-result-count{background-color:#efefef;}
	.search-result-item{position:relative;padding:20px 0;border-bottom:1px dashed #ccc;}
	.search-result-item:after{content:"";display:block;clear:both;}
	.search-result-item dt,.search-result-item dd{float:left;margin:0px;padding:0px;}
	.search-result-item dd{margin-left:10px;}
	.search-content{word-wrap:break-word;color:rgb(100,100,100);font-size:12px;}
	.search-page{margin:20px auto;position:relative;text-align:center;width:100%;}
	.search-page:after{content:"";display:block;clear:both;}
	.search-page span{display:inline-block;line-height:30px;padding:0 8px;background-color:#ccc;cursor: pointer;margin-left:8px;
	}
</style>
</head>

<body style="background:none; background-color:#FFF;">
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/logo.jsp"></jsp:include>
	</div>
	 <div class="search-nav">
	 	<ul class="search-nav-btns">
	 		<li><a>全部</a></li>
	 	</ul>
	</div>
	<div class="search-result">
		<div class="search-result-left">
			<div class="search-result-count">
				<span style="padding-right:10px;font-size:14px;line-height:100%;background-color: white">为您找到的结果约为<span style="color:red;">${requestScope.msg.countNum }</span>个</span>
			</div>
			<div class="search-result-content">
				<c:forEach items="${requestScope.msg.result }" var="i" >
					<a href="${i.link }">
						<dl class="search-result-item">
							<dd>${i.title }</dd><br/> 
							<dd class="search-content">${i.content }</dd>
						</dl>
					</a>
				</c:forEach>
			</div>
			<div class="search-page">
				 
			</div>
		</div>
	</div>
	<jsp:include page="../common/friendLink.jsp"></jsp:include>
	<jsp:include page="../common/copyRight.jsp"></jsp:include>
</body>
</html>
