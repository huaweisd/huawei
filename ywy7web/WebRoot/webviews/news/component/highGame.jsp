<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="zx_gqgd_hdrl_yjrw">
	<div class="zx_gqgd">
		<h2>悦玩光点</h2>
		<div class="zx_gqgd_nr"></div>
	</div>
	<div ggtag="3" style="margin:10px 0px;">

		<div id="advertB" data-type="7" data-index="2">
			<jsp:include page="../../common/advertA.jsp"></jsp:include>
		</div>
		<div class="zx_yjrw">
			<h2>业界人物</h2>
			<div class="zx_yjrw_nr">
				<ul class="zx_yjrw_nr_1">

				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//悦玩光点
	$(function() {
		//悦玩光点
		getHighGame();
		//业界人物
		getPerson();
	})

	function getHighGame(){
		$.ajax({
            type: "POST",
            url: "news/getGamesNews.do",
         	data: {
				"tType":11,
				"perNumber": 1
            },
            success: function(data) {
           		$.each(data.resultList,function(i, m) {
            		$(".zx_gqgd_nr").append('<a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" class="girl-item"><img src="' + commonFn.getImgUrl(m.timg) + '" width="320" height="135" /><p>'+m.title+'</p></a>');
	            });
	       	}
        });
	}
	
	function getPerson(){
		$.ajax({
            type: "POST",
            url: "news/getGamesNews.do",
         	data: {
				"tType":12,
				"perNumber":3
            },
            success: function(data) {
           		$.each(data.resultList, function(i, m) {
                    $(".zx_yjrw_nr_1").append('<li><a target="_blank" href="'+ commonFn.getRelLink("news") + '/news/'+m.id+'.htm" title='+m.title+'><img src=' + commonFn.getImgUrl(m.timg) + ' width="160" height="105" title='+m.title+' /><span>' + m.title.substring(0,20) + '</span></a></li>');
            	});
			}
        });
	
	}
</script>




