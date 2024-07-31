<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	논리 연산자 : &&, || 
	  (조건) && (조건) => 범위/기간 포함
	  =====   ======
	    |        |
	    ==========
	        |
	      결과값 : true/ false
	      
	  (조건) || (조건) => 범위/기간 포함
	  =====   ======
	    |        |
	    ==========
	        |
	      결과값 : true/ false
	      
	 && : 직렬 연산자 => 조건 두 개가 동시에 true => true
	 || : 병렬 연산자 => 조건 두 개중에 한 개 이상 true => true
	 
	 ==================================
	                     &&      || 
	 ==================================
	  true  true        true    true
	 ==================================
	  true  false      false    true 
     ==================================
      false  true      false    true
     ==================================
      false false      false    false
     ==================================	      
	   
	  대입연산자 
      = 
      +=
      -= 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
 *   1. Jquery : $(function(){})
     2. VueJS : mounted()
     3. React : useEffect()
 */
window.onload=function(){
   // 논리연산자
   let i=(6<7) && (6===7) // i=false
   console.log("i="+i) 
   let j=(6<7) || (6===7) // j=true
   console.log("j="+j) 
   
   // 대입연산자
   let k=10;
   //  대입연산자
   console.log("k="+k) //k=10
   k+=20 //k=k+20
   console.log("k="+k) //k=30
   k-=10 
   console.log("k="+k) //k=20
   
   let m=(6%2==0)?"짝수":"홀수" // if~else // m=짝수
    console.log("m="+m)
    
    let n=10/0
    console.log("n="+n) // infinity => 0으로 나눈 경우에 출력하는 값
    
    /*
    	Object : 배열 / 객체
    	         []    {}  => 값이 없는 경우 null
    	연산 처리 에러 : NaN
    	0으로 나눈 경우 : Infinity
    	=> 브라우저 안에 에러가 출력되지 않는다 (흰 화면만 출력) => 개발자 도구에서 확인
    	변수에 초기화가 안 된 경우 : undefined
    	=> 정수/정수=실수
    	=> HTML에 입력한 모든 값은 문자열이다 => 형변환 필수
    	   String(변경할 데이터값), Number(변경할 데이터값), Boolean(변경할 데이터값)
    	                                            | 숫자인 경우 => 0/0.0 제외 true
    	                                            | 배열, 객체 => null
    	
    	=> Ajax / VueJS / ReactJS => 자바스크립트
    	===========================
    		| 자바에서 데이터 전송
    		| 자바스크립트는 데이터를 읽을 수 없다, 오라클 연결이 안 된다 
    		| 대소문자 구분 
    */
}
</script>
</head>
<body>

</body>
</html>