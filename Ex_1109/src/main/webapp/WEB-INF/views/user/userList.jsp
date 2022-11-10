<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>가입일</th>
		<tr>
		
		<c:forEach var="v" items="${ list }">
			<tr>
				<td>${ v.idx }</td>
				<td>${ v.name }</td>
				<td>${ v.regdate }</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>