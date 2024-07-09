package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DataOutputServlet")
public class DataOutputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) throws ServletException {
		System.out.println("DataOutputServlet:init(ServletConfig config) Call....");
	}


	public void destroy() {
		System.out.println("DataOutputServlet:destroy() Call...");
	}
	/*
	 *	<%
	 *	
	 *	%>
	 *	<html>
	 *	
	 */
	// 매개변수는 호출시마다 변경 => request가 계속 변경이 된다
	// cookie / session / database
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 브라우저 전송 : HTML 
		response.setContentType("text/html;charset=UTF-8");
		// 2. 사용자가 보내준 값을 받는다
		/*
		 * 사용자 전송 => 모든 전송된 데이터는 request 안에 있다 => 구분자 : name 
		 * request => HttpServletRequest
		 *            ==================
		 *            javax.servlet.http.HttpServletRequest
		 *              => tomcat9
		 *            jakarata.servlet.http.HttpServletRequest
		 *              => tomcat10
		 *   1) 서버 정보
		 *      http://localhost:80
		 *      =================== 서버 IP / 서버 PORT
		 *        => getServerInfo() / getPort() 
		 *   2) 사용자 전송 정보 
		 *      = setCharacterEncoding() : 디코딩 (1byte=> 2byte)
		 *      = String getParameter("name속성명") => 단일값
		 *      = String[] getParameterValues() => 체크박스(Checkbox)
		 *   3) 추가 정보 
		 *      = setAttribute()
		 *      = getAttribute()
		 *   4) 브라우저 정보
		 *      = getRemoteAddress()
		 *      = getRequestURL()
		 *      = getRequestURI()
		 *      
		 */
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String content=request.getParameter("content");
		String[] hobby=request.getParameterValues("hobby");
		// 3. 데이터베이스 연결
		// 4. HTML을 메모리에 저장 => HTML 
		PrintWriter out=response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<h3>클라이언트가 보내준값</h3>");
		out.write("이름: "+name+"<br>");
		out.write("성별: "+sex+"<br>");
		out.write("전화: "+tel1+")"+tel2+"<br>");
		out.write("내용: "+content+"<br>");
		out.write("취미: <br>");
		out.write("<ul>");
		try {
			for(String s:hobby) {
				out.write("<li>"+s+"</li>");
			}	
				}catch(Exception ex) {
					out.write("<font color=red>취미가 없습니다</font>");
				}
		
		out.write("</ul>");
		out.write("<a href=\"DataInputServlet\">입력</a>");
		out.write("<hr>");		
		out.write("<h3>request의 기본 기능 </h3>");
		out.write("서버명: "+request.getServerName()+"<br>");		
		out.write("서버포트:"+request.getServerPort()+"<br>");		
		out.write("클라이언트IP: "+request.getRemoteAddr()+"<br>");		
		out.write("URL: "+request.getRequestURL()+"<br>");		
		out.write("URI: "+request.getRequestURI()+"<br>");		
		
		out.write("</body>");
		out.write("</body>");
		out.write("</html>");
	}
}
