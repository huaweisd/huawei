<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="zx_wx_gqkd">
    	<div class="zx_wx">
        	<dl>
            	<dt><span>关注我们</span></dt>
                <dd class="pic"><img src="webviews/common/img/ywwcode.jpg" width="108" height="108" /></dd>
                <dd class="txt">
                	<ul>
                    	<li><a onclick="wx()"><img src="webviews/common/img/wx_pot.jpg" width="38" height="38" /><span>微信</span></a></li>
                      	<li><a href= onclick="wb()"><img src="webviews/common/img/wb_pot.jpg" width="38" height="38" /><span>微博</span></a></li>
                      	<li><a  onclick="dy()"><img src="webviews/common/img/dy_pot.jpg" width="38" height="38" /><span>订阅</span></a></li>
                    </ul>
                </dd>
            </dl>
        </div><!--end-->
        <div class="zx_gqkd">
       	  <h2>悦玩看点</h2>
            <div class="zx_gqkd_nr_1">
            </div>
        </div>
    </div>
<script type="text/javascript">
//关注我们  悦玩看点
	$(function(){
		$.ajax({
            type: "POST",
            url: "news/getGamesNews.do",
         	data: {
				"tType":10,
				"perNumber": 4
            },
            success: function(data) {
             $.each(data.resultList,
	            function(i, m) {
	                if (i == 0) {
	                    $(".zx_gqkd_nr_1").append('<dl> <dt><a target="_blank" href= "'+ commonFn.getRelLink("news") +'/news/'+m.id+'.htm">' + m.title + '</a></dt> <dd class="pic"><img src="' + commonFn.getImgUrl(m.timg) + '" width="160" height="105" /></dd>  <dd class="txt">' + m.ttile.substring(0,50) + '</dd> <dd class="more"><a target="_blank" href=' + commonFn.getRelLink("news") +'"/news/'+m.id+'.htm">深入阅读>></a></dd>  </dl>');
	                }
	            });
            }
        });
	})
</script>