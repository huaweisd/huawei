<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<h2 class="margint10">猜你喜欢</h2>
<div class="cnxh-content-wrap">
	<div class="cnxh-content">
		<ul>
			<c:forEach items="${cnxh }" var="i">
				<a href="/product/${i.productsID }.htm">
					<li>
						<img width=90 height=90 src="${fn:replace(i.gameImg, '..', 'http://www.ywy7.com')}"/>
						<p>${i.gameName }</p>
					</li>
				</a>
			</c:forEach>
			
		</ul>
	</div>
</div>

