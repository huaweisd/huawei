<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2 class="package_h2">热门礼包<span class="package_more"><a href="http://pack.ywy7.com/package/rmlb.htm">更多&gt;&gt;</a></span></h2>
<div class="package_rmlb w294">
	<ul id="package_index_rmlb"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'tType' : 2,
			'perNumber' : 3
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#package_index_rmlb').append('<li title="'+m.gameName+'"><img src='+commonFn.getImgUrl(m.timg)+' width="270" height="162" /><p class="package_rmlb_p"><span class="clfff">热门礼包</span><span class="flr"><a class="package_rmlb_a" target="_blank" href="' + commonFn.getRelLink("pack") + '/package/'+m.id+'.htm">立即领取</a></span></p></li>');
        		})
        	}
        });
	})
</script>