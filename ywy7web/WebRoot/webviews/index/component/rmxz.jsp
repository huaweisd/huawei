<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main3_title">
	热门下载
	<div class="more third" title="更多"><a href="http://xy.ywy7.com/newGame/zyx.htm">...</a></div>
</div>
<div class="main3_content">
	<div class="main3_content_search_list">
		<div class="main3_content_search">
			<form>
				<span class="s_ipt_wr2"><input name="wd" id="gameName" maxlength="100" class="s_ipt2" type="text"></span>
				<input class="searchGame_btn" type="button">
			</form>
		</div>
		<div class="main3_content_list">
			<dl>
				<dt>类型</dt>
				<dd>
					<ul class="DOWNLOAD_GAME_TYPE">
						<li><a class="search_on all_type">全部</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>系统</dt>
				<dd>
					<ul class="DOWNLOAD_OS_TYPE">
						<li><a class="search_on all_type">全部</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>价格</dt>
				<dd>
					<ul class="DOWNLOAD_PRICE_TYPE">
						<li><a class="search_on all_type">全部</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>语言</dt>
				<dd>
					<ul class="DOWNLOAD_LANGUAGE_TYPE">
						<li><a class="search_on all_type">全部</a></li>
					</ul>
				</dd>
			</dl>
		</div>
	</div>
	<div class="main3_content_icon">
		<ul id="game_content"></ul>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type: "POST",
	        url: "index/getIndexConfig.do",
	     	data: {
				'group' : 'GAME_TYPE,OS_TYPE,PRICE_TYPE,LANGUAGE_TYPE'
	        },
	        success: function(data) {
	        	if(data.state){
	        		$.each(data.obj.GAME_TYPE, function(i, m){
	        			$('.DOWNLOAD_GAME_TYPE').append('<li><a key="'+m.tkey+'">'+m.tvalue+'</a></li>')
	        		})
	        		$.each(data.obj.OS_TYPE, function(i, m){
	        			$('.DOWNLOAD_OS_TYPE').append('<li><a key="'+m.tkey+'">'+m.tvalue+'</a></li>')
	        		})
	        		$.each(data.obj.PRICE_TYPE, function(i, m){
	        			$('.DOWNLOAD_PRICE_TYPE').append('<li><a key="'+m.tkey+'">'+m.tvalue+'</a></li>')
	        		})
	        		$.each(data.obj.LANGUAGE_TYPE, function(i, m){
	        			$('.DOWNLOAD_LANGUAGE_TYPE').append('<li><a key="'+m.tkey+'">'+m.tvalue+'</a></li>')
	        		})
	        		
	        		$("a",".DOWNLOAD_GAME_TYPE").bind("click", function(){
						if($._checkBtn($(this), 'search_on')){
							return;
						}
						$("a",".DOWNLOAD_GAME_TYPE").removeClass("search_on");
						$(this).addClass("search_on");
						if($(this).hasClass("all_type")){
							indexParam.searchData["gameType"] = 0;
						}else{
							indexParam.searchData["gameType"] = $(this).attr("key");
						}
						indexFn.searchGame(indexParam.searchData);
					});
					$("a",".DOWNLOAD_OS_TYPE").bind("click", function(){
						if($._checkBtn($(this), 'search_on')){
							return;
						}
						$("a",".DOWNLOAD_OS_TYPE").removeClass("search_on");
						$(this).addClass("search_on");
						if($(this).hasClass("all_type")){
							indexParam.searchData["osType"] = 0;
						}else{
							indexParam.searchData["osType"] = $(this).attr("key");
						}
						indexFn.searchGame(indexParam.searchData);
					});
					$("a",".DOWNLOAD_PRICE_TYPE").bind("click", function(){
						if($._checkBtn($(this), 'search_on')){
							return;
						}
						$("a",".DOWNLOAD_PRICE_TYPE").removeClass("search_on");
						$(this).addClass("search_on");
						if($(this).hasClass("all_type")){
							indexParam.searchData["priceType"] = 0;
						}else{
							indexParam.searchData["priceType"] = $(this).attr("key");
						}
						indexFn.searchGame(indexParam.searchData);
					});
					$("a",".DOWNLOAD_LANGUAGE_TYPE").bind("click", function(){
						if($._checkBtn($(this), 'search_on')){
							return;
						}
						$("a",".DOWNLOAD_LANGUAGE_TYPE").removeClass("search_on");
						$(this).addClass("search_on");
						if($(this).hasClass("all_type")){
							indexParam.searchData["languageType"] = 0;
						}else{
							indexParam.searchData["languageType"] = $(this).attr("key");
						}
						indexFn.searchGame(indexParam.searchData);
					});
	        	}
	        }
		})
	})
</script>