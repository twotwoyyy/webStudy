package com.sist.model;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class DataboardModel {
	@RequestMapping("databoard/insert.do")
	public String databoard_insert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../databoard/insert.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("databoard/insert_ok.do")
	public String databoard_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String path="c:\\project_upload";
			String enctype="UTF-8"; // 한글 파일명 
			int max_size=1024*1024*100; // 100MB
			MultipartRequest mr=new MultipartRequest(request, path, max_size, enctype, new DefaultFileRenamePolicy());
			// 자동 변경 a.jpg => a1.jpg
			String name=mr.getParameter("name");
			String subject=mr.getParameter("subject");
			String content=mr.getParameter("content");
			String pwd=mr.getParameter("pwd");
			String filename=mr.getFilesystemName("upload");
			
			DataboardVO vo=new DataboardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			if(filename==null) { // upload가 없는 상태 
				vo.setFilename("");
				vo.setFilesize(0);
			}else { // upload가 된 상태 
				File file=new File(path+"\\"+filename);
				vo.setFilename(filename);
				vo.setFilesize((int)file.length()); // int => 2byte
			}
			DataBoardDAO.databoardInsert(vo);
		}catch(Exception ex) {}
		return "redirect:../databoard/list.do";
	}
	@RequestMapping("databoard/list.do")
	public String databoard_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*10)-9);
		map.put("end", curpage*10);
		
		List<DataboardVO> list=DataBoardDAO.databoardListData(map);
		int count=DataBoardDAO.databoardRowCount();
		int totalpage=(int)(Math.ceil(count/10.0));
		count=count-((curpage*10)-10);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String today=sdf.format(date);
		request.setAttribute("today", today);
		request.setAttribute("main_jsp", "../databoard/list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("databoard/detail.do")
	public String databoard_detail(HttpServletRequest request, HttpServletResponse response) {
		//ajax(void), _ok(redirect:)
		String no=request.getParameter("no");
		DataboardVO vo=DataBoardDAO.databoardDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../databoard/detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("databoard/download.do")
	public void databoard_download(HttpServletRequest request, HttpServletResponse response) {
		try {
			String fn=request.getParameter("fn");
			File file=new File("c:\\project_upload\\"+fn);
			// header => 전송 : 파일명, 파일크기
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fn,"UTF-8"));
			response.setContentLength((int)file.length());
			
			BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));
			// 서버에서 값을 읽는다(파일 읽기)
			BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
			// 다운로드를 요청한 클라이언트 
			byte[] buffer=new byte[1024]; // 파일 저장 공간
			int i=0; // 읽은 bytes 수 
			while((i=bis.read(buffer, 0, 1024))!=-1) {
				bos.write(buffer,0,i);
			}
			bis.close();
			bos.close();
			
		}catch(Exception ex) {}
	}
	// Model => 사용자 요청 처리 => 결과값 / 화면 이동 
	@RequestMapping("databoard/delete.do")
	public void databoard_delete(HttpServletRequest request, HttpServletResponse response) {
		// {"no":no, "pwd":pwd} => delete.do?no=1$pwd=1234
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		// 데이터베이스 연동
		DataboardVO vo=DataBoardDAO.databoardFileInfoData(Integer.parseInt(no));
		String result=DataBoardDAO.databoardDelete(Integer.parseInt(no), pwd);
		// 파일 삭제 처리
		try {
			if(vo.getFilesize()>0) {
				File file=new File("c:\\project_upload\\"+vo.getFilename());
				file.delete();
			}
		}catch(Exception ex) {}
		// 결과값을 받아서 Ajax로 전송
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	/*
	 *   <form> <a> : 서버로 전송 => 요청값
	 *   ======================
	 *   서버에서 처리 결과 : request.setAttribute() => 응답값
	 *   
	 *   벤치마킹 : 1) 서버로 전송되는 데이터 확인 : 주소란 
	 *            2) 출력 화면 : 어떤 데이터가 필요한지 확인 
	 *            ================================== 웹사이트 70%
	 */
	@RequestMapping("databoard/update.do")
	public String databoard_update(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		DataboardVO vo=DataBoardDAO.databoardUpdateData(Integer.parseInt(no));
		//데이터를 request에 추가해서 jsp로 전송
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../databoard/update.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("databoard/password_check.do")
	public void databoard_pwd_check(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String db_pwd=DataBoardDAO.databoardGetPassword(Integer.parseInt(no));
		String result="no";
		if(db_pwd.equals(pwd)) {
			result="yes";
		}
		try {
			PrintWriter out=response.getWriter();
			out.write(result);
		}catch(Exception ex) {}
	}
	@RequestMapping("databoard/update_ok.do")
	public String databoard_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String path="c:\\project_upload";
			String enctype="UTF-8"; // 한글 파일명 
			int max_size=1024*1024*100; // 100MB
			MultipartRequest mr=new MultipartRequest(request, path, max_size, enctype, new DefaultFileRenamePolicy());
			// 자동 변경 a.jpg => a1.jpg
			String name=mr.getParameter("name");
			String subject=mr.getParameter("subject");
			String content=mr.getParameter("content");
			String pwd=mr.getParameter("pwd");
			String filename=mr.getFilesystemName("upload");
			String no=mr.getParameter("no");
			
			DataboardVO dvo=DataBoardDAO.databoardFileInfoData(Integer.parseInt(no));
			if(dvo.getFilesize()>0) {
				File file=new File("c:\\project_upload\\"+dvo.getFilename());
				file.delete();
			}
			DataboardVO vo=new DataboardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			vo.setNo(Integer.parseInt(no));
			
			if(filename==null) { // upload가 없는 상태 
				vo.setFilename("");
				vo.setFilesize(0);
			}else { // upload가 된 상태 
				File file=new File(path+"\\"+filename);
				vo.setFilename(filename);
				vo.setFilesize((int)file.length()); // int => 2byte
			}
			DataBoardDAO.databoardUpdate(vo);
		}catch(Exception ex) {}
		return "redirect:../databoard/list.do";
	}
//	@RequestMapping("databoard/find.do")
//	public String databoard_find(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			request.setCharacterEncoding("UTF-8");
//		}catch(Exception ex) {}
//		String fs=request.getParameter("fs");
//		String ss=request.getParameter("ss");
//		// 데이터베이스 연동
//		Map map=new HashMap();
//		map.put("ss", ss);
//		map.put("fs", fs);
//		// 데이터 전송 (결과값 전송)
//		List<DataboardVO> list=DataBoardDAO.databoardFindData(map);
//		request.setAttribute("list", list);
//		request.setAttribute("main_jsp", "../databoard/find.jsp");
//		return "../main/main.jsp";
//	}
	/*
	 * 사용자 요청값 전송
	 * ==============
	 *  목록 => 페이지
	 *  상세보기 => 해당 게시물, 맛집에 대한 고유번호
	 *  검색 => 검색어, 페이지
	 *  로그인 => 아이디, PWD
	 *  =====================================
	 *  목록 => List
	 *  상세보기 => VO
	 *  검색어 => List 
	 *  로그인 => String
	 */
	@RequestMapping("databoard/find.do")
	public String databoard_find(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String[] fsArr=request.getParameterValues("fs");
		String ss=request.getParameter("ss");
		Map map=new HashMap();
		map.put("fsArr", fsArr);
		map.put("ss", ss);
		// 데이터베이스 연동
		List<DataboardVO> list=DataBoardDAO.databoardFindData(map);
		// 결과값 전송
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../databoard/find.jsp");
		return "../main/main.jsp";
	}
}	
