// 全局变量
var searchData = {"gameType":0,"osType":0,"priceType":0,"languageType":0};// 搜索条件

$(function() {

    //图文
    getTuWen();

    //首页广告
    $._getNewAdvert(1);

    //热门下载
    initDownLoad();

    //热门下载查询按钮事件
    /*$("#QUERY_BTN").bind("click",
    function() {
        queryGame();
    });
    $("#QUERY_BTN").click();*/
    searchGame();
    
    //新闻
    getNews();

    //专区
    getSection();

    getRMZQ();

    getRMTJGrid();

    getRaiders();

    //礼包
    getPackageList();

    //视频
    getVideo();

    //排行
    getKFKCPH();

    getDJPH();

    getWYPH();

    getQDPH();

    //新游评测
    xypc();

    //三页联动
    $._getLiandong(5);

    $("a#login-mian").click(function() {

    });

});

function getImgUrl(url){
	var str = 'http://www.ywy7.com/tms';
	return str + url.replace('..', ''); 
}

function getLinkUrl(id){
	var data = {
		'xy':'http://xy.ywy7.com/',
		'gl':'http://gl.ywy7.com/',
		'pack':'http://pack.ywy7.com/',
		'news':'http://news.ywy7.com/',
		'area':'http://area.ywy7.com/',
		'v':'http://v.ywy7.com/',
		'ku':'http://ku.ywy7.com/'
	}
	return data[id];
}

//精品专区
function getSection(){
	$.ajax({
        type: "POST",
		url: "http://boss.ywy7.com/tms/index/queryHotArea.do",
		data: {
			"zqType":2,
			"perNumber": 2
		},
        success: function(msg) {
			//精品专区APP
        	$.each(msg, function(i, m) {
        		$(".jpzq_nr_1").append('<dl><dt><a target="_blank" href="'+getLinkUrl('ku')+'product/'+m.id+'.htm">'+m.gameName+'</a></dt> <dd class="pic"><img src='+getImgUrl(m.gameImg)+' width="95" height="95" /></dd> <dd class="txt">'+$._ffsize($._removeHTMLTag(m.gameDesc),40)+'</dd> </dl>');
        	});	
        }
    });
}

function getRMZQ() {
    $.ajax({
		type: "POST",
		data: {
			"zqType": 3,
			"perNumber": 4
		},
		url: "http://boss.ywy7.com/tms/index/queryHotArea.do",
		success: function(msg) {
			$.each(msg, function(i,m) {
				$(".rmzq_wy").append('<dl><dt>'+m.gameName+'</dt><dd class="pic"><img src='+getImgUrl(m.gameImg)+' width="98" height="98" /></dd><dd class="txt" style="height:38px" title='+$._removeHTMLTag(m.gameDesc)+'>'+$._ffsize($._removeHTMLTag(m.gameDesc),40)+'</dd><dd class="txt2" style="position: relative;top: 10px;"> <span><a target="_blank" href="'+getLinkUrl('ku')+'product/'+m.id+'.htm"  class="graya">专区</a></span> <span><a target="_blank" href="'+getLinkUrl('pack')+'package/'+m.id+'_1.htm" tag='+m.packNum+'>礼包</a></span> <span><a href="#">论坛</a></span></dd></dl>');
			});
		}
	});
}

function getRMTJGrid() {
    $.ajax({
		type: "POST",
		url: "http://boss.ywy7.com/tms/index/queryHotRecommend.do",
		success: function(msg) {
			$.each(msg, function(i, m) {
				 var list = "<tr>";
				 list += "<td align=\"center\" bgcolor=\"#FFFFFF\"><a href=\"#\">攻略</a></td><td align=\"center\" bgcolor=\"#FFFFFF\"><a href=\"#\">评测</a></td><td align=\"center\" bgcolor=\"#FFFFFF\"><a href=\"#\">礼包</a></td>";
				 list = list + "</tr>";
			
				 var rows = "";
				  $.each(m.raidersList,function(k,n){
					 rows = rows + '<li><span>[' + $._DateFormat(new Date(n.createTimeStr), 'yyyy-MM-dd').substring(5) + ']</span>[攻略]<a target="_blank" href="'+getLinkUrl('gl')+'raiders/'+m.id+'.htm">'+n.title+'</a></li>'
				 })
				 $(".rmtj_nr_1").append($("<dl/>").append($("<dt/>").append($("<a/>").attr({"href":getLinkUrl('ku')+'product/'+m.id+'.htm'}).html(m.gameName)))
				                                 .append($("<dd/>").addClass("pic").append($("<img/>").attr({src:getImgUrl(m.gameImg),width:95,height:95})))
												 .append($("<dd/>").addClass("txt").append($("<table/>").attr({width:"300", border:"0", cellspacing:"1", cellpadding:"0",bgcolor:"#e1e1e1"}).append(list))));
			     $(".rmtj_nr_1").append($("<ul/>").append(rows));
			});	
		}
	});
}

