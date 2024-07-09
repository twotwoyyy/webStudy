<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	JSP : Java Server Page => 서버에서 실행하는 자바 파일 => Back-End
	Back-End : Java,JSP,Servlet, Spring, Oracle
	Front-End : HTML, CSS, JavaScript
	                       ========== Jquery(Ajax), VueJS, ReactJS, NextJS
	JSP
	 1. HTML +Java => 구분
	    자바 => <% %>, <%= %>, <%! %>
	           =====  ======  =====
	          스크리트릿  표현식    선언문
	 2. 동작 방식 => 정적 페이지 / 동적 페이지 
	              ========   ========
	                         | 한 개의 파일에 여러 개의 데이터 출력 (JSP,PHP,ASP,CGI)
	              | 한 파일에 한 개만 사용 (HTML)
	 3. 지시자 
	    page : JSP 파일에 대한 정보를 저장 
	           = 변환 content type 
	             브라우저에서 실행 => HTML/XML/JSON
	             => HTML => text/html
	             => XML => text/xml
	             => JSON => text/plain : JavaScripnt Object Notation
	                                     자바스크립트 객체 표현법 => VO
	                                     => Ajax,VueJS,ReactJS,Redux,Next...
	                                     VO => {}
	                                     List => [{},{}...] 
	           = 라이브러리 추가 : import 
	           = 한글 변환 : pageEncoding => UTF-8 (호환성) 
	           = 에러 페이지 : errorPage="파일명" (에러날 때마다 파일명으로 이동) 
	             1) 404 : 파일이 없는 경우 <a href="파일명">
	             2) 500 : 자바 컴파일 에러 
	             3) 403 : 접근 거부 (Spring-Security)
	             4) 412 : 한글 변환 코드 문제
	             5) 400 : bed request => 전송값과 받는 변수 데이터형이 틀린 경우 
	    include : <%@ include file="" %> => <iframe>
	              JSP안에 다른 JSP를 포함해서 사용 
	    taglib : jsp의 단점을 보완 => JSTL ==> 자바 / HTML 분리할 때 사용 
	                                       ===================== MVC
	                                       Spring에서는 MVC만 사용한다 
	             자바 대신에 태그형식으로 바뀐다 
	             <%
	                 if(조건문){
	             %>
	                 HTML
	             <%
	                }
	             %>
	             => <c:if test="">
	                 HTML
	                </c:if>
	 4. 자바 코딩
	    <% %> : 스크립트릿=> 일반 자바 (메소드 안에 코딩)
	                      지역변수 선언, 제어문, 메소드 호출 
	           => 자바문법을 그대로 사용 
	           => 주석 // /* */
	    <%= %> : 표현식 => 데이터를 화면에 출력 => out.write()
	                                       out.println()
	    <%! %> : 선언식 => 메소드 제작, 멤버변수 
	 5. 지원하는 라이브러리 => 내장 객체 
	    request / response / out / session / application 
	    config / exception / page / pageContext 
	 6. Cookie / Session 
	    Cookie => 브라우저에 데이터 저장
	    Session => 서버에 데이터 저장 
	 7. JSP 액션 태그 / 빈즈
	    JSP 액션 태그 <jsp:include>, <jsp:useBean> 
	    빈즈 : VO, 데이터 모아 한번에 전송할 목적 
	 8. JSTL / EL : 제어문이나 함수(메소드) 호출 => 태그로 제작 => 교재
	 ================================================= MVC
	 9. MVC 
	 10. Spring 
	 
	 JSP => 실행 => 톰캣 => 클래스화 
	 a.jsp      => class a_jsp extends HttpServlet {
	                  <%! %>
	                  public void _jspInit(){
	                  }
	                  public void _jspDestory(){
	                  }
	                  // JSP에서 코딩하는 영역 => 메소드 안에 들어가는 내용을 코딩 
	                  public voud _jspService(){
	                    <% %>
	                    <%= %>
	                  }
	               }
	               => 컴파일 => a_jsp.class => 한 줄씩 번역 
	                                        ===========
	                                        |메모리에 HTML만 출력 
	                                        =================
	                                          |브라우저가 읽어서 출력 
	                                          
	18page
	1) 웹 동작 
	   ===== 클라이언트 요청 (request), 서버애서 요청한 것에 대한 응답 (response)
	         => C/S => Client / Server
	   요청시=> URL 주소를 이용한다
	          브라우저 => 주소창(유일하게 서버와 연결)
	      http://localhiist/JSPBasicProjcet_01/jsp/basic_01.jsp
	      ================  ==================================== 
	       서버 주소(서버 정보)     사용자가 요청 => URI => 파일을 보여달라 
	       *** 생략하는 경우 => Welcom파일 출력 
	       *** 파일의 확장자는 개발자가 설정 가능 
	           .naver/.daum/.do
	           PathVarialbe => 가장 많이 사용 (파일명, 변수값)
	           /admin/1234 => Spring/Vue/React
	       => 나머지 요청은 반드시 파일명을 추가한다 (중복 불가)
	       
	19page 
	  =======================================================================
	  브라우저 (클라이언트) : 크롬 / IE / FF
	  웹 서버 : Apache / IIS
	  웹 애플리케이션 / WAS : tomcat => JSP를 자바로 변경 => 브라우저 HTML을 전송 
	                     ======= 테스트용 웹서버 (50명만 접근이 가능)
	  데이터베이스 : 오라클
	  =======================================================================
	                     파일 요청                    .jsp/.java
	client(브라우저)  ===================> Web Server ============> WAS(tomcat>
	                                    Apache / IIS                  |
	                                         |                  .jsp => java로 변경 
	                                                                  |
	                                     요청 파일 확인                  컴파일
	                                   => .html/.xml                .class 
	                                   => 자체 처리                      |
	                                                               한 줄씩 번역 
	                                                                  |
	                                                            HTML만 메모리에 저장
	                                                                  |
	                ===================================================
	                             브라우저가 읽어 갈 수 있게 만든다 
	 파일
	 정적 페이지 : HTML/CSS => 데이터 갱신이 불가능
	 동적 페이지 : JSP/JavaScript => 데이터를 갱신 
	 ======= CGI, ASP, PHP
	 ======= 22page
	         ======
	         servlet / JSP
	         =======
	         Server+let => 서버에서 실행되는 가벼운 프로그램 => .java
	           = 자바에서 첫 웹프로그램 시작 
	           = 단점 : 변경 시에 컴파일 => 실행 
	           = 바로 변경된 소스를 확인할 수 없다 
	             ======================== 바로 확인 => JSP 
	           = 장점 : 보안이 뛰어나다 (.class 배포)
	                   보안과 관련된 웹파일 = 서블릿으로 제작 
	                   => JSP는 주로 화면 출력
	           = 스프링이 서블릿으로 만들어져 있다 
	           ===========================
	            => JSP : 배포시에 소스를 그대로 전송 (소스가 노출된다) 
	           = MVC
	             Model : 자바(DAO,VO)
	             View : JSP(화면에만 출력 기능)
	             Controller : Model과 View 연결 => Servlet
            => JSP파일 1개만 만들기?
               =================
               Java+HTML 분리
               =============
            => 서블릿 => JSP가 컴파일되면 서블릿으로 변경 
                       ======================= 톰캣 
            => 서블릿 => JSP => 보안 취약 문제점 해결 위해 서블릿+JSP 
               ==== Spring (라이브러리가 서블릿) 
               서블릿, JSP => Java+HTML 
               =======================
               |HTML만 이용해서 처리 => ThymeLeaf => JSP보다 속도가 느리다 
                                   ==========
                                   서버, 클라이언트 나눠서 작업
                                   ====================
                                   서버 => BOOT 
                                   클라리언트는 Vue/React
          서블릿 => JSP => MVC => Spring => Spring-Boot
                             |
                            파이썬 => 장고 => React 
                            
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