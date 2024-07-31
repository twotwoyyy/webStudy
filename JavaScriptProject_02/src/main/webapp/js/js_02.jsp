<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	  325page
      함수 / 배열 함수 / 객체 모델 / 객체 지향 / Jquery
      
      함수 (메소드)
      ==  =====
       차이점 : 메소드는 클래스 종속 (클래스 안에서만 사용) , 함수 : 독립적으로 사용이 가능
       공통점 : 기능 처리 / 반복 제거 / 재사용 / 구조적인 프로그램
       
       익명의 함수 : CallBack , 함수 = 변수형 처리
       function(){처리}
         window.onload=function(){}
         map(function(){})
         forEach(function(){})
                 ============ CallBack => 시스템에 의해 자동으로 호출되는 함수
       선언적 함수
        function 함수명(매개변수...){처리기능}
        
       => 함수의 구성 요소
          선언부 => 함수명 / 매개변수 => 리턴형은 작성하지 않는다 (리턴은 가능)
          구현부 => {
                      변수(지역변수)
                      연산처리
                      제어문
                  }
       => 종류별
          => 선언적인 함수
          리턴형(한개)  매개변수(여러개 사용이 가능)
           O          O
           function login(id,pwd)
           {             ======== let을 사용하지 않는다 => 변수명 설정
               return result
           }
           O          X
           function func_name()
           {
               return 결과값
           }
           X          O
           function func_name(매개변수...)
           {
           
           }
           X          X
           function func_name()
           {
           
           }
          
        익명의 함수 => 변수 선언 => function을 데이터형으로 취급 => 매개변수로 함수를 지정할 수 있다
        
        = 선언적인 함수
          function calc(x,y)
          {
              return x+y
          }
            => 호출 calc(10,20)
        = 익명의 함수
          let calc=function(x,y)
                   {
                      return x+y
                   }
            => 호출 calc(10,20)
          // 권장 사항
          let calc=(x,y)=>x+y
            => 호출 calc(10,20)
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function plus1(a,b)
{
   return a+b
}
let plus2=function(a,b)
{
   return a+b
}
let plus3=(a,b)=>{return a+b}
let plus4=(a,b)=>a+b
// =>는 function이나 return을 생략할 경우에 주로 사용 (화살표 함수 : 람다식 => 함수 포인터를 이용 : c언어, c++)
window.onload=function(){ // 자바의 main 역할 => 사용자 요청 onclick onmouseover...
   let a=10;
   let b=20;
   
   let c=plus1(a,b) // 호출
   let d=plus2(a,b)
   let e=plus3(a,b)
   let f=plus4(a,b)
   
   document.write("c="+c+","+typeof plus1+"<br>")
   document.write("d="+d+","+typeof plus2+"<br>")
   document.write("e="+e+","+typeof plus3+"<br>")
   document.write("f="+f+","+typeof plus4+"<br>")
   
}
</script>
</head>
<body>

</body>
</html>