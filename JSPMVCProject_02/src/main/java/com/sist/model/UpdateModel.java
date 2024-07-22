package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class UpdateModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 수정");
		return "view/update.jsp";
	}

}
