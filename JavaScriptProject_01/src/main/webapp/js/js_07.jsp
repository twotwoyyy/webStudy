<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	if ~ else : true와 false를 나눠서 처리 
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	// 화면에 HTML이 실행되면 수행하는 함수 => onload : 단점은 리턴형을 쓰지 않는다, 매개변수의 데이터형을 사용하지 않는다
	// function login(let id, let pwd) => (x) 오류 
	// function login(id,pwd) => (o) 
	/*let a=prompt("정수 입력: ") // prompt : 입력값 받는 팝업창 
	console.log("a="+a)
	if(a%2===0){
		document.write(a+"=> 짝수입니다")
	}else{
		document.write(a+"=> 홀수입니다")
	}*/
	let user=prompt("ID 입력: ")
	if(user==="admin"){
		document.write("관리자로 입장")
	}else{
		document.write("사용자로 입장")
	}
}
</script>
</head>
<body>

</body>
</html>