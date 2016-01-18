<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

    	<h2>最新视频榜</h2>
        <div class="phb_zxspb_nr" style="padding-left: 12px;">
        	<ul class="phb_zxspb_nr_1">
            </ul>
        </div>

	

 <script type="text/javascript">
 //最新视频榜
$(function(){
		$.ajax({
				type: "POST",
				data: {"perNumber": 8},
				url: "video/getVideoVideos.do",
				success: function(data) {
				   $.each(data.resultList, function(i,n){
						$(".phb_zxspb_nr_1").append('<li style="width:130px;"><a href="'+ commonFn.getRelLink("v") + '/video/'+n.id+'.htm" title="'+n.title+'"><img src='+commonFn.getImgUrl(n.timg)+' width="130" height="100" /><span>'+n.title.substring(0, 10)+'</span></a></li>');
				   });
				}
			})
	})
</script>