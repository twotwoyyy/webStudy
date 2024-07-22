package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class DeleteModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		request.setAttribute("msg", "게시판 삭제");
		return "view/delete.jsp";
	}

}