function checkBtn(obj) {
	if(obj.hasClass("rmxz_active")){
		return false;
	}else{
		return true;
	}
}

//初始化热门下载页面查询条件
function initDownLoad() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/index/querySearch.do",
        success: function(msg) {
        	$.each(msg, function(i,n){
				$(".DOWNLOAD_" + n.tgroup).append($("<li/>").append($("<a/>").attr({key:n.tkey}).html(n.tvalue)));
			});
			
			$("a",".DOWNLOAD_GAME_TYPE").bind("click",function(){
				if(!checkBtn($(this))){
					return;
				}
				$("a",".DOWNLOAD_GAME_TYPE").removeClass("rmxz_active");
				$(this).addClass("rmxz_active");
				if($(this).hasClass("all_type")){
					searchData["gameType"] = 0;
				}else{
					searchData["gameType"] = $(this).attr("key");
				}
				searchGame();
			});
			
			$("a",".DOWNLOAD_OS_TYPE").bind("click",function(){
				if(!checkBtn($(this))){
					return;
				}
				$("a",".DOWNLOAD_OS_TYPE").removeClass("rmxz_active");
				$(this).addClass("rmxz_active");
				if($(this).hasClass("all_type")){
					searchData["osType"] = 0;
				}else{
					searchData["osType"] = $(this).attr("key");
				}
				searchGame();
			});
			
			$("a",".DOWNLOAD_PRICE_TYPE").bind("click",function(){
				if(!checkBtn($(this))){
					return;
				}
				$("a",".DOWNLOAD_PRICE_TYPE").removeClass("rmxz_active");
				$(this).addClass("rmxz_active");
				if($(this).hasClass("all_type")){
					searchData["priceType"] = 0;
				}else{
					searchData["priceType"] = $(this).attr("key");
				}
				searchGame();
			});
			
			$("a",".DOWNLOAD_LANGUAGE_TYPE").bind("click",function(){
				if(!checkBtn($(this))){
					return;
				}
				$("a",".DOWNLOAD_LANGUAGE_TYPE").removeClass("rmxz_active");
				$(this).addClass("rmxz_active");
				if($(this).hasClass("all_type")){
					searchData["languageType"] = 0;
				}else{
					searchData["languageType"] = $(this).attr("key");
				}
				searchGame();
			});
        }
    });
}

// 搜索游戏列表
function searchGame() {
	$.ajax({
		url : 'http://boss.ywy7.com/tms/index/searchGame.do',
		type : 'POST',
		data : searchData,
		dataType : 'JSON',
		success : function(data) {
			$(".result_rmyx").empty();
			$.each(data, function(i, m) {
				$(".result_rmyx").append($("<div style='width:90px;height:90px;float:left;margin:15px 15px; text-align:center'/>").append($("<img/>").css({width:"90px",height:"90px"}).attr({
                    src: getImgUrl(m.gameImg),
					m_url :getLinkUrl('ku')+'product/'+m.ID+'.htm'
                }).bind("click", function(){
					location.href = $(this).attr('m_url');
				})).append($("<a/>").html(m.gameName)));
			});
			$(".result_rmyx").append($("<div style='width:90px;height:90px;float:left;margin:15px 15px; text-align:center'/>").append($("<img/>").css({width:"90px",height:"90px"}).attr({
                src: 'http://boss.ywy7.com/html/images/more.png',
				m_url :'http://ku.ywy7.com/'
            }).bind("click",function(){
				location.href = $(this).attr('m_url');
			})).append($("<a/>").html("更多")));
		}
	});
}



