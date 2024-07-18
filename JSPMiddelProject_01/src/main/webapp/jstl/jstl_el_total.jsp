<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	EL   => 표현식 (브라우저에 데이터 출력) <%= %> 대체 
	JSTL => 자바 제어문, 변수 선언, 화면 이동 => 태그형으로 변경 
	JSP => 태그로 제작을 한다 (자바를 사용하지 않는다) 
	       HTML + Java 
	       => HTML => 결과값만 출력 
	          Java => 요청 처리 => 결과값 전송 => 보안, 분산, 재사용이 가능 
	                  => 태그형 (수정이 편리) 
	       MV => 소스는 동일 => 파일이 많아진다 (단점) => 개발자 2명
	EL => %{값} 
	       === 일반 데이터 사용이 가능 (자바 변수는 출력할 수 없다) 
	                             ====================
	                             String name="";
	                             ${name} => 출력이 불가능
	                             출력하려면 ? 반드시 request.setAttribute()
	                                            session.setAttribute()
	                             => request.setAttribute("name","홍길동")
	                                                     ====== key값 
	                                ${name} <= request의 key값을 받아온다 
	                                %{requestScope.name}
	                                  ============ 생략이 가능 
	                             => session.setAttribute("name","홍길동")
	                                ${name}
	                                ${sessionScope.name} 
	                                
	                             => request의 키와 session의 키가 동일할 때 request가 우선순위다
	                             => 그러면 session은 sessionScope.name으로 적어주어야 출력이 가능하다 
	                             => param => request.getParameterValues() 
	                                paramValues => reqeust.getParameter()
	                                => param은 사용빈도가 낮다 
	            JSP =====> 요청 =====> Java ======> 요청 처리 ======> JSP 
	                                                              request/ session에 결과값을 담아서 넘겨준다
	                                                                                ===================
	                                                                                setAttribute()
	                                                                                      |
	                                                                                     ${}
	           연산자 
	             산술연산자
	               +  : 산술만 처리
	               += : 문자열 결합
	               ${"10"} => 자동으로 Integer.parseInt()
	               ${null+10} => 자동으로 null값은 0으로 취급
	               / : 정수/정수 => 실수
	               
	             ========= 조건문
	             비교연산자
	               == eq
	               != ne
	               <  lt
	               >  gt
	               <= le
	               >= ge
	             논리연산자
	               && end 
	               || or
	             ========= <c:if test=""> <c:when test=""> 
	             
	             => 객체 단위 출력
	                ${객체명.변수명}
	                  ==== ====
	                  key명 getXxx() => ${vo.ename} => ${vo.getEname()}
	          
	          JSTL : Tag로 자바 문법 사항을 만들었다
	                 === 제어문, 화면 이동, 변수 선언, 날짜 변환, 숫자 변환, String 메소드 제어 
	                     =====================  ================================
	                                             자바에서 주로 처리 => 결과값
	                            | core
	                      <c:set> : request.setAttribute() 생성
	                         | 
	                        var : 키
	                        value : 값 
	             
	                      <c:out value=""> => JavaScript와 충동 방지
	                                          #는 함수 
	                      <c:if test="단일 조건문"> 
	                      <c:choose> 다중 조건문 
	                      	<c:when text=""></c:when>
	                      	<c:when text=""></c:when>
	                      	<c:otherwise></otherwise> => else문장 
	                      </c:choose>    
	                      <c:forEach var="" begin="" end="" step=""> 
	                                        시작      끝      증가 
	                      <c:forEach var="" items="" varStatus=""> 
	                                        ======== ============ 인덱스 번호 
	                                        배열/컬렉션 
	                      <c:forTokens var="" values="" delimit="">
	                                          ========= ==========
	                                          대상        구분자 
	                      <c:redirect url=""> : sendRedirect 
	                      <fmt:formatDate> <fmt:formatNumber>
	                      ${fn:length...}
	                      
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