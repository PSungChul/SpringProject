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
		<table border="1" align="center">
			<tr>
				<th>ID : </th>
				<td><input name="id"></td>
			</tr>
			
			<tr>
				<th>PWD : </th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="로그인" onclick="send(this.form)">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- Ajax사용을 위한 js를 추가 -->
	<script src="/check/resources/js/httpRequest.js"></script>
	
	<script>
		function send(f) {
			
			let id = f.id.value;
			let pwd = f.pwd.value;
			
			// 유효성 체크
			if ( id == '' ) {
				alert("아이디를 입력하세요");
				return;
			}
			
			if ( pwd == '' ) {
				alert("비밀번호를 입력하세요");
				return;
			}
			
			// Ajax로 ID와 PWD를 전달
			let url = "login_check.do";
			let param = "id=" + id + "&pwd=" + pwd;
			sendRequest(url, param, resultFn, "POST");
		}
		
		function resultFn() {
			
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				// "{'result:'clear'}"
				let data = xhr.responseText;
				
				// 서버에서 넘어온 데이터를 실제 JSON형식으로 변환
				var json = (new Function('return'+data))();
				
				if ( json.result == 'no_id' ) {
					alert("아이디가 존재하지 않습니다");
					return;
					
				} else if ( json.result == 'no_pwd' ) {
					alert("비밀번호 불일치");
					return;
				}
				
				alert("로그인 성공");
				location.href="main.do";
				}
			
		}
	</script>
</body>
</html>