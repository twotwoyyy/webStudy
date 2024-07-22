package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class InsertModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 추가");
		return "view/insert.jsp";
	}

}
