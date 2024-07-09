package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/inputServlet")
public class InputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("InputServlet:init(ServletConfig config) Call....");
		// 생성자와 같은 역할을 수행... => 멤버변수의 초기화, 드라이버 등록, 서버 연결, 쿠키 읽기...
		// 자동 로그인, 크롤링 (실시간 갱신)... 
	}


	public void destroy() {
		System.out.println("InputServlet:destroy() Call...");
		// 새로고침, 화면 이동 => 메모리 회수 
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JSP 코딩 => 메소드 영역 => 사용자 요청에 따라 처리하는 코딩
		// => 지역변수 <% %> <%= %>
		System.out.println("사용자가 요청한 데이터를 받아서 처리 결과를 보내주는 역할");
		// default => 처음 실행, <a>, sendRedirect() => GET/POST 지정하지 않은 경우 무조건 GET이 default 
		// 1. 변환 코드 => 컴파일하면 어떤 형식의 파일을 전송? => HTML/XML/JSON
		response.setContentType("text/html;charset=UTF-8");
		// 2. 누구한테 보낼지 확인 
		PrintWriter out=response.getWriter();
		//              ================== 해당 브라우저 읽어오기 
		// HTML을 전송한다
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3><a href=OutputServlet>OutServlet이동</a></h3>");
		// 이동 => OutputServlet => doGet() => doGet()이 없는 경우에는 405 에러 발생
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
		// => 사용자가 데이터 전송시 어떻게 처리? 값을 받는 방법 (request.getParameter)
		// => 데이터베이스 연결? => 데이터 출력하는 방법 => Servlet
		// => Servlet : MVC(Controller) => 화면 출력은 거의 사용하지 않는다 => 화면 출력은 JSP
		// Controller (스프링에서는 제작이 되어있다)
	}

}
