<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <h2 class="margint10">热门攻略</h2>
 <div class='rmgl-content-wrap'>
 	<div class='rmgl-content'>
 		<ul>
 			<c:forEach items="${gl }" var="i">
 				<a href="/raiders/${i.id }.htm">
	 				<li>
		 				<img width=180 height=115 src="${fn:replace(i.timg, '..', 'http://www.ywy7.com')}"/>
		 				<p class="rmlb-title">${i.title}</p>
		 			</li>
	 			</a>
 			</c:forEach>
 		</ul>
 	</div>
 </div>