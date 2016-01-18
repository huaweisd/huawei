<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <jsp:include page="../../common/common.jsp" />
  <style>
  	.game-info-lb-content:after{content:"";display:block;clear:both;}
  	.game-info-lb-content ul{width:210px;padding:4px 12px;float:left;}
  	.game-info-lb-content ul:after{content:"";display:block;clear:both;}
  </style>
  </head>
  
  <body>
  	<div class="game-info-lb">
  		<h2>礼包</h2>
  		<div class="game-info-lb-content">
  			<c:forEach items="${lb }" var="i">
  				<a style="display:block;float:left" href="/package/${i.id }.htm">
	  				<ul>
		  				<li class="pica">
	  						<img width="210px" height="105px" src="${fn:replace(i.timg, '..', 'http://www.ywy7.com')}"/>
		  				</li>
		  				<li>${i.gameName }</li>
		  				<li style="float:right">详情</li>
		  			</ul>
	  			</a>
  			</c:forEach>
  			
  		</div>
  	</div>
  </body>
</html>
