<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	Jquery: 자바스크립트 라이브러리
	1. 라이브러리 다운로드 / 원격 
	   원격
	   <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	   *** jquery => 충돌이 되면 안된다
	   *** 라이브러리는 반드시 main.jsp => CSS
	2. Jquery의 시작
	   자바스크립트의 시작 : window.onload=function(){}
	   => $(document).ready(function(){소스 코딩}) // 예전 코드
	   => $(function(){소스 코딩}) // 현재 코드
	3. Jquery의 함수 => $ 
	                  == document.querySelector()
	                  => document.querySelector("h1")
	                     $('h1') : tag명
	                  => document.querySelector("#id")
	                     $('#id') : id명
	                  => document.querySelector(".id")
 					     $('.id') : 클래스명
 					  => 기타 : 속성 선택자, 자손, 후손, 가상 선택자 .. (CSS 선택자와 동일)
 	4. jquery => 내장 객체 => window, document, location, history
 	             $(window) $(document) $(location) $(history)
 	5. 이벤트 처리 / 유효성 검사 / 다른 파일의 데이터 읽기 (Ajax)
 	   1) 이벤트 
 	      => Listener
 	      $().on('이벤트명',function(){})
 	             click, keyup, hover, keydown ...
 	      $().on('이벤트명',()=>{})
 	      => 일반 이벤트 
 	      $().click(function(){})
 	      $().keyup(function(){})...
 	      === 태그 읽기  
	6. Jquery에서 지원하는 함수 
	   1) getter/setter
	      갑 읽기  값 설정
	      ex) <input type="text"> <textarea> <select> : 입력창 
	          => $().val() => value값 가져올 때 사용 
	             ========= getter 
	             $().val(값)
	             ========= setter 
	          => <td>|||||</td>
	             $('td').text() : getter => 값을 읽기
	             $('td').text("Hello") : setter => 값을 저장 
	             
	          => <a href="">
	             $('a').attr("href") => getter
	             $('a').attr("href"."값") => setter
	             
	          => html(), html(값) => innerHTML => 한 개만 생성
	          => append() => createElement() => 여러 개 생성 
	          
	      => Jquery UI => 효과 
	      => AJax 
	7. CSS 적용 => css("속성","값")
	              css({"속성": 값, "속성":값...)}
	                   ----- CSS가 가지고 있는 속성
	                         - : 대문자 
	                         margin-top : marginTop
	                         background-color : backgroundColor
	   Jquery는 DOMScript
	           ========== 태그를 제어하는 프로그램      
	           ** 라이브러리가 무겁다 = 서버 속도가 늦어진다 
	     
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jquery 함수 정리, val 값추가</title>
<!-- 라이브러리 추가  -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function(){
		// window.onload=function(){}와 동일 
		// setter => val("값")
		$('#name').val("홍길동") // 값 추가
		// 이벤트 처리
		$('button').on('click',function(){
			let addr=$('#addr').val() // 입력값을 읽기 => 로그인 
			alert(addr)
		})
	})
</script>
</head>
<body>
	<input type="text" id="name" size="15"><br>
	<input type="text" id="addr" size="15">
	<button>클릭</button>
</body>
</html>