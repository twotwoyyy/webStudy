package com.sist.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.Model;

/*
 *   1. JSP / Servlet => Model 1방식
 *      = 장점 
 *        1) 서블릿 => 자바 코드만으로 HTML 코드 작성 => 오류 발생할 확률이 낮다
 *        2) JSP => 자바 코드만으로 HTML 코드 작성 => 오류 발생할 확률이 낮다
 *        3) 단순하다 => 자바 / HTML을 구분
 *      = 단점
 *        1) 가독성이 떨어진다 => Java + HTML 
 *        2) 자바의 로직이나 데이터베이스 => 노출이 된다 (JSP는 배포시에 모든 소스를 전달)
 *                                  ========
 *                                  다른 개발자 => 유지 보수 
 *                                  실제 개발 : 6개월 개발 / 6개월 유지보수 
 *      = 사용처
 *   2. MVC => Model 2방식 
 *      => JSP / Servlet => 보완 
 *        => 1. 확장성 / 재사용 증가
 *        => 2. 보안이 필요한 경우 처리 (HTML / Java 완전 분리)
 *        => 3. 분업화 => Front-End / Back-End 
 *        => 4. Controller로 집중적 => 서버에 부하가 많을 수 있다
 *              ========================================
 *              1) Front-End의 MVC => Redux / Flux / Vuex
 *              2) 서버를 나눠서 동시 구동 => MSA 
 *                                     ==== 애자일 기법 
 *       => 비용이 많이 들어간다
 *       => 목적은 유지 보수 목적 => 쉽게 수정 / 추가
 *       => 모든 편집기 => 어시스트
 *     => 공기업 / 금융권 / 대기업 : MVC 구조로 만들어져 있다 
 *        ==================   =======
 */
// Controller는 고정 => 추가, 수정 (파일 => XML) 
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] strCls= {
		"com.sist.model.MovieListModel",
		"com.sist.model.MovieDetailModel"
	};
	private String[] strCmd= {
		"list.do",
		"detail.do"
	};
	private Map clsMap=new HashMap();
	// => 1. 클래스 등록, 2. SQL 문장 등록, 3. 클라이언트 정보 등록
	//       Spring       MyBatis        WebSocket
	// => 웹은 거의 대부분이 Map방식을 사용 
	// request, session, cookie => 키,값을 쌍으로 저장 
	// => JSON => 자바스크립트 객체 표현법 
	public void init(ServletConfig config) throws ServletException {
		try {
			for(int i=0;i<strCls.length;i++) {
				Class clsName=Class.forName(strCls[i]); // 메모리 할당, 클래스 정보 읽기 
				// => 제어 : 리플렉션 
				Object obj=clsName.getDeclaredConstructor().newInstance();
				// 클래스 메모리 할당 (new x) => new 결합성 높음, 사용 자제
				clsMap.put(strCmd[i],obj);
				// System.out.println(strCmd[i]+":"+obj);
				// 시작과 동시에 클래스 메모리 저장 => 변경이 없다 (싱글턴)
				
			}
		}catch(Exception ex) {}
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Model model1=(Model) clsMap.get("list.do");
//		Model model2=(Model) clsMap.get("list.do");
//		Model model3=(Model) clsMap.get("list.do");
//		Model model4=(Model) clsMap.get("list.do");
//		Model model5=(Model) clsMap.get("list.do");
//		System.out.println("model1="+model1);
//		System.out.println("model2="+model2);
//		System.out.println("model3="+model3);
//		System.out.println("model4="+model4);
//		System.out.println("model5="+model5);
		// 사용자 요청 사항 
		// http://localhost/JSPMVCTotalProject/movie/list.do
		// cmd=cmd.substring=>ContextPath...어쩌고 // movie 앞까지 자른다
		String cmd=request.getRequestURI();
		// 해당 Model 찾기 => 기능별로 나눠서 작업 
		cmd=cmd.substring(cmd.lastIndexOf("/")+1);
		Model model=(Model)clsMap.get(cmd);
		// JSP에 전송할 데이터를 가지고 온다 
		String jsp=model.execute(request, response);
		// JSP => request 전송 
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
		
	}

}
