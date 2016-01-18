<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="zx_sypc">
	<h2><span><a target="_blank" href="http://news.ywy7.com/news/sypc.htm">更多>></a></span>手游评测</h2>
    <div class="zx_sypc_nr" >
    	<div class="zx_sypc_nr_right_1"></div>
        <div class="zx_sypc_nr_right">
        	<ul class="zx_sypc_nr_right_2">
            	
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
	//手游评测
	$(function(){
		getMobileGame();
	})
	
	function getMobileGame(){
	$.ajax({
            type: "POST",
            url: "news/getMobileGameTest.do",
         	data: {
				"tType":6,
				"perNumber": 8
            },
            success: function(data) {
	           	$.each(data.resultList, function(i, m) {
	         		if (i == 0) 
					{
	                    $(".zx_sypc_nr_right_1").append('<a href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm" style="width:420px;height:370px;"><img src='+commonFn.getImgUrl(m.timg)+' width="420px" height="370px" /><span style="background: rgba(0, 0, 0, 0.6) none repeat scroll 0 0 !important;   bottom: 0;  color: #fff;  font-size: 14px;  left: 0;    line-height: 30px;    padding: 0;    position: absolute;    text-align: center;    width: 420px;  z-index: 999;" title='+m.title+'>'+m.title.substring(0,20)+'</span></a>');
	                }
					else 
					{
						$(".zx_sypc_nr_right_2").append('<li><a href="'+ commonFn.getRelLink("news") + '/evaluation/'+m.id+'.htm" style="width:228px;height:142px;"><img src='+commonFn.getImgUrl(m.timg)+' width="228" height="142" title='+m.title+'/><span title='+m.title+'>'+m.title.substring(0,15)+'</span></a></li>');
	                }
		        });
			}
        });
	}
	
</script>    
	



