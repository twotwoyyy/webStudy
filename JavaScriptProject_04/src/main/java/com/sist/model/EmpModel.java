package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class EmpModel {
	@RequestMapping("emp/list.do")
	public String emp_list(HttpServletRequest request, HttpServletResponse response) {
		List<EmpVO> list=EmpDAO.empListData();
		request.setAttribute("list", list);
		return "list.jsp";
	}
	@RequestMapping("emp/detail.do")
	public String emp_detail(HttpServletRequest request, HttpServletResponse response) {
		String empno=request.getParameter("empno");
		EmpVO vo=EmpDAO.empDetailData(Integer.parseInt(empno));
		request.setAttribute("vo", vo);
		return "detail.jsp";
	}
}
