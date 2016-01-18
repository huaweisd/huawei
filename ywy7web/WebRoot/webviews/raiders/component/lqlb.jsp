<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="info_r_yxzx_title">领取礼包</div>
<div class="info_r_yxzx_list w328">
	<div class="info_r_yxzx_list_div" id="kjdh_list">
		<dl id="lqlb_list"></dl>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'perNumber' : 5
		}, function(data){
			$.each(data.resultList, function(i, m){
				if(i==0){
					$('#lqlb_list').append('<dd class="info_r_kjdh_list_1"><span class="info_r_kjdh_list_1_title ellipsis">'+m.packageName+'</span><img src="'+commonFn.getImgUrl(m.timg)+'" width="140" height="105" /><span><p>系统：'+commonFn.getSystem(m.tsystem)+'</p><p>剩余：'+(m.tcount-m.scount)+'</p><span class="info_r_kjdh_list_1_btn"><a class="fs14 clfff" href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm" target="_blank">怒领</a></span></span></dd>')
				}else{
					$('#lqlb_list').append('<dd class="info_r_yxzx_list_3 ellipsis"><a href="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm" target="_blank">'+m.packageName+'</a></dd>');
				}
			})
		});
	})
</script>