<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul id="video_banner">
	<li class="a01" tag="1">
		<a class="girl-item" href="#" target="_blank">
			<img src="" height="374" width="558">
			<p class="w558"></p>
		</a>
	</li>
	<li class="a02" tag="2">
		<a class="girl-item" href="#" target="_blank">
			<img src="" height="180" width="300">
			<p class="w264"></p>
		</a>
	</li>
	<li class="a03" tag="3">
		<a class="girl-item" href="#" target="_blank">
			<img src="" height="180" width="300">
			<p class="w264"></p>
		</a>
	</li>
	<li class="a04" tag="4">
		<a class="girl-item" href="#" target="_blank">
			<img src="" height="180" width="300">
			<p class="w264"></p>
		</a>
	</li>
	<li class="a05" tag="5">
		<a class="girl-item" href="#" target="_blank">
			<img src="" height="180" width="300">
			<p class="w264"></p>
		</a>
	</li>
</ul>
<script type="text/javascript">
	$(function(){
		$._post("video/getVideoImages.do", {
			'tType' : 11
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			var obj = $('#video_banner').find('li[tag = ' + m.tindex + ']').find('a');
        			obj.find('img').attr('src', commonFn.getImgUrl(m.turl));
        			obj.find('p').html(m.tdesc);
        			obj.attr('href', ''+ commonFn.getRelLink("news") + '/image/'+m.id+'.htm');
        		})
        	}
        });
	})
</script>