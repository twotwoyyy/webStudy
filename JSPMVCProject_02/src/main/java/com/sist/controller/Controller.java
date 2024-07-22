package com.sist.controller;

import java.io.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;

import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap=new HashMap(); // if문 대체 
	@Override
	public void init(ServletConfig config) throws ServletException {
//		clsMap.put("list.do", new ListModel());
//		clsMap.put("insert.do", new InsertModel());
//		clsMap.put("update.do", new UpdateModel());
//		clsMap.put("delete.do", new DeleteModel());
		try {
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder();
			// parser (XML,HTML,JSON) => 데이터 추출 
			Document doc=db.parse(new File("C:\\webDev\\webStudy\\JSPMVCProject_02\\src\\main\\webapp\\WEB-INF\\application.xml"));
			// 루트 읽기 => beans 
			Element root=doc.getDocumentElement();
			System.out.println("root:"+root.getTagName());
			// 같은 태그를 묶어서 제어 
			NodeList list=root.getElementsByTagName("bean"); // bean태그를 전부 묶어라
			for(int i=0;i<list.getLength();i++) {
				Element bean=(Element)list.item(i); // 태그 하나씩 읽기
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				System.out.println(id+":"+cls);
				// 메모리 할당 
				Class clsName=Class.forName(cls);
				Object obj=clsName.getDeclaredConstructor().newInstance();
				clsMap.put(id, obj);
			}
		}catch(Exception ex) {}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd=request.getRequestURI();
		//   /JSPMVCProject_02/*.do => URI => .do있는 부분을 잘라야 한다
		cmd=cmd.substring(request.getContextPath().length()+1);
		// *.do만 남게 만든다 
		Model model=(Model)clsMap.get(cmd);
		String jsp=model.execute(request);
		
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}
