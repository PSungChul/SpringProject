<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a {
		text-decoration: none;
		color: black;
	}
	
	table {
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<table border="1" align="center" width="700">
		<caption>::: 게시판 :::</caption>
		
		<tr>
			<th width="50">번호</th>
			<th>제목</th>
			<th width="120">작성자</th>
			<th width="120">작성일</th>
			<th width="55">조회수</th>
		</tr>
		
		<c:forEach var="vo" items="${ list }">
			<tr>
				<td align="center">${ vo.idx }</td>
				
				<td>
					<!-- 댓글 들여쓰기 -->
					<c:forEach begin="1" end="${ vo.depth }">&nbsp;</c:forEach>
					
					<!-- 댓글 기호 -->
					<c:if test="${ vo.depth ne 0 }">
					ㄴ
					</c:if>
					
					<a href="view.do?idx=${vo.idx}">${ vo.subject }</a>
				</td>
				
				<td align="center">${ vo.name }</td>
				<td align="center">${fn:split(vo.regdate, ' ')[0]}</td>
				<td align="center">${ vo.readhit }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center">
				&lt; 1 2 3 &gt;
			</td>
		</tr>
		
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="새글쓰기" onclick="location.href='insert_form.do'">
			</td>
		</tr>
		
	</table>
	
</body>
</html>