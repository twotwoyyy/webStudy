<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	1. JSP의 실행 과정 
	             실행 요청 (톰캣)   자바로 변경 
	   a.jsp  ================ a_jsp.java
	                  public class a_jsp extends HttpJSPBase{
	                  	public void _jspInit(){}
	                  	public void _jspDestory(){}
	                  	public void _jspService(HttpServletRequest reauest, HttpServletResponse response){
							PageContext pageContext;
	                  		HttpSession session = null;
	                  		ServletContext application;
	                  		servletConfig config;
	                  		JspWrite out = null;
	                  		Object page = this;
	                  	=============================== JSP의 소스 코딩
	                  	<% %>
	                  	out.write(HTML)
	                  	<%= %> => out.print() 
	                  	}
	                  }
	                   컴파일 
	                  ==================> a_jsp.class
	                                      | 한 줄씩 읽어서 메모리에 저장 (인터프리터_
	                                    out.wirte()에 있는 내용만 저장 
	                                    =========== HTML 태그
	                                    | 저장된 HTML을 브라우저에서 읽어서 출력 
			  jsp 파일 요청 => URL => request
	  브라우저 ===============> 톰캣 
	        <=============== 
	         요청 처리 후 응답 (HTML) => response 
	         ====== java코딩 
	  
	  JSP 사용하려면 ? 
	    지시자
	      page => JSP에 대한 정보를 저장 
	         1) 변환 => 브라우저에 알림 
	            contentType="text/html" | "text/xml" | "text/plain"(JSON)
	                         JSON => VO => {}, List=> [{},{},{}....]
	         2) 외부 라이브러리 => import 
	            ========== java.lang, javax.http.servlet외 모든 패키지는 import 사용 
	            => 사용자 정의도 포함 
	         3) errorPage : 에러가 있는 경우에 이동하는 파일 지정 
	     taglib => <% %>를 제거하기 위해 제작된 태그 
	            for / if => 제어문을 태그로 제작 
	            => 가급적 자바는 사용하지 않고 태그형 문법을 사용
	    자바 표현법  : <% 일반 자바 코딩 : 제어문, 연산자, 메소드 호출, 지역변수 선언 %>
	       <%  %> : JSTL => 태그형(제어문) <c:forEach>, <c:if> ... 
	       <%= %> : EL => ${}
	    내장 객체 
	       HttpServletRequest => request
	        = 브라우저 정보
	          http://localhost/JSPBasicTotalProject/total/total_01.jsp
	                          ========================================== URI
	                           ==================== ContextPath
	                ========== 서버 IP 
	          ==== protocol 
	          ========================================================== URL
	          1) getRequestUEI() 
	          2) getContextPath()
	          3) getRequestURL()
	          4) getRemoteAddr() : 사용자의 IP를 얻어온다 
	        = 사용자 요청 정보 
	          1) getParameter() : 사용자가 보내준 단일 데이터값 
	          2) getParameterValues() : String[]
	             => 한번에 여러 개 값을 받을 때 사용한다 : checkbox
	          3) setCharacterEncoding() : 디코딩 (한글 변환) 
	             => POST 방식일 때 한글 변환 
	        = 데이터 추가 정보
	          1) setAttribute() : request에 데이터를 추가
	          2) getAttribute() : 추가된 데이터를 읽어올 때 사용 
	          ==============================================${a}
	             => <%= request.getAttribute("a") %>
	        = 기타
	          1) getSession() : 생성된 session을 얻어오는 경우 
	          2) getCookies() : 생성된 Cookie의 데이터를 얻어온다 
	       HttpServletResponse => response => 응답 
	        = 헤더 정보 : 다운로드 => 실제 데이터 전송 전 먼저 보내는 값 
	          setHeader()
	        = 이동 정보
	          sendRedirect() => GET방식만 사용 가능 
	        = 쿠키 저장
	          addCookie() 
	       HttpSession => application 
	        = 저장 => setAttribute()
	        = 읽기 => getAttribyte() 
	        = 일부 삭제 => removeAttribute() 
	        = 전체 삭제 => invalidate() => 로그아웃 
	        = 세션 구분자 => getId() => webchat 
	        = 기간 설정 => setMaxInactiveInterval() : 30분(1800초)이 default, 초단위 
	       ServletContext => aplication 
	        = 이미지 올릴 때 (상품 등록, 갤러리 게시판)
	          => 바로 확인 : getRealPath() 
	       pageContext => pageContext : 페이지 흐름
	                      request 제어 => 공유 
	                      ==================
	                      include() / forward()
	                      => ***<jsp:include>
	                      => <jsp:forward> : MVC구조에서 사용
	       기타 : Cookies => 사용자 브라우저에 저장 (문자열만 저장이 가능?) 
	             1. 생성
	                Cookie cookie=new Cookie(키,값) 
	             2. 기간
	                cookie.setMaxAge(초단위)
	                => setMaxAge(0)을 주면 삭제 
	             3. 저장위치
	                cookie.setPath("/")
	             4. 브라우저 전송
	                response.addCookie(cookie)
	             5. 쿠키 읽기
	                Cookie[] cookies=request.getCookies()
	             6. 키 읽기
	                cookie.getMame()
	             7. 저장 데이터 읽기 
	                cookie.getValue()
	            => 보안 취약 => 최근 방문 / 자동 로그인 (스프링 => remember-me)
	    JSP 액션태그
	      => <jsp:include>, <jsp:useBean> : 객체 생성 
	         ============== JSP 안에 다른 JSP 포함
	    데이터베이스 연동
	      JDBC => DBCP => ORM(MyBatis/JPA: DataSet) 
	       1. 드라이버 등록       |SQL    |메소드로 표현 
	                                   findByNo(int no)
	                                   SELECTE * FROM table_name 
	                                   WHERE no=1 
	       2. 오라클 연결
	       3. SQL 문장 생성 => SQL 문장만 작성 => 자동 처리 
	       4. 오라클로 SQL 문장 전송
	       5. SQL 문장 실행 요청 => 결과값 받기 
	       6. 오라클 연결 해제 
	    ========================================================================
	     DBCP : 데이터베이스 연결에 소모되는 시간을 줄인다 
	            Connection의 객체 생성 개수를 조절할 수 있다 
	            => 미리 연결된 Connection을 POOL안에 저장
	               ====== 톰캣 => 톰캣에서 읽어가는 파일에 등록해야한다 => server.xml, web.xml 
	            => POOL안에서 Connection의 주소를 얻어온다 
	            => Connection 사용
	            => POOL안으로 반환 
	            => 웹사이트 개발의 기본 
	            => Mybatis / JPA는 기본 설정 
	    ========================================= 12장까지 정리! 하고 20장으로 넘어간다 
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