function getNews() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/index/queryNews.do",
        success: function(msg) {
			 //头条资讯
             $.each(msg.type_7,function(i, m) {
                if (i == 0 || i == 2 ) {
                    $(".ttzx_1").append('<li><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm"  class="link-24" title="' + m.title + '">'+$._ffsize(m.title,15)+'</a></li>');
				}else if(i == 1 || i == 3){
					$(".ttzx_1").append('<li><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm"  class="link-14" title="' + m.title + '">'+$._ffsize(m.title,25)+'</a></li>');
				}else if( i == 4 || i == 5){
					$(".ttzx_3").append('<li style="text-align:left; margin-top:10px"><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm"  class="link-24" title="' + m.title + '">'+$._ffsize(m.title,15)+'</a></li>');
				}else if(i<10){
					$(".ttzx_2").append('<li tts="'+i+'"><span>[' + $._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd').substring(5) + ']</span><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm" title="' + m.title + '">' + $._ffsize(m.title,25) + '</a></li>');
				}else {
                    $(".ttzx_4").append('<li tts="'+i+'"><span>[' + $._DateFormat(new Date(m.createTimeStr), 'yyyy-MM-dd').substring(5) + ']</span><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm" title="' + m.title + '">' + $._ffsize(m.title,25) + '</a></li>');
                }
            });
				
			$("li[tts='9']",".tlzx_nr_list").css({"border-bottom":"1px dashed #e1e1e1"});
			$("li[tts='13']",".tlzx_nr_list").css({"border-bottom":"1px dashed #e1e1e1"});
				
			//活动新闻
            $("#D1pic1").empty();
			$.each(msg.type_5, function(i, m) {
                if(i<4){
                	$("#D1pic1").append(' <div class="fcon" style="display: none;"><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm"><img src='+getImgUrl(m.timg)+' style="opacity: 1; "></a><span class="shadow"><a href="javascript:">'+$._ffsize(m.title,15)+'</a></span></div>');
				}
            });
		    Qfast(false, 'widgets', function() {
                K.tabs({
                    id: 'fsD1',
                    // 焦点图包裹id
                    conId: "D1pic1",
                    // ** 大图域包裹id
                    tabId: "D1fBt",
                    tabTn: "a",
                    conCn: '.fcon',
                    // ** 大图域配置class
                    auto: 1,
                    // 自动播放 1或0
                    effect: 'fade',
                    // 效果配置
                    eType: 'click',
                    // ** 鼠标事件
                    pageBt: true,
                    // 是否有按钮切换页码
                    bns: ['.prev', '.next'],
                    // ** 前后按钮配置class
                    interval: 3000
                    // ** 停顿时间
                })
            });
						
			//专访
            $.each(msg.type_6,function(i, m) {
                if (i < 2) {
                    $(".zf_1").append('<li><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm"><img src='+getImgUrl(m.timg)+' width="238" height="80" /><span>'+m.title+'</span></a></li>');
                } else {
                    $(".zf_2").append('<li><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm">'+$._ffsize(m.title,15)+'</a></li>');
                }
            });
				
			//产业新闻
            $.each(msg.type_2,function(i, m) {
            	if(i<6) {
            		$(".cyxw_nr_1").append('<li><a target="_blank" href="'+getLinkUrl('news')+'news/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,15)+'</a></li>');
            	}
            });
        }
    });
}

