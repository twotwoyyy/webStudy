<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	EL은 out.println() => 데이터를 출력 (브라우저) => 결과값을 출력
	=> 조건 / 연산자 
	
	연산자
	  산술연산자 
	    +, -, *, /, %
		 +
		    => 순수하게 산술 처리만 가능 ( + : 문자열 결하빙 불가하다) 
		    => "10" => 자동으로 Integer.parseInt()
		    ${10+10} => 20
		    ${10+"10"} => 20
		          == 정수 변경
		    ${null+10} => 10
		      ==== 자동으로 0으로 대체 
		    => 문자열 결합 하고 싶다면 (+=)
		       ${10 += "10"} => 1010
	     / 
	        => 나누기 => 정수/정수=실수
	        ${5/2}, ${5 div 2}
	     %
	        ${5%2}=> 1
	        ${5 mod 2}
	  비교연산자 : ==(eq), !=(ne), <(lt), >(gt), <=(le), >=(ge)
	  논리연산자 : 두 개의 조건을 처리 
	            && : 범위, 기간 포함 => and 
	            == 직렬 연산자 : 조건 두 개가 true일 때만 true
	            || : 범위 벗어날 경우 => or 
	            == 병렬 연산자 : 조건 중 한 개 이상이 true일 경우에 true 
	  
	  삼항연산자 : (조건)?값1:값2
	            조건이 true면 값 1 false면 값 2 
	            => 페이지 처리 (소스 간결하게 만든다) if~else 
	  
	  
	  &#36; 는 $표시이다

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>산술 연산자(EL)</h1>
<%--	
	&#36;{10+10}=${10+10}<br>
	&#36;{10+"10"}=${10+"10"} <br> => 자동으로 정수형 변경 => 공백이 있으면 오류 발생
	&#36;{null+10}=${null+10} <br> => null인 경우에는 자동으로 0값으로 인식
	&#36;{10-"1"}=${10-"1"} <br>
	&#36;{5/2}=${5/2}<br> => 정수/정수 = 실수
	&#36;{5 div 2}=${5 div 2}<br>
	&#36;{5%2}=${5%2}<br>
	&#36;{5 mod 2}=${5 mod 2}<br>
	&#36;{10+="10"}=${10+="10"}<br> => 문자열 결합시에는 +=  --%>
	
	<h1>비교 연산자(EL) : ==, !=, &lt;, &gt;, &lt;=, &gt;= 결과값은 true/false:조건문</h1>
	<%--
			==  10==10 10 eq 10 
			!=  10!=10 10 ne 10 
			<   10<10  10 lt 10
			>   10>10  10 gt 10 
			<=  10<=10 10 le 10
			>=  10>=10 10 ge 10 
			
			/ div 
			% mod 
			&& and 
			|| or 
	 --%>
	<sub>비교 연산자는 숫자, 문자열, 날짜까지 비교 가능</sub><br>
<%-- 	&#36;{10==10 }=${10==10}<br>
	&#36;{10 eq 10 }=${10 eq 10}<br>
	&#36;{10!=10 }=${10!=10}<br>
	&#36;{10 ne 10 }=${10 ne 10}<br>
	&#36;{10<10 }=${10<10}<br>
	&#36;{10 lt 10 }=${10 lt 10}<br>
	&#36;{10>10 }=${10>10}<br>
	&#36;{10 gt 10 }=${10 gt 10}<br>
	&#36;{10<=10 }=${10<=10}<br>
	&#36;{10 le 10 }=${10 le 10}<br>
	&#36;{10>=10 }=${10>=10}<br>
	&#36;{10 ge 10 }=${10 ge 10}<br> --%>

<%--	
	&#36;{"홍길동"=="심청이"}=${"홍길동"=="심청이"}<br>
	&#36;{"홍길동" eq "심청이"}=${"홍길동" eq "심청이"}<br>
	<br>
	&#36;{"홍길동"!="심청이"}=${"홍길동"!="심청이"}<br>
	&#36;{"홍길동" ne "심청이"}=${"홍길동" ne "심청이"}<br>
	<br>
	&#36;{"홍길동"<"심청이"}=${"홍길동"<"심청이"}<br>
	&#36;{"홍길동" lt "심청이"}=${"홍길동" lt "심청이"}<br>
	<br>
	&#36;{"홍길동">"심청이"}=${"홍길동">"심청이"}<br>
	&#36;{"홍길동" gt "심청이"}=${"홍길동" gt "심청이"}<br>
	<br>
	&#36;{"홍길동"<="심청이"}=${"홍길동"<="심청이"}<br>
	&#36;{"홍길동" le "심청이"}=${"홍길동" le "심청이"}<br>
	<br>
	&#36;{"홍길동">="심청이"}=${"홍길동">="심청이"}<br>
	&#36;{"홍길동" ge "심청이"}=${"홍길동" ge "심청이"}<br>
--%>
<h1>논리 연산자(EL) : &&, || </h1>   

<%--
	&#36;{10>6 && 5==6} = ${10>6 && 5==6}<br>
	&#36;{10>6 and 5==6} = ${10>6 and 5==6}<br>
	<br>
	&#36;{10>6 || 5==6} = ${10>6 || 5==6}<br>
	&#36;{10>6 or 5==6} = ${10>6 or 5==6}<br>
	<br>
		--%>
<h1>삼항 연산자(EL) : (조건)?값1:값2 </h1>   
<%--
	&#36; {10>6?"A":"B"}=${10>6?"A":"B"}
--%>
</body>
</html>