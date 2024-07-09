package com.sist.servlet;

import java.io.IOException;
import java.io.ObjectInputFilter.Config;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	http://localhost/JSPBasicProject_03/MyServlet
 *                                     ========= 
 *                                     서블릿은 URL => 파일명 변경
 *  1. URL을 입력하고 => 웹서버에 요청
 *                    =========
 *                    HTML/XML/JSON => 바로 처리 (브라우저 전송)
 *                    Java(Servlet), JSP => WAS(Web Application Server)
 *                                          =========================== Tomcat
 *                                          a.jsp
 *                                          ======
 *                                          1. 클래스로 변경
 *                                            class a_jsp => a_jsp.java
 *                                          2. 컴파일
 *                                            a_jsp.class => 서블릿
 *                    Java(Servlet)
 *                    =============
 *                    | .Java =====> 컴파일 .class
 *                    | 한 줄씩 번역 => 인터프리터
 *                      =========    1. 서블릿 파일 로딩
 *                         |         2. init()
 *                         |         3. service() => doGet() / doPost()
 *                         |         4. 서블릿이 종료 (새로고침, 화면 이동) => destory() 호출 
 *                     out.writer("") => 메모리에 출력
 *                                       ==========
 *                                       요청한 브라우저에서 읽어서 화면 출력
 *                     파일 한 개에 데이터 변경이 가능 => 동적 페이지 
 *                     예) 페이지가 100page
 *                        ==============
 *                        서블릿 / JSP는 한 개의 파일로 제작 => 데이터만 변경 
 *                        HTML => 파일 100개를 만든다 : 정적 페이지 (데이터 변경 불가) 
 *     서블릿 (Servlet)
 *         => Server + let    => 서버에서 실행되는 가벼운 프로그램 (경량) => 스프링 
 *         => Servet + Applet => 서버에서 실행되는 응용 프로그램 
 *                     ====== Application + let 
 *                     | Applet => 자바가 발전 => Applet 
 *                       ====== 웹 => 정보 공유 목적 (1995 이전 문자로만 출력) 
 *                       이미지 / 애니메이션 => 2000년대부터 웹 발전 
 *         => 웹 서비스 기능을 해주는 자바 클래스 
 *           => 자바 안에 HTML 코드를 첨부 (JSP는 HTML안에 자바 첨부)
 *              out.write("<html>") => <% 
 *                                     %>
 *                                     <html>
 *           => 단점 : 1. HTML 다루기가 어렵다 (복잡하다) => CSS/JavaScript
 *           	       out.write("<html>")
 *           	       out.write("<head>)
 *           	       out.write("<script type=\"text/javascript\">")
 *           	       out.write("function aaa(){")
 *           	       out.write("alert(\"\");")
 *           	       out.write("}")
 *           	       out.write("</script>")
 *           	       out.write("<style type=\"text/css\">")
 *           	       out.write("#aaa{background-color:red; border:1px solid red}")
 *           	       out.write("</head>")
 *                   2. HTML/CSS/JavaScript에 대한 에러 처리가 어렵다
 *                   3. 확장자 java => 변경시마다 컴파일을 다시해야 한다 
 *                     => 톰캣 연결
 *                     => 톰캣 프로젝트 => 변경 : 컴파일 => 톰캣에 올려준다
 *                     => WAS => 수정시마다 컴파일 => war => war를 변경해야 한다 
 *                     ================================================
 *                       운영 (SE) => SI/SM 
 *                       ================= 통합 DevOps => CI/CD
 *                     => 버튼 색상 변경
 *                     => 개발자 => 수정시에 바로 확인 => JSP
 *          => 장점 : 자바는 배포시에 .class파일만 전송하면 되기 때문에 보안이 뛰어나다 
 *                  ========================== 전체 소스를 볼 수 없다, 다른 사람이 변경할 수 없다
 *                  주로 사용처 : HTML / 자바가 분리된 경우 => 연결해주는 역할 Controller
 *          => 단점을 보완
 *             : 수정과 동시에 확인이 가능하게 만들어 준다 => JSP 
 *             : HTML/CSS/JavaScript => 사용이 쉽게 out.write("<html>") => <html> 
 *             : 실행은 톰캣에 의해 실행, 실행 => 저장 
 *             => 그러나 보안은 취약하다 (소스 전체를 전송) 
 *                => Servlet을 병행하는 것이 좋다 
 *                   ======= 웹과 관련된 라이브러리는 서블릿으로 되어있다 
 *         
 *         자바 => SUN => package => javax => tomcat9
 *               ====
 *               오라클 => packgge => jakarata => tomcat10 이상
 *               STS 3.9 => jdk11까지만 지원 (실무 => 1.8)
 *               STS 4.X => jdk17
 *     서블릿의 실행 과정
 *     =============
 *     URL 주소를 이용해서 전송 => 톰캣 
 *     => 톰캣에 의해 실행 
 *     init() => 자바의 main()
 *     doGet()/doPost() => 클라이언트마다 따로 동작 => Thread 
 *     destory() => 
 *     =================
 */
//@WebServlet("/MyServlet") // 어노텐션 => 구분자 => 인덱스 (역할이 없다)
/*
 * 	1. 웹 분석
 *   1) web.xml : 시작과 동시에 필요한 데이터를 넘겨준다 
 *   2) server.xml : port / 파일 위치 확인
 *   3) 클래스 분석
 *      => DAO : SQL
 *   4) JSP분석 : 화면 출력 
 */
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// _jspInit() : 초기화 담당 (생성자 역할) => 멤버변수 초기화, 시작과 동시에 처리 
		// 환경 설정 (web.xml) => 등록된 내용을 읽어올 때 많이 사용 
		// web.xml => 스프링은 라이브러리 => 환경 설정 => 등록 
		// => 서블릿 등록, 보안 설정, 에러 설정, 한글 처리 설정
		System.out.println("MyServlet:init(ServletConfig config) Call...");
		String path=config.getInitParameter("file_name");
    	System.out.println(path);
	}
    public void destory() {
    	// 프로그램이 종료가 됐을 때 쓰는 함수 => 자동으로 메모리 해제 
    	System.out.println("MyServlet:destory() Call...");
    	
	}
    /*
     * 흐름 : 화면 이동 
     *      ======== 
     *      사용자 요청 => 요청 시에 어떤 값을 전송할지 
     *                  GET / POST 
     *                   |      |
     *                  <a>   <form>, Ajax
     *                 대부분은 GET 방식 
     *                 URL 뒤에 데이터 첨부 ?키=값 
     *                                 ?키=값&키=값
     *                 GET => 단순한 데이터 넘어갈 때 주로 사용, 노출 위험이 있음
     *                        ex) 페이지 요청, 상세보기 요청, 단순 검색 .. 
     *                 POST => 보안이 필요한 경우, 데이터가 많은 경우 많이 사용, 노출 위험이 적음
     *                        ex) id,pwd.., 회원가입, 게시판 글쓰기, 댓글 ...
     *      서버 응답 => 요청 값을 받아서 오라클에 연결...
     *                request / response
     *                요청값      응답할 경우
     *                          sendRedirect(), addCookie()
     *                getParameter()
     *                getParameterValues()
     *                => 한글 = 인코딩 => 디코딩 변경 
     *                   setCharacterEncoding() 
     *                데이터 출력 
     *                
     *    사용자가 데이터 전송을 GET으로 했을 경우 ==> doGet() 호출
     *    사용자가 데이터 전송을 POST로 했을 경우 ==> doPost() 호출 
     *    => 두 개 동시 호출은 x 
     *    => 통합 : service()
     *    
     *    JSON / XML => Ajax 
     *                  javascript and xml 
     *      
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 디폴트 => 메인 화면 => 화면 UI
		// 1. 변환 => 브라우저에 알려주는 내용 (HTML,XML,JSON) => JSP(page지시자)
		response.setContentType("text/html;charset=UTF-8");
		// response => 1. HTML 2. Cookie
		// 한 개의 메소드에서 1개만 전송 가능 
		// 2. 요청된 브라우저를 찾는다 => 결과값을 보내준다 
		PrintWriter out=response.getWriter();
		// 브라우저에서 HTML을 읽어가는 메모리 공간 => out => JSP에서는 내장 객체 
		out.println("<html>");
		out.println("<body>");
		out.println("<center>");
		out.println("<h1> Hello Servlet </h1>");
		out.println("</center>");
		out.println("</body>");
		out.println("</html>");
	}
	/*
	 *	1. 요청 => URL 주소로 요청
	 *	2. 톰캣이 해당 서블릿 클래스 읽기
	 *	3. 메모리 할당
	 *	4. 실행 
	 *		init()
	 *		doGet() / doPost()
	 *		destory()
	 */


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자 요청에 대한 처리 
	}

}
