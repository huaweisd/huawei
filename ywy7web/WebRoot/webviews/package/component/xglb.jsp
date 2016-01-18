<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title fs36">相关礼包</div>
<div class="package_rmlb h676">
	<ul id="package_info_xglb"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageXGLB.do", {
			'keyName' : packageinfoParam.keyName,
			'perNumber' : 9
		}, function(data){
			$.each(data.resultList, function(i, m){
				$('#package_info_xglb').append('<li class="marb10" title="'+m.packageName+'"><img src='+commonFn.getImgUrl(m.timg)+' width="260" height="162" /><p class="package_rmlb_p"><span class="clfff">'+packageinfoFn.getPackageType(m.tType)+'</span><span class="flr"><a class="package_rmlb_a" target="_blank" href="' + commonFn.getRelLink("pack") +'package/'+m.id+'.htm">立即领取</a></span></p></li>');
			})
		})
	})
</script>