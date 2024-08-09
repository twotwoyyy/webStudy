package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class BoardReplyModel {
	@RequestMapping("reply/reply_list.do")
	public void reply_list(HttpServletRequest request, HttpServletResponse response) {
		String bno=request.getParameter("bno");
		List<BoardReplyVO> list=BoardReplyDAO.replyListData(Integer.parseInt(bno));
		HttpSession session=request.getSession();
		String sessionId=(String)session.getAttribute("id");
		
		try {
			// list => json으로 변경 
			JSONArray arr=new JSONArray();
			for(BoardReplyVO vo:list) {
				JSONObject obj=new JSONObject(); // VO
				obj.put("rno", vo.getRno());
				obj.put("bno", vo.getBno());
				obj.put("id", vo.getId());
				obj.put("name", vo.getName());
				obj.put("msg", vo.getMsg());
				obj.put("day", vo.getDbday());
				obj.put("sessionId", sessionId);
				arr.add(obj);
			}
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		}catch(Exception ex) {}
	}@RequestMapping("reply/reply_insert.do")
	public void reply_insert(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		String bno=request.getParameter("bno");
		String msg=request.getParameter("msg");
		
		BoardReplyVO vo=new BoardReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		
		BoardReplyDAO.replyInsert(vo);
		
		try {
			PrintWriter out=response.getWriter();
			out.write("OK");
		}catch(Exception ex) {}
	}
	@RequestMapping("reply/reply_delete.do")
	public void reply_delete(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		BoardReplyDAO.replyDelete(Integer.parseInt(rno));
		try {
			PrintWriter out=response.getWriter();
			out.write("OK");
		}catch(Exception ex) {}
	}
	@RequestMapping("reply/reply_update.do")
	public void reply_update(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		// 데이터베이스 연동
		BoardReplyVO vo=new BoardReplyVO();
		vo.setMsg(msg);
		vo.setRno(Integer.parseInt(rno));
		BoardReplyDAO.replyUpdate(vo);
		// Ajax로 전송
		try {
			PrintWriter out=response.getWriter();
			out.write("OK");
		}catch(Exception ex) {}
	}
}
