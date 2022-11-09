<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(forEach, if...)를 사용하기 위해 라이브러리를 등록 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- DB에서 가져온 부서목록을 테이블로 출력 -->
	<table border="1">
		
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
			
			<c:forEach var="vo" items="${ m_list }">
				
			<tr>
				<td>${ vo.deptno }</td>
				<td>${ vo.dname }</td>
				<td>${ vo.loc }</td>
			</tr>
				
			</c:forEach>
			
		</tr>
		
	</table>
	
</body>
</html>