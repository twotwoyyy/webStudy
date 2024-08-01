<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	
	=> 태그, 속성을 제어하는 프로그램
	=> 태그를 가지고 오는 방법
	   document.querySelector("")
	   --------------------------
	                ${""} => CSS
	   Jquery => selector : 태그를 찾아서 제어하는 방식
	             ========
	             id => ${"#id명"}
	             class => ${'class명'}
	             tag => ${'태그명'}
	             tag => ${'div span'}
	             tag => ${'div>span'}
	             tag => ${'input[type="button"]'}
	             
	             => display:none => hide()
	                display:''   => show()
	             => css 제어 => css("속성","값")
	                           css({"속성":값,속성:값...})
    => 라이브러리 추가
       <script src="URL"> => CDN : Vue/React
	             
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- 라이브러리 로드 -->
<script type="text/javascript">
// window.onload=function(){} => $(function(){}) => jquery 시작
$(function(){
	// 1. 문법은 자바스크립트 => 변수, 연산자, 제어문 ... 함수 사용도 가능 
	$('h1').css("color","red")
	// document.querySelector("h1").style.color=red
	$('.a').css("color","blue")
	$('#b').css("color","green")
	// selector : 태그 => CSS
	// jquery / ajax / vue / react => 자바스크립트 
	// 브라우저 안에서 태그를 제어하는 프로그램 
	// 크롤링 
})
</script>
</head>
<body>
	<h1>Hello Jquery1</h1>
	<h1 class="a">Hello Jquery2</h1>
	<h1>Hello Jquery3</h1>
	<h1>Hello Jquery4</h1>
	<h1 id="b">Hello Jquery5</h1>
</body>
</html>