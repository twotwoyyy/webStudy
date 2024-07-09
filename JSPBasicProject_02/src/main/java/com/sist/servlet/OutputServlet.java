package com.sist.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/OutputServlet")
public class OutputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init(ServletConfig config) Call...");
	}
	public void destroy() {

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OutputServlet:doGet() Call...");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OutputServlet:doPost() Call...");
		//HTTP 상태 405 - 허용되지 않는 메소드
		//GET => doGet() / Post=> doPost()
		//GET => doPost() (x) <a> => GET 방식 
	}

}
