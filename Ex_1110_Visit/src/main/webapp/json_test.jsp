<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- JSON(Javascript Object Notation) : 서로 다른 플랫폼에서 데이터를 쉽게 교환하기 위한 표기법 -->
	
	<script>
		let p = {'name' : '일길동', 'age' : '30', 'tel' : '0101112222'}; // 홑따옴표로 하는게 좋다
		
		document.write( "이름 : " + p.name + "<br>나이 : " + p.age + "<br>" );
		
		let p_arr = [{'name' : '1길동', 'age' : '20'},
					 {'name' : '2길동', 'age' : '30', 'tel' : '0101111111'}];
		
		document.write( p_arr[0].name + " / " + p_arr[0].age + "<br>" );
		
		// JSON다차원 배열
		let course = { 'name' : '웹개발',
					   'start' : '2022-08-01',
					   'end' : '2022-01-01',
					   'sub' : ['java', 'web', 'android'],
					   'student' : [{'name' : 'hong', 'age' : '20', 'hobby' : ['a', 'b']},
						   			{'name' : 'kim', 'age' : '25'}] };
		
		document.write( "과목명 : " + course.name + "<br>" );
		document.write( course.sub[0] + " / " + course.sub[1] + " / " + course.sub[2] + "<br>" );
		document.write( course.student[0].name + " / " + course.student[0].age + "<br>" );
		document.write( course.student[0].hobby[0] );
	</script>
</body>
</html>