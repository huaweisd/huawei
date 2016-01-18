$.fn.lxhgrid = function(data) {
	var obj = $(this);
    $(".tfoot",obj).remove();
    data = $.extend(data, {
        page: 1,
        total: 0,
        pageCount: 0,
        pageN: 6
    });
    getLxhData(data, obj);
    var tfootul = $("<ul/>").addClass("pagination").append("<li class='disabled' data-role='firstPage'><a>«</a></li><li class='disabled' data-role='prev'><a>‹</a></li><li data-role='role_prev'><a>...</a></li><li data-role='role_next'><a >...</a></li><li class='disabled' data-role='next'><a>›</a></li><li class='disabled' data-role='lastPage'><a >»</a></li>");
    var tfoot = $("<div class='tfoot'/>").append($("<div/>").append($("<div/>").addClass("btn-group pages").append(tfootul)));
    obj.append(tfoot);
};

function initPageON(data, obj) {
    $("span[data-role='total-record']", obj).text(data.total);
    $("span[data-role='start-record']", obj).text((data.page - 1) * data.perNumber + 1);
    $("span[data-role='end-record']", obj).text(data.page * data.perNumber > data.total ? data.total: data.page * data.perNumber);
    $("span[data-role='page-count']", obj).text(data.pageCount);

    $("li[data-role='pageNo']").remove();
    var p = Div(data.page - 1, data.pageN);
    var c = data.page % data.pageN;
    if (c == 0) {
        p = p + c;
    }
    for (var i = 1; i <= data.pageN; i++) {
        var idx = p * data.pageN + i;
        $("li[data-role='role_next']", obj).before("<li data-role='pageNo' data-value='" + idx + "'><a>" + idx + "</a></li>");
        if (idx >= data.pageCount) {
        	break;
        }
    }

    if ($("li[data-value='1']", obj).length > 0) {
        $("li[data-role='role_prev']", obj).hide();
    } else {
        $("li[data-role='role_prev']", obj).show();
    }
    
    if ($("li[data-value=" + data.pageCount + "]", obj).length > 0 || data.pageCount <= data.page) {
        $("li[data-role='role_next']", obj).hide();
    } else {
        $("li[data-role='role_next']", obj).show();
    }

    if (data.pageCount > data.page) {
        $("li[data-role='next']", obj).removeClass("disabled");
    } else {
        $("li[data-role='next']", obj).addClass("disabled");
    }
    if (data.page > 1) {
        $("li[data-role='prev']", obj).removeClass("disabled");
    } else {
        $("li[data-role='prev']", obj).addClass("disabled");
    }
    if (Div(data.page - 1, data.pageN) > 0) {
        $("li[data-role='firstPage']", obj).removeClass("disabled");
    } else {
        $("li[data-role='firstPage']", obj).addClass("disabled");
    }

    if (Div(data.page - 1, data.pageN) < Div(data.pageCount - 1, data.pageN)) {
        $("li[data-role='lastPage']", obj).removeClass("disabled");
    } else {
        $("li[data-role='lastPage']", obj).addClass("disabled");
    }

    var active = $("li[data-value=" + data.page + "]", obj);
    if (active) {
        $(".pagination li", obj).removeClass("active");
        active.addClass("active");
    }

}
function initEvent(data, obj) {
    $(".pagination li", obj).unbind("click");
    $(".pagination li", obj).bind("click",
    function(event) {
        var type = $(this).attr("data-role");

        if ($(this).hasClass("disabled")) {

        } else {
            if (type == "pageNo") {
                data.page = $(this).attr("data-value");
                getLxhData(data);
            } else if (type == "next") {
                data.page = data.page * 1 + 1;
                getLxhData(data);
            } else if (type == "prev") {
                data.page = data.page * 1 - 1;
                getLxhData(data);
            } else if (type == "firstPage") {
                data.page = 1;
                getLxhData(data);
            } else if (type == "lastPage") {
                data.page = data.pageCount;
                getLxhData(data);
            } else if (type == "role_next") {
            	data.page = ((data.page * 1 + data.pageN) > data.pageCount ? data.pageCount : (data.page * 1 + data.pageN));
                getLxhData(data);
            } else if (type == "role_prev") {
            	data.page = ((data.page * 1 - data.pageN) > 0 ? (data.page * 1 - data.pageN) : 1);
                getLxhData(data);
            }
        }
    });

    $(".checker span[data-role='selectAll']", obj).unbind("click");
    $(".checker span[data-role='selectAll']", obj).bind("click", function() {
        if ($(this).hasClass("checked")) {
            $(".checker span[data-role='indexCheckbox']", obj).removeClass("checked");
            $(this).removeClass("checked");
        } else {
            $(".checker span[data-role='indexCheckbox']", obj).addClass("checked");
            $(this).addClass("checked");
        }
    });
    $(".checker span[data-role='indexCheckbox']", obj).unbind("click");

    $.each($(".checker span[data-role='indexCheckbox']", obj), function(index, element) {
        $(element).bind("click", function(event) {
            if ($(this).hasClass("checked")) {
                $(this).removeClass("checked");
            } else {
                $(this).addClass("checked");
            }
        });
    });
}

function Div(exp1, exp2) {
    var n1 = Math.round(exp1); // 四舍五入
    var n2 = Math.round(exp2); // 四舍五入
    var rslt = n1 / n2; // 除
    if (rslt >= 0) {
        rslt = Math.floor(rslt); // 返回值为小于等于其数值参数的最大整数值。
    } else {
        rslt = Math.ceil(rslt); // 返回值为大于等于其数字参数的最小整数。
    }

    return rslt;
}

function getLxhData(data, obj) {
    var param = $.extend(data.params, {
        page: data.page,
        perNumber: data.perNumber
    });
    $.ajax({
        type: "POST",
        url: data.url,
        data: param,
        success: function(msg) {
	        data.total = msg.totalCount;
	        data.pageCount = msg.pageCount;
	        data.fun(msg.resultList);
	
	        initPageON(data, obj);
	        initEvent(data, obj);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $.log(textStatus);
        }
    });
}

$.extend({
    date_format: function(myDate, dateTime) {
        dateTime = dateTime.replace("yyyy", myDate.getFullYear());
        dateTime = dateTime.replace("mm", myDate.getMonth() < 9 ? '0' + (myDate.getMonth() + 1) : (myDate.getMonth() + 1));
        dateTime = dateTime.replace("dd", myDate.getDate() < 10 ? '0' + myDate.getDate() : myDate.getDate());
        dateTime = dateTime.replace("hh", myDate.getHours() < 10 ? '0' + myDate.getHours() : myDate.getHours());
        dateTime = dateTime.replace("ii", myDate.getMinutes() < 10 ? '0' + myDate.getMinutes() : myDate.getMinutes());
        dateTime = dateTime.replace("ss", myDate.getSeconds() < 10 ? '0' + myDate.getSeconds() : myDate.getSeconds());
        return dateTime;
    },
    log: function(message) {
        window.console && window.console.log($.date_format(new Date(), "yyyy-mm-dd hh:ii:ss") + " :: " + message);
    }
});