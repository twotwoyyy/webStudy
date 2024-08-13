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
public class AllReplyModel {
	@RequestMapping("all_reply/list.do")
	public void all_reply_list(HttpServletRequest request, HttpServletResponse response) {
		String cno=request.getParameter("cno");
		String type=request.getParameter("type");
		Map map=new HashMap();
		map.put("cno", cno);
		map.put("type", type);
		List<AllReplyVO> list=AllReplyDAO.allReplyListData(map);
		// [{},{}..] => List =[] , VO = {} 
		// ajax, vue, react => {} => JSON : 객체 표현법 
		// [] => JSONArray
		// {} => JSONObject
		JSONArray arr=new JSONArray();
		int i=0;
		HttpSession session=request.getSession();
		String sid=(String)session.getAttribute("id");
		if(sid==null) {
			sid="guest";
		}
		for(AllReplyVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("rno", vo.getRno()); // 댓글 번호
			obj.put("cno", vo.getCno());
			obj.put("type", vo.getType());
			obj.put("id", vo.getId());
			obj.put("name", vo.getName());
			obj.put("msg",vo.getMsg());
			obj.put("dbday", vo.getDbday());
			obj.put("sessionId", sid);
			arr.add(obj);

		}
		// JavaScript로 값을 전송
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping("all_reply/insert.do")
	public void all_reply_insert(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String cno=request.getParameter("cno");
		String type=request.getParameter("type");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		// 로그인 후에 사용 가능 
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");

		AllReplyVO vo=new AllReplyVO();
		vo.setCno(Integer.parseInt(cno));
		vo.setType(Integer.parseInt(type));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		String result="";
		try {
			AllReplyDAO.allReplyInsert(vo);
			result="OK";
		}catch(Exception ex) {
			result=ex.getMessage();
		}
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	@RequestMapping("all_reply/delete.do")
	public void all_reply_delete(HttpServletRequest request,HttpServletResponse response){
		String rno=request.getParameter("rno");
		String result="";
		try{
			AllReplyDAO.allReplyDelete(Integer.parseInt(rno));
			result="OK";
		}catch(Exception ex) {
			result=ex.getMessage();
		}
	// Ajax로 전송 
		try{
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	@RequestMapping("all_reply/update.do")
	public void all_reply_update(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		
		String result="";
		try {
			Map map=new HashMap();
			map.put("rno", rno);
			map.put("msg", msg);
			AllReplyDAO.allReplyUpdate(map);
			result="OK";
		}catch(Exception ex) {
			result=ex.getMessage();
		}
		
		// Ajax 전송
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
}
