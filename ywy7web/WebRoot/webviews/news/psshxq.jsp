<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common.jsp" />
	<script type="text/javascript" src="/webviews/common/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/webviews/common/js/jquery.galleryview-1.1.js"></script>
	<script type="text/javascript" src="/webviews/common/js/jquery.timers-1.1.2.js"></script>
	<script type="text/javascript" src="/webviews/common/js/jquery.bxCarousel.js"></script>
	<script type="text/javascript">
		Namespace.register("com.lz.yh.psshxq.fn");
		
		$(function (){
			psshxqFn.getImages();
		});
		
		com.lz.yh.psshxq.fn = function (){
			this.getImages = function (){
				$.post("/news/getPsshxq.htm",{"tTypeId":"${tTypeId}"},function (data){
					for(var i in data){
						$("#panel")
							.append($('<li><img width="180" height="130" src=' + commonFn.getImgUrl(data[i].T_URL) + ' /></li>'));
					}
					$("#pssh-show-img").attr("src",commonFn.getImgUrl(data[0].T_URL));
					if(data.length > 4){
						$('#panel').bxCarousel({ 
							display_num: 4, // number of elements to be visible 
							move: 1, // number of elements to the shift the slides 
							//speed: 500, // number in milliseconds it takes to finish slide animation 
							margin:5, // right margin to be applied to each <li> element (in pixels, although do not include "px") 
							//auto: false, // automatically play slides without a user click 
							//auto_interval: 2000, // the amount of time in milliseconds between each auto animation 
							//auto_dir: 'next', // direction of auto slideshow (options: 'next', 'prev') 
							//auto_hover: false, // determines if the slideshow will stop when user hovers over slideshow 
							//next_text: 'next', // text to be used for the 'next' control 
							next_image: 'webviews/common/img/fwwd_right_tp_r.png', // image to be used for the 'next' control 
							//prev_text: 'prev', // text to be used for the 'prev' control 
							prev_image: 'webviews/common/img/fwwd_right_tp_l.png', // image to be used for the 'prev' control 
							controls: true, // determines if controls will be displayed
							ulWidth:735
						}); 
					}
					$("#panel").click(function (evt){
						console.log(evt);
						if(evt.srcElement.localName != "img"){
							return;
						}
						console.log(evt.srcElement.src);
						$("#pssh-show-img").attr("src",evt.srcElement.src);
						/* if(evt.srcElement.localName == "img"){
							/* $(evt.srcElement).unbind("click");
							$(evt.srcElement).bind("click",function (sevt){
								$("#pssh-show-img").attr("src",this.src);
								sevt.stopPropagation();
							});
							$(evt.srcElement).trigger("click");
						} */
					});
				});
			};
		};
		
		var psshxqFn = new com.lz.yh.psshxq.fn();
	</script>
	<style type="text/css">
		.pssh-show{width:735px;height:500px;outline:0 !important;text-align:center;}
		.pssh-show img{margin-top: 10px;}
		.pssh-border{width:735px;height:640px;border:1px solid #ccc;margin:0px auto;}
		.prev{position:absolute;top:30px;left:-21px;z-index: 999;}
		.next{position:absolute;top:30px;right:-21px;z-index: 999;}
		.bx_wrap{position:relative;}
		.bx_wrap:after{clear:both;display: block;content:"";}
		.bx_container{float:left;width:735px;overflow: hidden;}
	</style>
</head>
<body>
	<jsp:include page="../common/login.jsp"></jsp:include>
	<div class="bg">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/logo.jsp"></jsp:include>
		<jsp:include page="../common/nav.jsp"></jsp:include>
		<div class="pssh-border marb10">
			<div class="pssh-show marb10">
				<img id="pssh-show-img" height="480" src="" style="max-width: 680px;">
			</div>
			<div>
				<ul id="panel" class="galleryview" style="float:left">
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