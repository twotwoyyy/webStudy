package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.BoardDAO;
import com.sist.dao.BoardVO;

public class InsertOkModel implements Model {

	@Override
	public String execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		// BoardDAO 전송 => 오라클 연결 
		BoardDAO dao=BoardDAO.newInstance();
		dao.boardInsert(vo);
		return "redirect:list.do"; // Spring에서 sendRedirect()를 사용할 때 씀
	}

}
