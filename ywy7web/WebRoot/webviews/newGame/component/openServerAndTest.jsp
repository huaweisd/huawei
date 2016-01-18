<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="kfcsb">
	<ul class="tabkfcsb">
		<li class="current">新游开测表</li>
		<li>新游开服表</li>
		<li>单机上架表</li>
	</ul>
	<div class="contentkfcsb">
		<ul style="display: block;">
			<div class="m-table ">
				<table class="m-table-con">
					<thead class="m-title-hd">
						<tr>
							<th class="t1">时间</th>
							<th class="t2">名称</th>
							<th class="t3">类型</th>
							<th class="t4">系统</th>
							<th class="t6">运营商</th>
							<th class="t7">礼包</th>
							<th class="t9">专区</th>
						</tr>
					</thead>
					<tbody class="m-table-bd today_kc_list">
					</tbody>
				</table>
				<div class="r-top">最近开测</div>
			</div>
		</ul>
		<ul>
	    	<div class="m-table ">
				<table class="m-table-con">
					<thead class="m-title-hd">
						<tr>
							<th class="t1">时间</th>
							<th class="t2">名称</th>
							<th class="t3">类型</th>
							<th class="t4">系统</th>
							<th class="t6">开服名称</th>
							<th class="t7">礼包</th>
							<th class="t9">专区</th>
						</tr>
					</thead>
					<tbody class="m-table-bd today_kf_list">
					</tbody>
				</table>
				<div class="r-top">最近开服</div>
			</div>
		</ul>
		<ul>
	   		<div class="m-table ">
				<table class="m-table-con">
					<thead class="m-title-hd">
						<tr>
							<th class="t1">时间</th>
							<th class="t2">名称</th>
							<th class="t3">类型</th>
							<th class="t4">系统</th>
							<th class="t6">运营商</th>
							<th class="t7">礼包</th>
							<th class="t9">专区</th>
						</tr>
					</thead>
					<tbody class="m-table-bd today_dj_list">
					</tbody>
				</table>
				<div class="r-top">单机上架</div>
			</div>
		</ul>
	</div>
</div>			
<script type="text/javascript">
	$(function(){
		//切换
		QieHuan();
		//新游开测
		XYKC();
		//新游开服
		XYKF();
		//单机上架
		DJSJ();
		
	});

	function QieHuan(){
		$(".tabkfcsb li").click(function() {
			$(".contentkfcsb ul").hide().eq($(".tabkfcsb li").removeClass().index($(this).addClass("current"))).show();
		});
	}

	function XYKC(){
 		$.ajax({
			type: "POST",
			url: "newGame/getGameOpenTest.do",
			data:{
				"perNumber": 10
			},
			success: function(data) {	   
				$.each(data.resultList, function(i,n) {
			   		$(".today_kc_list").append('<tr><td class="tl"><span class="time" style="line-height: 25px;">'+n.prodTestTimeStr.substring(0, 11)+'</span></td><td class="tl" style="text-align:left;"><a class="imglink" target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.gameImg)+' alt='+n.gameName+'>'+n.gameName+'</a></td><td >'+commonFn._getGameType(n.gameType)+'</td><td>'+commonFn._getOs(n.gameSys)+'</td><td>'+n.operators+'</td><td><a class="bag-btn" target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+n.id+'_1.htm">礼包专区</a></td><td><a class="ent-btn" target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">进入</a></td></tr>  ');
				});
			}
		});
	}
			
	function XYKF(){
		$.ajax({
			type: "POST",
			url: "newGame/getGameOpenServer.do",
			data:{
				"perNumber": 10
			},
			success: function(data) {			   
				$.each(data.resultList, function(i,n) {
			   		$(".today_kf_list").append('<tr><td class="tl"><span class="time" style="line-height: 25px;">'+n.openTimeStr.substring(0, 11)+'</span></td><td class="tl" style="text-align:left;"><a class="imglink" target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.gameImg)+' alt='+n.gameName+'>'+n.gameName+'</a></td><td >'+commonFn._getGameType(n.gameType)+'</td><td>'+commonFn._getOs(n.gameSys)+'</td><td>'+n.gameArea+'</td><td><a class="bag-btn" target="_blank" href="'+commonFn.getRelLink('pack')+'/package/'+n.id+'_1.htm">礼包专区</a> </td><td><a class="ent-btn" target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm">进入</a></td></tr>  ');
				});
			}
		});
	}	
	
	
	function DJSJ(){
		$.ajax({
			type: "POST",
			url: "newGame/getGamesByGroup.do",
			data:{
				"tGroup":2,
				"perNumber": 10,
				"startRecordNum":0
			},
			success: function(data) {			   
				$.each(data.resultList, function(i,n) {
			   		$(".today_dj_list").append('<tr><td class="tl"><span class="time" style="line-height: 25px;">'+n.startTimeStr.substring(0, 11)+'</span></td><td class="tl" style="text-align:left;"><a class="imglink" target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm"><img src='+commonFn.getImgUrl(n.gameImg)+' alt='+n.gameName+'>'+n.gameName+'</a></td><td >'+commonFn._getGameType(n.gameType)+'</td><td>'+commonFn._getOs(n.gameSys)+'</td><td>'+n.opeartors+'</td><td><a class="bag-btn" target="_blank" href="'+commonFn.getRelLink('news')+'/package/'+n.id+'.htm">礼包专区</a> </td><td><a class="ent-btn" target="_blank" href="'+commonFn.getRelLink('ku')+'/product/'+n.id+'.htm" >进入</a></td></tr>  ');
				});
			}
		});
	}
</script>	
	



