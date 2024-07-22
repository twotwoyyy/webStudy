package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import com.sist.dao.*;
public class UpdateModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		// 클라이언트 전송 => Model 클래스가 받는다 => 처리 후에 request에 결과값을 담는다
		String no=request.getParameter("no");
		BoardDAO dao=BoardDAO.newInstance();
		BoardVO vo=dao.boardUpdateData(Integer.parseInt(no));
		// Controller가 해당 JSP에 request를 전송 
		request.setAttribute("vo", vo);
		
		return "update.jsp";
	}

}
