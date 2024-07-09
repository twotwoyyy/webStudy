<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP 생명 주기
	=> _jspInit() : web.xml에 환경 설정 : 생성자와 같은 역할 수행 
	=> _jspService() : doGet(), doPost()를 대신 => 통합이 되어있어서 조건문으로 따진다 
	  ============== JSP에서 코딩한 소스가 메소드 안에 첨부 
	                 =============== _jspService()를 제작 
    => _jspDestory() : 메모리 해제
    public void _jspService(http.HttpServletRequest request,http.HttpServletResponse response){
    	PageContext pageContext;
	    HttpSession session = null;
	    ServletContext application;
	    ServletConfig config;
	    JspWriter out = null;
	    Object page = this; // 내장 객체 
	    
	    ================================================
	     여기가 JSP 코딩 위치 
	     JSP는 클래스 영역이 아니라 => _jspService() 영역에서 코딩
	    ================================================
	    
	 113page
	 JSP 기초 
	  JSP 스크립트에 대한 이해 
	  1. JSP는 자바 + HTML이 혼합
	    => 언어별 구분이 가능
	    => 스크립트 <% %> -스크립트릿 => 일반 자바 코딩
	                               변수 선언 => 지역변수
	                               메소드 호출
	                               클래스 메모리 할당
	                               제어문/연산자
	    => <%= %> -표현식 => 브라우저 출력 out.println()
	    ===================메소드 영역으로 설정 
	    => <%! %> -선언식 => 사용빈도는 거의 없다, 메소드를 JSP에서 만드는 경우, class 영역에 설정 
	    
	    class basic(005)f2_jsp exetenfs_jsp extends HttpJspBase{
	    	==============================
	    	  멤버 변수 
	    	  <%! %>
	    	===============================
	    }
	  2. 
    }
    
    
 --%>
 <%!
 	String name;
 	public void display(){} // 클래스 영역 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int age=10; //_jspService()
	%>
	<%=age %> <%--out.print(age) --%>
</body>
</html>