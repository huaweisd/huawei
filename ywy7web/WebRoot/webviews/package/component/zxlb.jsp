<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="package_nav_ul" id="package_index_zxlb"></ul>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'tType' : 3,
			'perNumber' : 9
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#package_index_zxlb').append('<li><a target="_blank" href="' + commonFn.getRelLink("pack")+ '/package/'+m.id+'.htm"><img src="'+commonFn.getImgUrl(m.timg)+'" width="250" height="180"/><span class="package_nav_ul_span">'+m.packageName+'</span><span class="package_nav_ul_span">兑换价格：'+m.nowPrice+'N币</span><span class="package_nav_ul_span_ljlq">立即兑换</span></a></li>');
        		})
        	}
        });
	})
</script>