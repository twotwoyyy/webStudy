package com.sist.model;

import javax.servlet.http.HttpServletRequest;

public class BoardInsertModel implements Model{
  public String execute(HttpServletRequest request)
  {
     return "insert.jsp";
  }
}