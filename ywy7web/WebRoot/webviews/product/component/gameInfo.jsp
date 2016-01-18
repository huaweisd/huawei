<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="game-info">
   	<table width="100%" style="font-size:14px;">
    	<tr>
    		<td width="120" rowspan="5">
    			<img width="95px" height="95px" src="${fn:replace(content.gameImg, '..', 'http://www.ywy7.com') }"/>
    		</td>
    	</tr>
    	<tr>
    		<td>分类<td>
    		<td><script type="text/javascript">commonFn.convertGameType("${content.tType }");</script></td>
    		<td>大小</td>
    		<td>${content.fileSize }MB</td>
    		<td>游戏语言</td>
    		<td>中文</td>
    	</tr>
    	<tr>
    		<td>运行系统<td>
    		<td><script type="text/javascript">commonFn.convertOs("${content.gameSys }");</script></td>
    		<td>版本号</td>
    		<td>${content.field3 }</td>
    		<td>收费类型</td>
    		<td><script type="text/javascript">commonFn.convertPrice("${content.tprice }");</script></td>
    	</tr>
    	<tr>
    		<td colspan="1">开 发 商</td>
    		<td colspan="5">${content.field2 }</td>
    	</tr>
    	<tr>
    		<td colspan="1">运 营 商</td>
    		<td colspan="5">${content.opeartors }</td>
    	</tr>
    </table>
</div>