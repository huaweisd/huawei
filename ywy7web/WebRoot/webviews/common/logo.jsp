<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content_logo">
	<div class="logo_img">
		<a href="http://www.ywy7.com">
			<c:if test="${nav == 'index' }">
				<img src="webviews/common/img/logo_home.jpg" width="230" height="120" />
			</c:if>
			<c:if test="${nav == 'xy' }">
				<img src="webviews/common/img/logo_xy.jpg" width="230" height="120" />
			</c:if>
			<c:if test="${nav == 'gl' }">
				<img src="webviews/common/img/logo_gl.jpg" width="230" height="120" />
			</c:if>
			<c:if test="${nav == 'lb' }">
				<img src="webviews/common/img/logo_lb.jpg" width="230" height="120" />
			</c:if>
			<c:if test="${nav == 'zx' }">
				<img src="webviews/common/img/logo_zx.jpg" width="230" height="120" />
			</c:if>
			<c:if test="${nav == 'sp' }">
				<img src="webviews/common/img/logo_sp.jpg" width="230" height="120" />
			</c:if>
		</a>
	</div>
	<div class="logo_search">
		<form id="search-form" action="/search.htm">
			<span class="search_text">
				<div class="search_select">全部</div>
				<input id="searchCondition" type="text" name="key" maxlength="100" placeholder="请输入搜索内容" class="search_condition" />
				</span>
			<input type="button" class="search_btn" />
		</form>
	</div>
</div>
<script type="text/javascript">
	$(".search_btn").click(function (){
		if ($('#searchCondition').val() == '') {
			return;
		}
		$("#search-form").submit();
	});
</script>