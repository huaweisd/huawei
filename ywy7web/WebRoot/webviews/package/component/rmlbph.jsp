<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2 class="package_h2">热门礼包排行</h2>
<div id="libao_rmlbph_nr" class="package_rmlbph_nr">
	<ul class="rmlbph_ul_title">
		<li class="w40">排名</li>
	    <li class="w138">礼包名</li>
	    <li class="w70">礼包已发</li>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'tType' : 2,
			'perNumber' : 22,
			'order' : 1
        }, function(data) {
        	if(data.state) {
        		$.each(data.resultList, function(i, m){
        			$('#libao_rmlbph_nr').append('<ul><li class="w40 fs12"><span class="pm_back">'+(i+1)+'</span></li><li class="w138 ellipsis fs12"><a href="' + commonFn.getRelLink("pack") + '/package/'+m.id+'.htm" target="_blank">'+m.packageName+'</a></li><li class="w70 fs12 clf9821a">已发：'+m.scount+'</li></ul>');
        		})
        	}
        });
	})
</script>