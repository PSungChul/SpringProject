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
		<input type="hidden" name="idx" value="${ vo.idx }">
		
		<table border="1" align="center">
			<caption>:::글 수정:::</caption>
			
			<tr>
				<th>작성자</th>
				<td>
					<input name="name" value="${ vo.name }">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><pre><textarea rows="5" cols="50" name="content">${ vo.content }</textarea></pre></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" value="${ vo.pwd }">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="send(this.form);">
					<input type="button" value="취소" onclick="location.href='list.do'">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- Ajax활용을 위한 js파일 로드 -->
	<script src="/vs/resources/js/httpRequest.js"></script>
	
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
			
			// encodeURIComponent : 특수문자가 포함되어 있는 경우에 내용을 그대로 서버에 전달하기 위한 메소드
			// modify.do?idx=2&name=hong&content=가나다&pwd=1111
			let url = "modify.do";
			let param = "idx=" + f.idx.value + 
						"&name=" + f.name.value + 
						"&content=" + encodeURIComponent(f.content.value) + 
						"&pwd=" + encodeURIComponent(f.pwd.value);
			
			sendRequest( url, param, sendCallback, "POST" )
		}
		
		function sendCallback() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				// "{'result':'no'}"
				let data = xhr.responseText;
				
				/*if ( data == "no" ) {
					alert("수정실패");
					return;
				}*/
				
				// 문자열 구조로 넘어온 data를 실제 JSON타입으로 변경
				let json = (new Function('return'+data)());
				
				if ( json.result == "no" ) {
					alert("수정실패");
					return;
				}
				
				alert("수정성공");
				location.href="list.do";
				
			}
		}
		
	</script>
</body>
</html>