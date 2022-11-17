<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<input type="hidden" name="idx" value=${ vo.idx }>
		<table border="1" align="center">
			<tr>
				<th>제목</th>
				<td><input name="subject" value=${ vo.subject }></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="name" value=${ vo.name }></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="60">${ vo.content }</textarea></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" value=${ vo.pwd }></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" value="수정하기" onclick="send(this.form)">
					<input type="button" value="취소" onclick="location.href='list.do?page=${param.page}'">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- Ajax 사용을 위한 js를 로드 -->
	<script src="/bbs/resources/js/httpRequest.js"></script>
	
	<script>
		function send(f) {
			let subject = f.subject.value;
			let name = f.name.value;
			let content = f.content.value.trim(); // trip : 띄어쓰기 제거 공백 불가
			let pwd = f.pwd.value.trim();
			
			// 유효성 체크
			if ( subject == '' ) {
				alert("제목은 필수입니다");
				return;
			}
			
			if ( name == '' ) {
				alert("이름은 필수입니다");
				return;
			}
			
			if ( content == '' ) {
				alert("내용은 한글자 이상 필수입니다");
				return;
			}
			
			if ( pwd == '' ) {
				alert("비밀번호는 필수입니다");
				return;
			}
			
			let url = "modify.do";
			let param = "idx=" + f.idx.value +
						"&subject=" + f.subject.value + 
						"&name=" + f.name.value + 
						"&content=" + encodeURIComponent(f.content.value) + 
						"&pwd=" + encodeURIComponent(f.pwd.value) + 
						"&page=" + ${param.page};
			sendRequest( url, param, sendCallback, "POST" )
		}
		
		function sendCallback() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				// "{'result':'no'}"
				let data = xhr.responseText;
				
				// 문자열 구조로 넘어온 data를 실제 JSON타입으로 변경
				let json = (new Function('return'+data)());
				
				if ( json.result == "no" ) {
					alert("수정실패");
					return;
				}
				
				alert("수정성공");
				location.href="list.do?page=${param.page}";
				
			}
		}
	</script>
</body>
</html>