<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<head>
</head>
<body onload="getHeight()">
	<div id="content_id" style="min-height:600px;">
		${evaluation.content }
	</div>
	<script>
		function getHeight(){
			window.parent.setHeight( document.getElementById("content_id").offsetHeight + 20);
		}
	</script>
</body>
</html>