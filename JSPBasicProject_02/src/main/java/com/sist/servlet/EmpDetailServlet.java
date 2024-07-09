package com.sist.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/EmpDetailServlet")
public class EmpDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException {
	}

	public void destroy() {
	}
	// doGet() + doPost() => 동시에 처리가 가능 => 스프링
	// @GetMapping @PostMapping = @RequestMapping
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
