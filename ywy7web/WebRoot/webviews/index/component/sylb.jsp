<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title">手游礼包</div>
<div class="more second" title="更多"><a href="http://pack.ywy7.com">...</a></div>
<div class="main2_right_package">
	<div class="main2_right_package_nav">
		<ul>
			<li data-type="1" id="lb0" class="xx on">推荐礼包</li>
			<li class="fg">|</li>
			<li data-type="2" id="lb1" class="xx">最热礼包</li>
			<li class="fg">|</li>
			<li data-type="4" id="lb2" class="xx">特约礼包</li>
			<li class="fg">|</li>
			<li data-type="3" id="lb3" class="xx">最新礼包</li>
		</ul>
	</div>
	<div class="main2_right_package_content">
		<ul>
			<li>
				<div id="main2_right_package_content_0" class="package_l"></div>
				<div id="main2_right_package_content_1" class="package_r"></div>
			</li>
			<li>
				<div id="main2_right_package_content_2" class="package_l"></div>
				<div id="main2_right_package_content_3" class="package_r"></div>
			</li>
			<li>
				<div id="main2_right_package_content_4" class="package_l"></div>
				<div id="main2_right_package_content_5" class="package_r"></div>
			</li>
			<li>
				<div id="main2_right_package_content_6" class="package_l"></div>
				<div id="main2_right_package_content_7" class="package_r"></div>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexPackage.do",
	     	data: {
				'perNumber' : 8,
				'tType' : 1
	        },
	        success: function(data) {
	        	if(data.state) {
	        		$.each(data.resultList, function(i, m){
	        			var pot = m.tsystem == 2 ? '<img src="webviews/common/img/lb_pot01.jpg" width="14" height="14" />' : m.tsystem == 3 ? '<img src="webviews/common/img/lb_pot02.jpg" width="14" height="14" />' : '';
	        			var lbClass = m.tcount - m.scount > 0 ? 'lb_on' : 'lb_off';
	        			var lbDisable = m.tcount - m.scount > 0 ? '' : 'disable';
	        			$('#main2_right_package_content_' + i).attr('title', m.packageName).append('<img src="'+commonFn.getImgUrl(m.timg)+'" width="192" height="108" /><span class="lb_name">'+m.packageName+'</span><span>已领取：'+m.scount+'个</span><span>剩余数：'+(m.tcount-m.scount)+'个</span><span style="width:72px;">平台：'+pot+'</span><a href="javascript:void(0)" data-url="'+commonFn.getRelLink('pack')+'/package/'+m.id+'.htm" class="'+lbClass+'" onclick="indexFn.checkClick($(this))">领取</a>');
	        		})
	        	}
	        }
		})
	})
</script>