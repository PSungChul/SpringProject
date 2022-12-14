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
	<form id="ff">
		<input type="hidden" name="pwd" value=${ vo.pwd }>
		<input type="hidden" name="idx" value=${ vo.idx }>
		<table border="1" align="center" width="600">
			<caption>::: 상세보기 :::</caption>
			<tr>
				<td>제목</td>
				<td>${ vo.subject }</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>${ vo.name }</td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td>${ vo.regdate }</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><pre>${ vo.content }</pre></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" value="목록보기" onclick="location.href='list.do?page=${param.page}'">
					
					<c:if test="${ vo.depth eq 0 }">
						<input type="button" value="댓글" onclick="reply()">
					</c:if>
					
					<input type="button" value="수정" onclick="modify()">
					
					<input type="button" value="삭제" onclick="del()">
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="c_pwd"></td>
			</tr>
		</table>
	</form>
	
	<!-- Ajax 사용을 위한 js를 로드 -->
	<script src="/bbs/resources/js/httpRequest.js"></script>
	
	<script>
		function reply() {
			
			location.href="reply_form.do?idx=${vo.idx}&page=${param.page}";
			
		}
		
		function del() {
			// form태그 검색
			let ff = document.getElementById("ff");
			let c_pwd = ff.c_pwd.value;
			
			if ( c_pwd != ${vo.pwd} ) {
				alert("비밀번호 불일치");
				return;
			}
			
			if ( !confirm("삭제 하시겠습니까?") ) {
				return;
			}
			
			// 삭제를 위한 게시글의 idx를 DB로 전달
			let url = "del.do";
			let param = "idx=${vo.idx}";
			sendRequest(url, param, resultFn, "post");
		}
		
		function resultFn() {
			
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				
				// "no" or "yes"
				let data = xhr.responseText;
				
				if ( data == "no" ) {
					alert("삭제실패");
					return;
				}
				
				alert("삭제성공");
				location.href="list.do?page=${param.page}";
				
			}
			
		}
		
		function modify() {
			let ff = document.getElementById("ff");
			let pwd = ff.pwd.value;
			let c_pwd = ff.c_pwd.value;
			
			if ( c_pwd != pwd ) {
				alert("비밀번호 불일치");
				return;
			}
			
			ff.action = "modify_form.do?page=${param.page}";
			ff.method = "post";
			ff.submit();
			
		}
	</script>
</body>
</html>