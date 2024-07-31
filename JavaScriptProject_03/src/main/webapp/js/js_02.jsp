<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	객체 모델 => HTML의 태그를 객체로 본다 
	          태그명 : 객체명 
	          속성명 : 멤버변수 
	          => 태그를 선택 => 제어 => selector 
	          => 
	태그 제어 / CSS 적용
	         document.querySelector() => 태그를 가지고 온다 
	         => css 적용 
	         let td=document.querySelector()
	         td.style.color='red' 
	         <td style="">
	         
	         <a href> a:객체, href:변수
	         태그 : 1개 => Element document.querySelector() => id 속성
	             여러 개 => Elements document.querySelectorAll() => class 속성, 태그명 
	=> 내장 객체
	=> 브라우저 객체
	=> 라이브러리 (JQuery)
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1=document.querySelectorAll("h1")
	console.log(typeof h1)
	for(let i=0;i<h1.length;i++){
		h1[i].style.backgroundColor='green'
	}
	let h2=document.querySelector("h2")
	h2.style.color='blue'
}
/*
 *     351page
       문서 객체 선택 => 태그를 가지고 오는 함수 
       1개 선택 
         document.getElementById(아이디명) => 아이디 속성은 중복이 없는 속성이기 때문에 
                   같은 아이디를 사용할 수 있다 => 자바스크립트나 라이브러리에서 오류 발생 
         document.querySelector(CSS selector)
                                태그명 / id명 / class명 / 후손 / 자손 / 속성 선택자 
       여러 개 선택 => 배열 => 라디오 버튼, 체크 버튼 
         document.getElementByClassName(클래스명)
         document.querySelectorAll("")
         
 */
</script>
</head>
<body>
	<h1> Hello JavaScript!!-1 </h1>
	<h2> Hello JavaScript!! </h2>
	<h1> Hello JavaScript!!-2</h1>
</body>
</html>