function getPackageList() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/package/queryMultipleTypesLb.do",
        data: {
            "sortField": "S_COUNT",
            "sortOrder": "desc",
            "startRecordNum": 0,
			"perNumber": 10,
			"page":1
        },
        success: function(msg) {
			$(".today_package").html(msg.msg);
			
            $.each(msg.type_2,
            function(i, n) {
                if (i < 6) {
                   $(".zrlb_nr_1").append('<li><a target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'.htm"><img src=' + getImgUrl(n.timg) + '	width="110" height="70" /><span>' + n.gameName + '</span></a></li>');
                }
               
            });

            $.each(msg.type_3,
            function(i, n) {
                if (i < 6) {
                    $(".zxlb_nr_1").append('<li><a target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'.htm"><img src=' + getImgUrl(n.timg) + '	 width="110" height="70" /><span>' + n.gameName + '</span></a></li>');
                }

            });
            $.each(msg.type_5,
            function(i, n) {
                if (i < 1) {
                    $(".tylb_nr_1").append('<ul><li><a target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'.htm"><img src=' + getImgUrl(n.timg) + '	width="396" height="160" /><span>' + n.packageName + '</span></a></li></ul>');
                }
				else if(i<4){
					 $(".tylb_nr_1").append(' <dl><dd class="pic"><a target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'.htm"><img src=' + getImgUrl(n.timg) + ' width="110" height="70" /></a></dd><dd class="txt"> <font color="#666666">游戏名称：</font>' + n.gameName + '<br /><font color="#666666">运营平台：</font>休闲益智<br /> <font color="#666666">礼包奖励：</font><font color="#FF0000">'+n.tcontent+'</font></dd></dl>');
				}
            });

			
            $.each(msg.type_1,
            function(i, n) {
                if (i < 4) {
					var c = n.tcount - n.scount;
                    $(".lb_nr_1").append('<ul><li class="pica"><a><img src=' + getImgUrl(n.timg) + ' width="210" height="105" /><span>已领取：'+n.scount+'</span></a></li><li><a>' + n.packageName + '</a></li><li><span tag='+c+' class="lq tjlb_lq"><a  target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'.htm">领取</a></span>平台 '+$._systemImg1(n.tsystem)+'</li></ul>');
					                    
                }
            });
			
			$(".tjlb_lq").each(function(){
				
				if($(this).attr("tag") < 1){
					
					 $("a",$(this)).attr({"href":"javascript:void(0);"});
				     $(this).css({"background-color":"#ddd"});
				}
			});
           

            
        }
    });
}

//游戏视频
function getVideo() {
    $.ajax({
    	type: "POST",
    	data: {"perNumber": 8},
        url: "http://boss.ywy7.com/tms/index/queryGameVideos.do",
        success: function(msg) {
        	$.each(msg, function(i,n){
			    if(i%2 == 0){
			    	$(".yxsp_nr_yxsp_nr").append('<li><a href="'+getLinkUrl('v')+'video/'+n.id+'.htm"><img src='+getImgUrl(n.timg)+' width="130" height="100" title="'+n.title+'"/><span title="'+n.title+'">'+$._ffsize(n.title,8)+'</span></a></li>');
			    }else{
			    	$(".yxsp_nr_yxsp_nr").append('<li  class="right"><a href="'+getLinkUrl('v')+'video/'+n.id+'.htm"><img src='+getImgUrl(n.timg)+' width="130" height="100" title="'+n.title+'"/><span title="'+n.title+'">'+$._ffsize(n.title,8)+'</span></a></li>');
			    }
        	});
        }
    });
}


function getDJPH() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/index/querySingleRank.do",
		data: {
            "tGroup":2,
            "order": "CLICK_COUNT desc",
            "perNumber": 10
        },
        success: function(msg) {
            $.each(msg, function(i,n){
			   if(i<3) {
				   $(".phb_dj_1").append('<ul><li><span class="poo">'+(i+1)+'</span></li><li><span class="a"><div><table width="100%"><tr><td colspan="2">'+n.gameName+'</td></tr><tr><td rowspan="2" width="66"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="64" height="64"/></a></td><td>大小：'+n.fileSize+'</td></tr><tr><td>系统：'+n.osTypes+'</td></tr></table></div><a class="gameName" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">'+n.gameName+'</a></span></li><li>'+n.procductsTypes+'</li><li class="rd">'+n.clickCount+'</li></ul>');
			   } else{
				   $(".phb_dj_1").append('<ul djtag="DJPH'+n.id+'"><li><span class="poo2">'+(i+1)+'</span></li><li><span class="a"><div><table width="100%"><tr><td colspan="2">'+n.gameName+'</td></tr><tr><td rowspan="2" width="66"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="64" height="64"/></a></td><td>大小：'+n.fileSize+'</td></tr><tr><td>系统：'+n.osTypes+'</td></tr></table></div><a class="gameName" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">'+n.gameName+'</a></span></li><li>'+n.procductsTypes+'</li><li class="rd">'+n.clickCount+'</li></ul>');
			   }
			   if(i<10) {
				   $("#kfkc_djb").append('<tr djptag="djptag'+n.id+'"><td>' + $._DateFormat(new Date(n.startTimeStr), 'yyyy-MM-dd').substring(5) + '</td><td><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm" djptag="djptag'+n.id+'">'+n.gameName+'</a><div djptag="djptag'+n.id+'" style="display:none"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td><td>'+n.procductsTypes+'</td><td><a class="tag" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">专区</a></td> </tr>');
			   }
			});
			$("div",".phb_dj_1").hide();
			
			$("ul",".phb_dj_1").bind("mouseover",function(){
				$("div",$(this)).show();
				$(".gameName",$(this)).hide();
			});
			$("ul",".phb_dj_1").bind("mouseout",function(){
				$("div",$(this)).hide();
				$(".gameName",$(this)).show();
			});
			
			$("tr","#kfkc_djb").bind("mouseover",function(){
				$("div",$(this)).show();
			});
			$("tr","#kfkc_djb").bind("mouseout",function(){
				$("div",$(this)).hide();
			});
        }
    });
}
function getWYPH() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/index/querySingleRank.do",
		data: {
            "tGroup":1,
            "order": "CLICK_COUNT desc",
            "perNumber": 10
        },
        success: function(msg) {
            $.each(msg, function(i,n){
			   if(i<3){
				   $(".phb_dj_2").append('<ul wytag="DJPH'+n.id+'"><li><span class="poo">'+(i+1)+'</span></li><li><span class="a"><div><table width="100%"><tr><td colspan="2">'+n.gameName+'</td></tr><tr><td rowspan="2" width="66"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="64" height="64"/></a></td><td>大小：'+n.fileSize+'</td></tr><tr><td>系统：'+n.osTypes+'</td></tr></table></div><a class="gameName" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">'+n.gameName+'</a></span></li><li>'+n.procductsTypes+'</li><li class="rd">'+n.clickCount+'</li></ul>');
			   }else{
				   $(".phb_dj_2").append('<ul wytag="DJPH'+n.id+'"><li><span class="poo2">'+(i+1)+'</span></li><li><span class="a"><div><table width="100%"><tr><td colspan="2">'+n.gameName+'</td></tr><tr><td rowspan="2" width="66"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="64" height="64"/></a></td><td>大小：'+n.fileSize+'</td></tr><tr><td>系统：'+n.osTypes+'</td></tr></table></div><a class="gameName" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">'+n.gameName+'</a></span></li><li>'+n.procductsTypes+'</li><li class="rd">'+n.clickCount+'</li></ul>');
			   }
			});
			$("div",".phb_dj_2").hide();
			$("ul",".phb_dj_2").bind("mouseover",function(){
				$("div",$(this)).show();
				$(".gameName",$(this)).hide();
			});
			$("ul",".phb_dj_2").bind("mouseout",function(){
				$("div",$(this)).hide();
				$(".gameName",$(this)).show();
			});
        }
    });
}
function getQDPH() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/index/querySingleRank.do",
		data: {
            "gameState":3,
            "order": "CLICK_COUNT desc",
            "perNumber": 10
        },
        success: function(msg) {
            $.each(msg, function(i,n){
			   if(i<3){
				   $(".phb_dj_3").append('<ul qdtag="DJPH'+n.id+'"><li><span class="poo">'+(i+1)+'</span></li><li><span class="a"><div><table width="100%"><tr><td colspan="2">'+n.gameName+'</td></tr><tr><td rowspan="2" width="66"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="64" height="64"/></a></td><td>大小：'+n.fileSize+'</td></tr><tr><td>系统：'+n.osTypes+'</td></tr></table></div><a class="gameName" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">'+n.gameName+'</a></span></li><li>'+n.procductsTypes+'</li><li class="rd">'+n.clickCount+'</li></ul>');
			   } else{
				   $(".phb_dj_3").append('<ul qdtag="DJPH'+n.id+'"><li><span class="poo2">'+(i+1)+'</span></li><li><span class="a"><div><table width="100%"><tr><td colspan="2">'+n.gameName+'</td></tr><tr><td rowspan="2" width="66"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="64" height="64"/></a></td><td>大小：'+n.fileSize+'</td></tr><tr><td>系统：'+n.osTypes+'</td></tr></table></div><a class="gameName" target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm">'+n.gameName+'</a></span></li><li>'+n.procductsTypes+'</li><li class="rd">'+n.clickCount+'</li></ul>');
			   }
			});
			$("div",".phb_dj_3").hide();
			$("ul",".phb_dj_3").bind("mouseover",function(){
				$("div",$(this)).show();
				$(".gameName",$(this)).hide();
			});
			$("ul",".phb_dj_3").bind("mouseout",function(){
				$("div",$(this)).hide();
				$(".gameName",$(this)).show();
			});
        }
    });
}

