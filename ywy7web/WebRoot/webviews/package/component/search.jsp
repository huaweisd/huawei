<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="package_search">
	<dl>
    	<dt class="blue">兑换方式</dt>
		<dd>
			<ul id="exchangeType">
				<li><a class="rmxz_active" data-value="0">所有</a></li>
			</ul>
		</dd>
	</dl>
    <dl>
    	<dt class="org">礼包类型</dt>
        <dd>
        	<ul id="packageType">
            	<li><a class="rmxz_active" data-value="0">所有</a></li>
            </ul>
        </dd>
    </dl>
    <dl>
    	<dt class="green">特价状态</dt>
        <dd>
        	<ul id="specialOffer">
            	<li><a class="rmxz_active" data-value="0">所有</a></li>
            </ul>
        </dd>
    </dl>
</div>
<script type="text/javascript">
	$(function(){
		$._post("index/getIndexConfig.do", {
			'group' : 'EXCHANGE_TYPE,PACKAGE_TYPE,SPECIAL_OFFER'
        }, function(data) {
        	if(data.state) {
        		$.each(data.obj.EXCHANGE_TYPE, function(i, m){
        			$('#exchangeType').append('<li>|</li><li><a data-value="'+m.tkey+'">'+m.tvalue+'</a></li>');
        		})
        		$.each(data.obj.PACKAGE_TYPE, function(i, m){
        			$('#packageType').append('<li>|</li><li><a data-value="'+m.tkey+'">'+m.tvalue+'</a></li>');
        		})
        		$.each(data.obj.SPECIAL_OFFER, function(i, m){
        			$('#specialOffer').append('<li>|</li><li><a data-value="'+m.tkey+'">'+m.tvalue+'</a></li>');
        		})
        		
        		$("a","#exchangeType").bind("click", function(){
        			if($._checkBtn($(this), 'rmxz_active')){
						return;
					}
					$("a","#exchangeType").removeClass("rmxz_active");
					$(this).addClass("rmxz_active");
					packageContentParam.searchData["priceType"] = $(this).attr("data-value");
					packageContentFn.searchPackage(packageContentParam.searchData);
				});
        		$("a","#packageType").bind("click", function(){
					if($._checkBtn($(this), 'rmxz_active')){
						return;
					}
					$("a","#packageType").removeClass("rmxz_active");
					$(this).addClass("rmxz_active");
					packageContentParam.searchData["packageType"] = $(this).attr("data-value");
					packageContentFn.searchPackage(packageContentParam.searchData);
				});
        		$("a","#specialOffer").bind("click", function(){
					if($._checkBtn($(this), 'rmxz_active')){
						return;
					}
					$("a","#specialOffer").removeClass("rmxz_active");
					$(this).addClass("rmxz_active");
					packageContentParam.searchData["priceStatus"] = $(this).attr("data-value");
					packageContentFn.searchPackage(packageContentParam.searchData);
				});
        	}
        });
	})
</script>