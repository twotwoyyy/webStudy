package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class UpdateModel {
	public String execute(HttpServletRequest request) {
		String msg="게사판 수정";
		request.setAttribute("msg", msg);
		
		return "view/update.jsp";
	}
}
 