//
function getKFKCPH() {
	$.ajax({
		type: "POST",
        url: "http://boss.ywy7.com/tms/sys/queryKfKc.do",
		data: {
            "startRecordNum": 0,
            "perNumber": 10,
			"page":1
        },
        success: function(msg) {
			$.each(msg.START_TEST,function(i,n){
				if(i<10) {
					$("#kfkc_kcb").append('<tr kctag="kctag'+n.id+'"><td>' + n.prodTestTimeStr.substring(5, 11) + '</td><td><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm" kctag="kctag'+n.id+'">'+n.gameName+'</a><div kctag="kctag'+n.id+'" style="display:none"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td><td>'+$._testState(n.prodTestType)+'</td><td><a tag='+n.packNum+' class="tag kfkc_lib" target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'_1.htm">领取</a></td></tr>');
				}
			});
			$.each(msg.START_SERVER,function(i,n){
				if(i<10){
					$("#kfkc_kfb").append(' <tr kftag="kftag'+n.id+'"><td>' + n.openTimeStr.substring(5, 11) + '</td><td><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm" kftag="kftag'+n.id+'">'+n.gameName+'</a><div kftag="kftag'+n.id+'" style="display:none"><a target="_blank" href="'+getLinkUrl('ku')+'product/'+n.id+'.htm"><img src="'+getImgUrl(n.gameImg)+'" width="50" height="50"/></a></div></td>    <td>'+n.gameArea+'</td>    <td><a  tag='+n.packNum+' class="tag kfkc_lib" target="_blank" href="'+getLinkUrl('pack')+'package/'+n.id+'_1.htm">领取</a></td>  </tr>');
				}
				$(".kfkc_lib").each(function(){
					if($(this).attr("tag") < 1){
						$(this).attr({"href":"javascript:void(0);"});
						$(this).css({"background-color":"#ddd"});
					}
			   });
			});
			$("tr","#kfkc_kcb").bind("mouseover",function(){
				$("div[kctag="+$(this).attr("kctag")+"]").show();
				$("a[kctag="+$(this).attr("kctag")+"]").hide();
			});
			$("tr","#kfkc_kcb").bind("mouseout",function(){
				$("div[kctag="+$(this).attr("kctag")+"]").hide();
				$("a[kctag="+$(this).attr("kctag")+"]").show();
			});
			$("tr","#kfkc_kfb").bind("mouseover",function(){
				$("div[kftag="+$(this).attr("kftag")+"]").show();
				$("a[kftag="+$(this).attr("kftag")+"]").hide();
			});
			$("tr","#kfkc_kfb").bind("mouseout",function(){
				$("div[kftag="+$(this).attr("kftag")+"]").hide();
				$("a[kftag="+$(this).attr("kftag")+"]").show();
			});
        }
    });
}

//新游评测
function xypc() {
    $.ajax({
		type: "POST",
		url: "http://boss.ywy7.com/tms/index/queryEvaluation.do",
		success: function(msg) {
			//新游评测
		    $.each(msg.type_1,function(i,m) {
				if (i == 0) {
					$(".xypc_nr_1").append('<li><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm"><img src='+getImgUrl(m.timg)+' width="388" height="107" title="'+m.title+'"/></a></li><li><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,25)+'</a></li>');
				} 
				else {
					$(".xypc_second").append('<li><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,25)+'</a></li>');
				} 						
			});
			
			//火爆专题
            $.each(msg.type_2,function(i, m) {
            	if (i<2) {
            		$(".hbzt_nr_1").append('<li><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm"><img src='+getImgUrl(m.timg)+' width="350" height="107" title="'+m.title+'"/><span title="'+m.title+'">'+$._ffsize(m.title,25)+'</span></a></li>');
				}         
				
            });
		
			//新游推荐
		    $.each(msg.type_3,function(i, m) {
	            if (i == 0) {
					$(".xytj_nr_1").append('<li><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm"><img src='+getImgUrl(m.timg)+' width="330" height="107" title="'+m.title+'"/></a></li><li style="text-align:center"><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,25)+'</a></li>');
				} 
				else {
					$(".xytj_nr_2").append('<li><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm" title="'+m.title+'">'+$._ffsize(m.title,25)+'</a></li>');
				} 									
            });
		    
		    //热门评测
		    $.each(msg.type_4,function(i, m) {
		    	if(i<8) {
		    		$(".rmpc_nr_1").append('<li><a title='+m.title+' href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm"><img src='+getImgUrl(m.timg)+' width="190" height="115" /></a><p><span class="js">'+(m.gameType==""||m.gameType==null?'其他类型':m.gameType)+'</span><a href="'+getLinkUrl('news')+'evaluation/'+m.id+'.htm" title='+m.title+' class="link-ti">'+$._ffsize(m.title,6)+'</a></p></li>');
		    	}
            });
		}
	});
}

function shareIt(obj){
	
	window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"1","bdPos":"right","bdTop":"184.5"},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
}
//头条攻略
function getRaiders() {
    $.ajax({
        type: "POST",
        url: "http://boss.ywy7.com/tms/index/queryHotRaiders.do",
        success: function(msg) {
        	//热门攻略
        	$.each(msg, function(i,m){
        		if(i<1){
        			$(".rmgl_nr_1").append($("<li/>").addClass("rm").append($("<a/>").attr({href:getLinkUrl('gl')+'raiders/'+m.id+'.htm'}).append($("<img/>").attr({src:getImgUrl(m.timg),width:270,height:115,title:m.title}))
        					.append( $("<span/>").attr({title:m.title}).css({width:270,"overflow":"hidden"}).html(m.title).attr("style", "overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"))));
				}else if(i%2 == 0){
					$(".rmgl_nr_1").append($("<li/>").addClass("right").append($("<a/>").attr({href:getLinkUrl('gl')+'raiders/'+m.id+'.htm'}).append($("<img/>").attr({src:getImgUrl(m.timg),width:130,height:90,title:m.title}))
							.append($("<span/>").attr({title:m.title}).css({width:130,"overflow":"hidden"}).html($._ffsize(m.title,8)))));
				}else{
					$(".rmgl_nr_1").append($("<li/>").append($("<a/>").attr({href:getLinkUrl('gl')+'raiders/'+m.id+'.htm'}).append($("<img/>").attr({src:getImgUrl(m.timg),width:130,height:90,title:m.title}))
							.append($("<span/>").attr({title:m.title}).css({width:130,"overflow":"hidden"}).html($._ffsize(m.title,8)))));
				}
        	});
        }
    });
}

function getTuWen() {
	$.ajax({
		type: "POST",
		data: {"tType": 3, "tindex": 2, "order": "T_URL desc"},// 临时解决方案，之后需要增加排序字段
		url: "http://boss.ywy7.com/tms/index/querytImages.do",
		success: function(msg) {
			$("#D1pic12").empty();
			$.each(msg, function(i, m) {
				if( m.tindex == 2){
					if($(".fcon","#D1pic12").length < 4){
						$("#D1pic12").append('<div class="fcon" style="display: none;"><a href="'+getLinkUrl('news')+'image/'+m.id+'.htm"><img src='+getImgUrl(m.turl)+' style="opacity: 1; height:260px;  width:630px;"></a><span class="shadow"><span style="width:465px;overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><a href="javascript:void(0)" style:"overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">'+m.tdesc+'</a></span></span></div>');
			        }
				}else{
					$("img[twtag="+m.tindex+"]").attr({src:getImgUrl(m.turl),tid:m.id,tag:getLinkUrl('news')+'image/'+m.id+'.htm'}).bind("click", function() {
						location.href = $(this).attr('tag');
					}).after($("<p/>").html(m.tdesc).attr("style", "overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"));
				}
			});
			Qfast(false, 'widgets', function() {
				K.tabs({
					id: 'fsD12',
					// 焦点图包裹id
					conId: "D1pic12",
					// ** 大图域包裹id
					tabId: "D1fBt2",
					tabTn: "a",
					conCn: '.fcon',
					// ** 大图域配置class
					auto: 1,
					// 自动播放 1或0
					effect: 'fade',
					// 效果配置
					eType: 'click',
					// ** 鼠标事件
					pageBt: true,
					// 是否有按钮切换页码
					bns: ['.prev', '.next'],
					// ** 前后按钮配置class
					interval: 3000
					// ** 停顿时间
				})
			});
        }
    });
}

