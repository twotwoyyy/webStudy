<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	내장 객체
	 String : 자바와 유사 
	   1) substring()
	   2) trim()
	   3) replace()
	   4) split()
	   5) indexOf()
	   6) slice()
	 Math
	   1) random()
	   2) round()
	 Array
	   1) push()
	   2) pop()
	   3) sort()
	   4) slice()
	 Date
	   1) get() 
	   
	   => 코딩 테스트 
	      자동차 : 번호판 문제 
	      
	 Date => 날짜 시간 관리하는 내장 객체
	 let today=new Date()
	 today.getFullYear() : 년도 읽기
	 today.getMonth()+1 : 월 읽기
	 today.getDate() : 일 읽기 
	      
	 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 Date</title>
<script type="text/javascript">
	window.onload=()=>{
		let today=new Date() // 클래스형 (new로 메모리 할당)
		/*
			class Sawon(
				init:function(){
					
				}
			)
			=> class형에서 function으로 변경 (hooks)
		*/
		let year=today.getFullYear()
		let month=today.getMonth()+1
		let day=today.getDate()
		let week=today.getDay()
		let strWeek=["일","월","화","수","목","금","토"] // week 0부터 시작 
		document.write(year+"년도 "+month+"월"+day+"일 "+strWeek[week]+"요일")
	}
</script>
</head>
<body>

</body>
</html>