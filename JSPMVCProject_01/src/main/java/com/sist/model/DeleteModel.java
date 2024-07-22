package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class DeleteModel {
	public String execute(HttpServletRequest request) {
		String msg="게사판 삭제";
		request.setAttribute("msg", msg);
		
		return "view/delete.jsp";
	}
}
