package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
public class EmpModel {
   @RequestMapping("js/js_06.do")
   public void empListData(HttpServletRequest request,HttpServletResponse response)
   {
      EmpDAO dao=EmpDAO.newInstance();
      List<EmpVO> list=dao.empListData();
      // 자바스크립트가 인식 => List => [] , VO => {}
      JSONArray arr=new JSONArray(); //[{},{},{}..]
      for(EmpVO vo:list)
      {
         JSONObject obj=new JSONObject();
         obj.put("empno", vo.getEmpno());
         obj.put("ename", vo.getEname());
         obj.put("job", vo.getJob());
         obj.put("dbday", vo.getDbday());
         obj.put("sal", vo.getSal());
         
         arr.add(obj);
      }
      System.out.println(arr.toJSONString());
      //request.setAttribute(null, arr);
      try
      {
         PrintWriter out=response.getWriter();
         out.write(arr.toJSONString());
      }catch(Exception ex) {}
   }
}
