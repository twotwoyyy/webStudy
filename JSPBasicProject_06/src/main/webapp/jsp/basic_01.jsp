<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. JSP의 동작 구조 
	   사용자 (클라이언트) : 브라우저 => 서버로 요청(URL주소 이용 => 마지막에 파일첨부) => 파일을 요청  
	   서버 : 톰캣 => 요청을 받아서(자바) => 요청 처리 => HTML을 브라우저로 전송
	   브라우저 : URL 전송 =================> DNS
	           http://localhost           IP변환 127.0.0.1
	           http://www.daum.net              211.249.220.24
	                                        |   ============== Socket을 이용해서 서버에 연결 
	                                      서버 연결 
	                                      ======
	                                      = HTML/XML/JSON => 서버에서 단독 처리
	                                      = JSP/SERVILET => 톰캣(WAS)에서 처리 (자바 번역 => HTML) 
	                                                        ======== 메모리를 브라우저에서 읽어 출력할 수 있게 보내준다
	                                                        자바 번역
	                                                        ======
	                                                        JSP => 클래스화
	                                                        a.jsp =======> class a_jsp extends HttpJSPBase
	                                                        ======         {   <%! 메소드, 멤버변수 %> 선언식 
	                                                          소스              public void _jspInit(){}
	                                                        ======             public void _jspDestory(){}
	                                                                           public void _jspService(){
	                                                                              jsp에서 작성한 소스 
	                                                                              <% %>
	                                                                              <%= %>
	                                                                              HTML은 out.write("<html>")
	                                                                           }
	                                                                       }
	                                       1) 클래스 만들기 => 한 번만 만든다 => 변경 => 만들어진 클래스 수정
	                                       2) 컴파일 => .class 
	                                       3) .class을 한 줄씩 읽어 번역 => out.write() => 메모리에 저장 
	                                                                                 ==========
	                                                                                 buffer: 임시 저장 장소
	                                                                                 ======= 사용자 한명당 1개만 생성 
	                                       4) 메모리에 출력된 내용을 브라우저에서 읽어서 출력
	                                          => tomcat / regin / 웹로직 / 웹스페어 / 제우스 
	                                             ======                          =====
	                                                |                              |
	                                                =======가장 많이 사용되는 WAS =======  
	2. 실행 순서
	   1) JSP 제작
	   2) 사용자 요청 => JSP 파일 요청 
	   3) 톰캣 => 클래스로 변경
	   4) 클래스 => 컴파일 => .class
	   5) .class를 읽기 시작 
	      = _jspInit() => 환경설정, 멤버변수 초기화 
	                      ================== web.xml 
	      = _jspService() => 요청 처리 => 브라우저 실행 
	      = _jspDestroy() => 새로고침, 화면 이동 => 자동으로 jsp는 메모리에서 해제 
	      = 서버 
	        서버 연결 => 자동으로 통신을 할 수 있게 쓰레드를 생성 
	        ======= 클라이언트가 1개식 연결 
	        서버 == 클라이언트 1
	        서버 == 클라이언트 2
	        서버 == 클라이언트 3
	        => _jspService() 쓰레드 메소드 (run())
	          => 서버에 데이터 전송 
	             ============= .getBytes() => 브라우저는 서버가 전송이 될 때 1byte씩 전송 (Encoding) => ASC 1byte 
	             ============= InputSteramReader() => 1byte를 2byte로 받아 전송 (Decoding)
	                           ===================
	                            requset.serCharaterEncoding("UTF-8")
	                                                        =======
	                                                     = Uncodie Transfor Format
	                                                       ======= 2byte 
	3. HTML과 자바 구분
	   <% %> : 일반 자바 소스 => 지역 변수 선언, 연산자, 제어문, 메소드 호출 
	           문법 사항이 자바와 동일하다, 문장 종료가 되면 ;
	           주석 : 한 줄 주석 // 여러 줄 주석 /* */ 
	   <%= %> : out.print(출력물) => 변수를 출력할 때 사용, ;찍으면 오류 => ${}
	            주석 /* */만 사용 가능 
	   <%! %> : 메소드 제작, 멤버변수 선언
	4. 지시자 5장
	   = page
	     : JSP 파일에 대한 정보 
	       1) contentType => 브라우저에 어떤 형식인지 알려준다 
	          HTML / XML / JSON 
	          => HTML => text/html;charset=UTF-8
	             XML  => text/xml;charset=UTF-8
	             JSON => text/plain;charset=UTF-8
	             ====> List,VO
	             ====> JsonResponse() => 파이썬 
	       2) import => 라이브러리, 사용자 정의 클래스 읽기 
	          => 다른 속성은 한 번만 사용이 가능하나 import는 여러 번 사용이 가능하다 
	            <%@page import="java.util.*,java.to.*"%>
	            <%@page import="java.util.*"%>
	            <%@page import="java.io.*"%>
	       3) errorPage : error시에 error파일을 만들어서 보여주는 역할
	          404 : 파일이 없는 경우
	          500 : 컴파일 에러 => 자바에서 오류발생 
	          405 : GET/POST가 다른 경우 
	          412 : bad request => 데이터를 잘못 보낸 경우
	          403 : 접근 거부 (스프링) => 권한 분여  
	          200 : 정상 수행 
	       4) buffer : default (8kb) => buffer="16kb" => HTML을 저장하는 메모리 공간 
	   = include : 정적 파일 => 소스를 통합한 후에 컴파일 => 변수가 충돌되면 문제 발생 => 메뉴, footer에서 많이 사용
	               <%@ include file=""%>
	               JSP 안 특정 부분에 다른 JSP 포함 => 조립식 프로그램 
	   = taglib => 20장
	   ***<%@ 지시자 속성="값" %> 
	   
	5. 액션 태그 6장
		151page
		1) <jsp:>
		   <jsp:include> *** : 스프링에서도 사용
		     => JSP안에 다른 JSP를 연결(포함) => 동적 
		        파일을 따롴 컴파일한 후에 결과(HTML) HTML을 묶어주는 역할 
		   =================================
		   <jsp:useBean> : 객체 메모리 할당 
		     BoardDAO dao=new BoardDAO()
		     <jsp:useBean id="dao" class="BoardDAO">
		                  =======  ===============
		                   객체명  
		   <jsp:forward>
		     : 화면 이동 
		       sendRedirect() : 새로운 화면 => new
		         request에 존재하는 데이터가 사라진다 => 초기화  
		       forward() : 기존의 하면에 데이터만 변경 
		         request에 존재하는 데이터를 사용할 수 있다 
		   <jsp:setProperty>
		   <jsp:getProperty>
		   ==========================JSP에서만 사용
	6. 내장 객체 7장 
	6-1. 데이터베이스 연결 
	7. Cookie
	8. Error처리
	==============Basic
	9. EL/JSTL
	10. MVC ***** 실무 
	    Java : DAO, Model, VO, Manager, Service
	    JSP : HTML/CSS/JavaScript => View 
	    =============================연결 => Servlet => Controller
	==============Middle
	11. Spring 
	12. Spring=Boot
	==============고급
	=> Front(JavaScript)
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