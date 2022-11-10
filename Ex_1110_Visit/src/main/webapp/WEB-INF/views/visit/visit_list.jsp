<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/vs/resources/css/visit.css">
</head>
<body>
	<div id="main_box">
		<h1>:::방명록 리스트:::</h1>
		
		<div align="center">
			<input type="button" value="글쓰기"
				   onclick="location.href='insert_form.do'">
		</div>
	</div>
	
	<c:forEach var="vo" items="${ list }">
		<div class="visit_box">
			<div class="type_content"><pre>${ vo.content }</pre></div>
			<div class="type_name">${ vo.name }(${ vo.ip })</div>
			<div class="type_regdate">작성일 : ${ vo.regdate }</div>
			
			<form action="aaa.do">
				<input type="hidden" name="idx" value="${ vo.idx }">
				<input type="hidden" name="pwd" value="${ vo.pwd }">
				비밀번호 : <input type="password" name="c_pwd">
				<input type="button" value="수정" onclick="modify(this.form);">
				<input type="button" value="삭제" onclick="del(this.form)">
			</form>
			
		</div>
		
		
	</c:forEach>
	
</body>
</html>