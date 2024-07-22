package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.model.*;
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] strCls= {
		"com.sist.model.ListModel",
		"com.sist.model.InsertModel",
		"com.sist.model.InsertOkModel",
		"com.sist.model.DetailModel",
		"com.sist.model.ReplyModel",
		"com.sist.model.ReplyOkModel",
		"com.sist.model.UpdateModel"
	};
	private String[] strCmd= {
		"list.do",
		"insert.do",
		"insert_ok.do",
		"detail.do",
		"reply.do",
		"reply_ok.do",
		"update.do"
	};
	private Map clsMap=new HashMap();
	// 관련된 class를 모아서 관리하는 영역 => Factory pattern => Spring (Container) : 클래스 관리자 
	public void init(ServletConfig config) throws ServletException {
		try {
			for(int i=0;i<strCls.length;i++) {
				Class clsName=Class.forName(strCls[i]);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				clsMap.put(strCmd[i], obj);
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자의 요청 정보를 읽어온다 (URI) 
		String cmd=request.getRequestURI();
		//System.out.println("cmd="+cmd);
		cmd=cmd.substring(cmd.lastIndexOf("/")+1);
		//System.out.println("cmd2="+cmd);
		// 해당 Model을 찾는다 
		Model model=(Model)clsMap.get(cmd);
		// => 요청 처리
		String jsp=model.execute(request);
		if(jsp.startsWith("redirect")) {
			String s=jsp.substring(jsp.indexOf(":")+1);
			response.sendRedirect(s);
			// _ok : 화면 출력 부분이 아니다 => 요청 처리 (데이터베이스 연동)
			// 화면을 다른 jsp로 이동
			/*
			 *   delete.jsp => delete_ok.jsp => list.jsp
			 *   insert.jsp => insert_ok.jsp => list.jsp
			 *   update.jsp => update_ok.jsp => detail.jsp
			 * 
			 */
		}else {
			// JSP를 찾는다 
			// JSP => request 전송 
			// => JSP 사용 => jsp를 찾는다
			RequestDispatcher rd=request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}

	}

}
