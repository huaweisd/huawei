<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-girl-wall">
	<div class="area-title">拍谁谁火</div>
	<div class="pssh_container" id="pssh_container">
		<a title="" class="girl-item girl-group-1" target="_blank" tag="1" href="#">
			<img src="" width="200" height="480">
			<p></p>
		</a> 
		<a title="" class="girl-item girl-group-2 " target="_blank" tag="2" href="#"> 
			<img src="" width="245" height="150">
			<p></p>
		</a>
		<a title="" class="girl-item girl-group-3" target="_blank" tag="3" href="#">
			<img src="" width="245" height="330">
			<p></p>
		</a>
		<a title="" class="girl-item girl-group-4" target="_blank" tag="4" href="#">
			<img src="" width="490" height="275">
			<p></p>
		</a>
		<div class="girl-group-5">
			<a title="" class="girl-item" target="_blank" tag="5" href="#"> 
				<img src="" width="245" height="205">
				<p></p>
			</a>
			<a title="" class="girl-item" target="_blank" tag="6" href="#">
				<img src="" width="245" height="205">
				<p></p>
			</a>
		</div>
		<a title="" class="girl-item girl-group-6" target="_blank" tag="7" href="#">
			<img src="" width="245" height="275">
			<p></p>
		</a>
		<a title="" class="girl-item girl-group-7" target="_blank" tag="8" href="#">
			<img src="" width="245" height="205">
			<p></p>
		</a>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexImages.do",
	     	data: {
	     		'perNumber' : 8,
				'tType' : 1
	        },
	        success: function(data) {
	        	if(data.state){
	        		$.each(data.resultList, function(i, m){
	        			var obj = $('#pssh_container').find('a[tag=' + m.tindex + ']');
	        			obj.attr('title', m.tdesc);
	        			obj.attr('href', commonFn.getRelLink('news') + '/news/psshxq/'+m.id+'.htm');
	        			obj.find('img').attr('src', commonFn.getImgUrl(m.turl));
	        			obj.find('p').html(m.tdesc);
	        		})
	        	}
	        }
		})
	})
</script>