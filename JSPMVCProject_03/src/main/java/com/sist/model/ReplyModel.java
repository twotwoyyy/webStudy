package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class ReplyModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String no=request.getParameter("no");
		request.setAttribute("no", no);
		
		return "reply.jsp";
	}

}
