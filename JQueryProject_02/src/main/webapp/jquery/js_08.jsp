<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
									   브라우저 내장 객체 = 계층형 구조로 되어있다 (tree) 
									   ==============
						              window : 브라우저
						                   |
						  ====================================
						  |             |         |          |
					   document     history    location    frame 
					   :화면 출력     :이동 기록   :화면 이동    :화면 구성 
					      |
					    form 
					     |
			      =================
			      |     |    |    |
			    form   img   a   ....
			      |
		   ====================
		   |       |        |
		  input  select  textarea  ===> 계층형 구조 (window 생략) => document.form.input...
		  
	window : close() : 윈도우 닫기 기능, open() : 브라우저 열기(팝업창 등), scrollbar .. => 브라우저와 관련 
	         =====================================================
	         setTimeout()
	          => 실행 후 종료 => 한 번만 실행 
	          => ex) 회원 가입 => 이미지 (회원가입 축하 이미지) => main으로 이동 
	         setInterval()
	          => 계속 실행/수행 
	          => ex) 날씨, 실시간 인기 순위, 판매... 
	          
	document : <body> 안에 있는 태그를 제어 
	   => createElement(), write, querySelector, appendChild()...
	   
	history : 브라우저 기록 정보
	   => back(): 뒤로, go(-1):이전의 이전, forward() : 앞으로 
	   
	location : 주소 정보 => GET 방식만 사용 가능 
	   => href : 이동할 위치 지정 => sendRedirect() 
	
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브라우저 내장 객체</title>
<script type="text/javascript">
	window.onload=()=>{
		let btn=document.querySelector("button")
		btn.addEventListener('click',()=>{
			window.open('js_07.jsp','winname','width=500,height=700,scrollboars=yes') // 이동할 파일, 이름 지정, 옵션
		})
	}
</script>
</head>
<body>
	<button>클릭</button>
</body>
</html>