package com.sist.controller;

import java.io.IOException;

import javax.naming.ldap.Rdn;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.FoodModel;


// JSP(View) <==> Java(Model)
// JSP ===> Controller ===> Java 
@WebServlet("*.do")
// list.do detail.do => Controller
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// food/food_list.jsp
		String cmd=request.getRequestURI();
		cmd=cmd.substring(request.getContextPath().length()+1);
		FoodModel model=new FoodModel();
		String jsp="";
		if(cmd.equals("food/food_list.do")) {
			jsp=model.foodListData(request);			
		}else if(cmd.equals("food/food_detail.do")) {
			jsp=model.foodDetailData(request);
		}
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);

	}

}
