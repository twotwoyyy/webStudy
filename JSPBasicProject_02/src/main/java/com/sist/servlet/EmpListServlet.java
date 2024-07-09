package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;

@WebServlet("/EmpListServlet")
public class EmpListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() Call...");
	}
	public void destroy() {
		System.out.println("destroy() Call...");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전송 방식 선택 => HTML을 전송 
		response.setContentType("text/html;charset=UTF-8");
		// 2. 데이터를 읽거나 사용자 데이터를 받는다
		EmpDAO dao=EmpDAO.newInstance();
		List<EmpVO> list=dao.empListData();
		
		PrintWriter out=response.getWriter();
		out.write("<html>");
		out.write("<head>");
		out.write("<body>");
		out.write("<link rel=\"stylesheet\" href=\"table.css\">");
		out.write("</head>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>사원 목록</h3>");
		out.write("<table class=\"table_content\" width=600>");
		out.write("<tr>");
		out.write("<th>사번</th>");
		out.write("<th>이름</th>");
		out.write("<th>직위</th>");
		out.write("<th>입사일</th>");
		out.write("<th>성과급</th>");
		out.write("</tr>");
		for(EmpVO vo:list) {
			out.write("<tr class=\"dataTr\">");
			out.write("<td class=\"tdcenter\">"+vo.getEmpno()+"</td>");
			out.write("<td class=\"tdcenter\"><a href=EmpDetailServlet?empno="+vo.getEmpno()+">"+vo.getEname()+"</a></td>");
			// 파일명?키=값 ==> 앞에 있는 파일이 값을 받아서 처리 결과를 화면에 출력 
			// ? => primary key(상세보기) 
			// ? => 문자열 (검색)
			// ? => 페이지 번호 
			// ?키=값 & 키=값    &로 구분해서 처리 
			// <a>=> GET, <form> => GET/POST, Ajax: type: GET/POST 
			// JavaScript => location.href="" => GET 
			// Java(response) => sendRedirect("") => GET
			out.write("<td class=\"tdcenter\">"+vo.getJob()+"</td>");
			out.write("<td class=\"tdcenter\">"+vo.getHiredate().toString()+"</td>");
			out.write("<td class=\"tdcenter\">"+vo.getComm()+"</td>");
			out.write("</tr>");
		}
		out.write("</table>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	

	}
}
