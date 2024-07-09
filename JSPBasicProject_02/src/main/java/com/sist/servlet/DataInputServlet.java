package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DataInputServlet")
public class DataInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("DataInputServlet:init() Call...");
		// 자동로그인 / 쿠키읽기 
	}

	public void destroy() {
		// TODO Auto-generated method stub
		// 해제 => 메모리 => 새로운 화면 (new => 생성)
		System.out.println("DataInputServlet:destory() Call...");
	}
	/*
	 *	클라이언트 요청 ===================> request 안에 첨부한다 (주고)
	 *	서버 요청 처리 => 응답 (HTML) ======> response (받고)
	 *
	 *  요청시에 전송할 데이터가 무엇인지 생각 
	 *  응답 : 어떤 값을 출력할지.. (HTML)
	 *  
	 *  client / Server
	 *  
	 *  => <input> => name 속성을 가지고 있어야 한다
	 *  <form>
	 *   => <input>, <select>, <textarea>
	 *   => <form> => 포함하고 있는 데이터만 넘어간다
	 *   
	 *   <a href="이동할 주소">
	 *            ========
	 *            DataOutputServlet?name=홍길동
	 *            DataOutputServlet?name=홀길동&남자
	 *  
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 브라우저에 알려준다 (메모리를 읽어간다 => HTML/XML/JSON)
		// => 메모리에 저장된 내용을 읽어 간다 
		response.setContentType("text/html;charset=UTF-8");
		// 2. 누가 요청했는지 
		PrintWriter out=response.getWriter();
		// out 영역에 HTML을 출력 => 브라우저가 읽어 간다 
		out.write("<html>");
		out.write("<head>");
		out.write("<link rel=\"stylesheet\" href=\"table.css\">");
		out.write("</head>");
		out.write("<body>");
		out.write("<center>");
		out.write("<form method=\"post\" action=\"DataOutputServlet\">");
		/*
		 *   RestFul => 다른 프로그램과 연동 
		 *   method
		 *     = GET    : SELECT
		 *     = POST   : INSERT
		 *     ===================== 웹에서는 GET/POST
		 *     = PUT    : UPDATE
		 *     = DELETE : DELETE
		 *   
		 *   method가 생략이 되면 GET 
		 *   method="PAST" method="PPPP" => GET => 잘못쓰고, 다르게 쓰면 전부 GET방식으로 인식 
		 *   action : 입력된 데이터를 모아서 한번에 전송할 JSP/Servlet 지정 
		 */
		out.write("<table class=\"table_content\" width=500>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">이름</th>");
		out.write("<td width=80%><input type=text name=name size=15></td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">성별</th>");
		out.write("<td width=80%>");
		out.write("<input type=radio value=\"남자\" name=sex checked>남자");
		out.write("<input type=radio value=\"여자\" name=sex>여자");
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">전화</th>");
		out.write("<td width=80%>");
		out.write("<select name=\"tel1\">");
		out.write("<option>010</option>");
		out.write("<option>011</option>");
		out.write("<option>012</option>");
		out.write("</select>");
		out.write("<input type=text name=tel2 size=15>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">소개</th>");
		out.write("<td width=80%><textarea rows=5 cols=30 name=content></textarea></td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">취미</th>");
		out.write("<td width=80%>");
		out.write("<input type=checkbox value=\"낚시\" name=hobby>낚시");
		out.write("<input type=checkbox value=\"여행\" name=hobby>여행");
		out.write("<input type=checkbox value=\"영화\" name=hobby>영화");
		out.write("<input type=checkbox value=\"게임\" name=hobby>게임");
		out.write("<input type=checkbox value=\"등산\" name=hobby>등산");
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td colspan=2 class=\"tdcenter\">");
		out.write("<button>전송</button>");
		out.write("</tr>");
		out.write("</table>");
		out.write("</form>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}

}
