<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2 class="package_h2">特价礼包<span class="package_more"><a href="http://pack.ywy7.com/package/tjlb.htm">更多&gt;&gt;</a></span></h2>
<div class="package_rmlb w855">
	<ul id="package_index_tjlb" class="package_tjlb_ul"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'tType' : 4,
			'perNumber' : 4
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#package_index_tjlb').append('<div class="package_tjlb_ul_div"><img src='+(m.imgB==null||m.imgB==undefined?commonFn.getImgUrl(m.timg):commonFn.getImgUrl(m.imgB))+' width="350" height="270" /></a><a class="ms_a"><span class="fs18">秒杀价</span>'+m.nowPrice+'N币</a><a class="lq_a" target="_blank" href="' + commonFn.getRelLink("pack") +'package/'+m.id+'.htm">立即兑换</a></div>');
        		})
        	}
        });
	})
</script>