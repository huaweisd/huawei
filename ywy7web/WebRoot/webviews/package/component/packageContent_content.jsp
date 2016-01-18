<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="./search.jsp"></jsp:include>
<div id="mgrid">
	<div class="package_search_content">
		<h2>礼包列表</h2>
		<div class="lblist_content <c:if test="${nav_on == 2 || nav_on == 3}">h470</c:if>">
			<c:if test="${nav_on == 1}">
				<ul id="lblist_content"></ul>
			</c:if>
			<c:if test="${nav_on == 2 || nav_on == 3}">
				<div id="lblist_content"></div>
			</c:if>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		packageContentFn.searchPackage();
	})
</script>