package com.sist.model;

import javax.servlet.http.HttpServletRequest;

/*
 *	MVC
 *	=> HTML / Java 분리하는 과정
 *	=> 분업 / 확장성 / 재사용
 *  => 실제 실무에서는 MVC 사용
 *    => MVC 단점 : 소스가 복잡하다, Controller에 의존하는 경향이 많다
 *                             ============================ 
 *                             | Controller를 여러 개 사용 => 도메인 방식
 *  => Spring => MVC Project : MVC만 사용 가능
 *  
 *  MVC
 *   = model : 자바와 관련된 모든 소스
 *             DAO, VO, Service, Manager
 *             사용자 요청에 따른 데이터를 관리
 *   = View : JSP / HTML / CSS / Javascript => 중심 (태그형 프로그램)
 *            <% %>  <%= %> (사용하지 않는다)
 *            <c:forEach> <c:if> ${}
 *            화면 출력 (Model에서 전송한 데이터 출력)
 *   = Controller : Model과 View를 연결하는 역할
 *                  => Servlet으로 제작되어 있다 (스프링에서 이미 제작 => 서블릿)
 *   
 *   MVC 실행 과정
 *   1. JSP(요청) => <a>, <form>, ajax, javascript
 *      ** JSP에서 요청 (HTML) => 받을 수 있는 파일 
 *                             ==============
 *                             서블릿, JSP로 받을 수 있다
 *   2. Controller가 요청값을 받는다
 *      1) 요청값을 받는다
 *         | request, response 전송
 *      2) 해당 Model을 찾는다 
 *         => 요청에 대한 처리 => 결과값을 request에 담아준다
 *      3) 받아서 출력할 JSP를 찾는다
 *      4) JSP => request를 전송
 *         ===================
 *         forward()를 이용한다 => request를 전송한다
 *      ========================================
 *       ** 모든 화면은 Controller => .do (서블릿을 나타낸다)
 *       ** JSP 화면만 갱신
 *   3. JSP에 화면을 출력하고 Controller에 덮어쓴다 
 *   >> 시작과 끝은 Controller다 (.do ~ .do) => 모든 URL 주소를 .do => 서블릿을 찾을 때 사용
 *         request                request 
 *   JSP ==========> Controller ==========> Model =====> DAO
 *         request                 request에 값을 담는다 
 *   JSP <========== Controller <========== Model 
 *   
 *   list.jsp => 자바 / HTML을 혼합 => list.jsp / ListModel.java
 *   insert.jsp                  => insert.jsp / InsertModel.java
 *   update.jsp                  => update.jsp / UpdateModel.java
 *   delete.jsp                  => delete.jsp / DeleteModel.java
 *   
 */
public class ListModel {
	public String execute(HttpServletRequest request) {
		String msg="게사판 목록";
		request.setAttribute("msg", msg);
		
		return "view/list.jsp";
	}

}
