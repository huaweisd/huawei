<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="area-title fs36">游戏相关</div>
<div class="lblq_content w278 fs12">
	<dl id="package_yxxg"></dl>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageTProducts.do", {
			'keyName' : packageinfoParam.keyName
		}, function(data){
			if(data.state){
				var m = data.obj;
				$('#package_yxxg').append('<dt class="lblq_content_title">'+m.gameName+'游戏信息</dt><dd class="yxxg_content_dd1"><img src="'+commonFn.getImgUrl(m.gameImg)+'" height="85" width="85"></dd><dd class="yxxg_content_dd2">当前版本：'+m.bbh+' <br>游戏类型：'+m.tType+'<br>系统：'+m.runOs+'</dd><dd class="yxxg_content_dd3">开发商：'+m.kfs+' <br>大小：'+m.fileSize+'<br>游戏简介：<br>'+$._ffsize($._removeHTMLTag(m.gameDesc), 70)+'</dd><dd class="yxxg_content_dd4 fs18"><a target="_blank" href="' + commonFn.getRelLink("ku") + '/product/'+m.id+'.htm"><span>游戏专区</span></a></dd>')
			}
		})
	})
</script>
<div class="area-title fs36">最新发号</div>
<div class="lblq_content w278 fs12">
	<ul class="zxfh_list" id="zxfh_list"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'perNumber' : 4
		}, function(data){
			if(data.state){
				$.each(data.resultList, function(i, m){
					$('#zxfh_list').append('<li><a target="_blank" href= "' + commonFn.getRelLink("pack") + "/package/'+m.id+'.htm" + '"><span>抢礼包</span></a>'+m.packageName+'</li>');
				})
			}
		})
	})
</script>
<div class="area-title fs36">大家都在抢</div>
<div id="libao_djdzq_nr" class="package_rmlbph_nr w278 h350">
	<ul class="rmlbph_ul_title">
		<li class="w40">排名</li>
	    <li class="w158">礼包名</li>
	    <li class="w80">礼包已发</li>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("package/getPackageInfo.do", {
			'perNumber' : 8,
			'order' : 1
		}, function(data){
			if(data.state){
				$.each(data.resultList, function(i, m){
					if(i<3){
						$('#libao_djdzq_nr').append('<ul><li class="w40"><span class="pm_back fwb">'+(i+1)+'</span></li><li class="w158 ellipsis"><a href="' + commonFn.getRelLink("pack") + "/package/'+m.id+'.htm" +  '" target="_blank">'+m.packageName+'</a></li><li class="w80 clf9821a">已发：'+m.scount+'</li></ul>');
					}else{
						$('#libao_djdzq_nr').append('<ul><li class="w40"><span class="fwb">'+(i+1)+'</span></li><li class="w158 ellipsis"><a href="' + commonFn.getRelLink("pack") + "/package/'+m.id+'.htm" +  '" target="_blank">'+m.packageName+'</a></li><li class="w80 clf9821a">已发：'+m.scount+'</li></ul>');
					}
				})
			}
		})
	})
</script>
<div class="area-title fs36">相关新闻</div>
<div class="video_content_rmzx_nr w278 h315">
	<ul id="xgxw_list"></ul>
</div>
<script type="text/javascript">
	$(function(){
		$._post("video/getVideoNews.do", {
			'perNumber' : 6,
			'gameName' : packageinfoParam.keyName
		}, function(data){
			if(data.state){
				$.each(data.resultList, function(i, m){
					$('#xgxw_list').append('<li class="list w268"><a title="'+m.title+'" target="_blank" href="' + commonFn.getRelLink("news")  + "news/'+m.id+'.htm" + '">'+m.title+'</a></li>');
				})
			}
		})
	})
</script>
