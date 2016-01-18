<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="zq_twoad">
	<ul>
    	<li class="left" ggtag="1"><a href="#"></a></li>
        <li class="right"  ggtag="2"><a href="#"></a></li>
    </ul>
</div>


<script type="text/javascript">
//最热资讯				
		$(function(){
			$.ajax({
	            type: "POST",
	            url: "rank/getAdverPic.do",
	         	data: {
					"tType":25,
					"perNumber": 2
	            },
	            success: function(data) {
		            $.each(data.resultList,
			            function(i, m) {
				           if(i == 0){
								$(".zq_twoad .left").find("a").append('<img src='+m.timg+' width="585" height="100" title='+m.ttitle+' />');
							}else if(i==1){
							  	$(".zq_twoad .right").find("a").append('<img src='+m.timg+' width="585" height="100" title='+m.ttitle+' />');
							}
			        });
				}
	        });
		})
</script>


