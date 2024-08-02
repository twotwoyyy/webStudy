<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSON : JavaScripnt Object Notation 
	       자바스크립트 객체 표현법 
	       => 자바 ===> 데이터를 자바스크립트로 전송 
	              JSON
	              ====
	              1. 웹에서 자바스크립트 
	              2. 모바일 (kotlin)
	       => key,value 구성 => key는 중복이 불가능 (자바 map)
	          =========
	          JSON => 라이브러리를 주로 사용 : json-simple (google), jackson(boot에 자동 첨부) 
	           => 데이터를 JSON으로 받아서 출력 : ajax, vueJS, react, nextJS => 보안 뛰어나다
	       => 목적 : 클라이언트와 서버의 데이터 교환 목적 (XML => JSON)
	                                              | Annotation
	          요청값 전송 
	          =========
	           => ajax : data:{id:'aaa',pwd:'1234'}
	           => axios: params:{id:'aaa',pwd:'1234'} => react-query,vue3
	          응답 받기
	          =======
	           => JSON => parser : 데이터를 HTML을 이용해서 출력
	           => 서버에서는 JSON을 문자열 형식으로 받는다
	                             ========= 자바스크립트 : JSON.parse()
	          형식
	          ===
	          {"sabun":1,"name":"홍길동","dept":"개발부"}
	          {"sabun":1,"name":"홍길동"}
	          {"name":"홍길동","dept":"개발부"} => 동일하지 않을 수도 있다 
	          
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON.parse</title>
<script type="text/javascript">
	window.onload=()=>{
		let info={name:"홍길동",age:20,sex:"남자"}
		let data=JSON.stringify(info) // JSON을 문자열로 변환
		console.log(data) 
		let change=JSON.parse(data) // JSON.parse => parse로 문자열을 JSON으로 변환 (원상복귀) 
		console.log(change)
	}
</script>
</head>
<body>

</body>
</html>