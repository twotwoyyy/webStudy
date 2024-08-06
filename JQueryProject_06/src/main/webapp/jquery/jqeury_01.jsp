<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
      자바스크립트 : 태그를 제어, 이벤트 처리, 사용자 입력 제어, 동적페이지, 애니메이션
      ======= 브라우저에서 제어 (클라이언트)
      
      자바스크립트 사용방법
      1) 내부 스크립트 : 한 개의 파일에서만 제어
         <head>
           <script type="text/javascript">
             함수
             window.onload=function()
             {
             }
           </script>
         </head>
      2) 외부 스크립트 => <body>
         <head>
           <script type="" src="파일경로/URL">
         </head>
      3) 인라인 스크립트
         <a href="javascript:함수호출">
         
         => jqeury / vue / react / next => 자바 스크립트 라이브러리 (자바스크립트로 처리)
         => mybatis / jpa / spring => 자바 라이브러리 => 자바 적용
       => 자바 스크립트 변수 선언
         let, var, const => 값 적용에 따라 => 데이터형을 자동으로 설정
              === scope(범위)가 명확하지 않다 ES5 => 메모리에 남아있다 (메모리 누수현상)
         === scope를 명확하게 만들어준다 ES6 => 사용범위가 명확하다 
       => 자바스크립트에서 사용하는 데이터형 
          number : 숫자형 => int,double 
          string : 문자형 => char, string => ''/""
          boolean : true / false => 숫자도 가능 => 0,0.0을 제외한 모든 숫자는 true 
          array : 배열 => [] => object 단위 => 데이터를 섞어 사용 가능
          object : {} => {키:값, 키:값, 키:값 ...} => JSON
          undefined : 변수에 값이 없는 경우 (초기화가 없는 상태) 
          function : 함수 => 매개변수로 사용이 가능 => Callback 
                                                 ========
                                                 시스템에 의해 자동 호출 
                     map(function(){}), forEach(function(){}),
                     $().click(function(){}) => 이런 예시가 모두 Callback 
          ================= 확인 시에는 typeof 변수명 => 어떤 데이터인지 확인 가능
       => 연산자 
          산술연산자 : +,-,*,/,%
                    +는 문자열 결합이 가능
                    / 정수/정수=실수
          단항연산자 : ++, -- 
          ===================================
          비교연산자 : ===, !==, <, >, <=, >=
          논리연산자 : &&, ||, ! 
          =================================== 숫자말고도 문자,날짜까지 비교 가능 
          대입연산자 : =, +=, -=
          형변환연산자 : HTML에서 읽어오는 모든 데이터는 문자열(String)
             숫자변환 : Number("10"), parseInt("10")
             문자변환 : String(10)
             논리변환 : Boolean("true") => 0,0.0아니면 모두 true
       => 제어문
          조건문 : if, if~else
          반복문 : for, for of 
                 ============
                 일반 for는 사용
                 for of => map(), forEach() 
          반복제어 : break 
          
       => 배열 : [], 객체 : {}
       => Restful => 다른 프로그램과 연동
                     자바  <=>  자바스크립트 연동
                     ~VO       {}
                     List      [] => JSON/JSONP/클로저/호이스팅 
       => 가장 많이 등장
          함수 
          function 함수명(매개변수...){}
          let 함수명=function(){}
          let 함수명=()=>{}
          ================== vue / react
          
          useEffect(){
          	이벤트를 설정 
          	function 함수명?(매개변수..){}(X)
          	let 함수명=()=>{} (O) 
          }
          
      자바스크립트에서 지원하는 기본 객체
      String : 문자열
       = substring(시작인덱스,끝인덱스) : 문자열을 자르는 경우
         =========          ====== -1
         => 인덱스 번호는 0번부터 시작 
       = indexOf() : 찾기
       = length()
       = split() : 분리 => []
       = trim() : 공백 제거
      Number : 숫자
       = 형변환
       = NaN => 연산처리가 안 된 경우
      Array : 배열
       = map() => for
       = push() => 배열 추가
       = pop() => 마지막 제거
       = slice(start,end) => 새로운 배열을 만든다
       = ... 연산자 => 그대로 복사
       [1,2,3,4,5]
       [....6,7,8]
      Math : 수학
       = ceil(), round(), random()
      Date : 날짜
       = getFullYear()
       = getMonth()
       = getDate()
       = getDay() => 요일 
      ===================================
      브라우저 객체 
                             브라우저제어
		                      window => open(), close(), scrollbar 
		                         |
		       ===================================
		       |        |           |            |        
		    location  document    history      event 
		    화면이동    화면제어      기록         이벤트처리
		    href()    write()     back, go()  function aaa(event)
		              querySelector()
      ===============================================================
      => 라이브러리 
         jquery : 단순하게 만든 라이브러리 => 사용빈도가 욕심 => 라이브러리가 방대(속도 저하)
      ===============================================================
      jquery : 대부분이 브라우저에서 사용 가능 (호환성)
      = HTML (DOM=트리 형태로 저장)를 쉽게 조작 가능, 간단하게 CSS 적용 가능
        예) 
            let a=document.querySelector("a")
            a.style.background='red'
                         ↓
            $('a').css('background','red') => 제이쿼리 
            -------
      = 오픈 소스 : 사용이 자유롭다 => 이전 개발 (유지 보수)
      = 속도가 늦다 => 가상 DOM (가상 메모리)
                    =================== Vue, React 
      문법형식)
	      자바스크립트
	        main : window.onload=function(){}
	      Jquery
	        main : $(function(){}), $(document).ready(function(){})
	               ===============
	      Vue3
	        main : new Vue({
	               	mounted:function(){}
	               })
	      React 
	        main : class Main extends Component{
	               	componentDidMount(){}
	               }
	               => HOOKS
	               function main(){
	               	useEffect(()=>{
	               	})
	               }
	      React-Query : 서버 연결 ******
	  ====================================================
	  제이쿼리 : 태그를 제어하는 프로그램 (태그 가지고 오는 방법)
	           값, 속성, CSS, 이벤트 제어
	           $('태그명').처리
	           $('아이디명').처리
	           ----------- 선택자
	  1) 값을 읽기 (태그) 
	     val() / val(값) : input, select, textarea
	     text() / text(값) : 모든 태그 => <태그>값 설정</태그> : 문자열
	     html() / html(값) : HTML 적용 => 단일
	     append() / append(값) : HTML 적용 => 여러개, 중복, 동시 사용 
	  2) 제어 (이벤트)
	     click
	     change
	     hover
	     keyup
	     keydown
	  3) Ajax
	     브라우저 : HttpXMLRequest가 존재 
	              ============== 서버 연결 => 서버 응답
	     => if(httpRequest.readyState==4){
	          if(httpRequest.status==200){
	          }
	        }  
	        => success:function(){
	           }  
	     => $.ajax({
	           type: => get/post
	           url: => 실행할 JSP를 지정
	           data: => ? => {키:값}
	           success:function(){
	           	  // 정상수행시 처리 문장
	           }
	           error:function(){
	              // 서버에서 오류 발생시 처리 
	           }
	        })
	    => axios.get('url',(
	       	 params:{
	       	   키:값
	       	 }
	       ).then(res=>{
	         결과값 받기
	    })
	       axios.post()
	 
         
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>