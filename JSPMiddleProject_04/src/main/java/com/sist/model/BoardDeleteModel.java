package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.BoardDAO;

public class BoardDeleteModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		   String no=request.getParameter("no");
		   String pwd=request.getParameter("pwd");
		   
		   BoardDAO dao=BoardDAO.newInstance();
		   boolean bCheck=dao.boardDelete(Integer.parseInt(no), pwd);
		   
		  
		return "delete.jsp";
	}

}
