<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 파일전송시
	enctype="multipart/form-data"
	method="POST"
	속성이 필수적으로 추가되어 있어야 한다 -->
	<form method="POST" enctype="multipart/form-data">
		<table border="1" align="center">
			<caption>:::새 글 쓰기:::</caption>
			
			<tr>
				<th>작성자</th>
				<td>
					<input name="name">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="50" name="content"></textarea>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd">
				</td>
			</tr>
			
			<tr>
				<th>파일첨부</th>
				<td><input type="file" name="photo"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="글쓰기" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		function send(f) {
			let name = f.name.value;
			let content = f.content.value;
			let pwd = f.pwd.value;
			// 유효성 체크
			if ( name == '' ) {
				alert("이름은 필수입니다.");
				return;
			}
			if ( content == '' ) {
				alert("내용은 필수입니다.");
				return;
			}
			if ( pwd == '' ) {
				alert("비밀번호는 필수입니다.");
				return;
			}
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
		}
	</script>
</body>
</html>