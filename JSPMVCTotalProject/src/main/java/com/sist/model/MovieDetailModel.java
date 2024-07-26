package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 *	관련 클래스가 많은 경우 : 한 개로 모아서 처리 => 인터페이스
 *  1. 여러 개 => 한 개로 묶음
 *     변수 여러 개 => 배열 
 *     클래스 여러 개 => 인터페이스 
 *  2. 메소드 여러 개 => 구분자 (임의로 결정, 제공하는 구분자)
 *                         ======== =============
 *                         1. a()    Annotation
 *                         2. b()
 *                         3. c() 
 *  3. 재사용, 확장성, 가독성, 최적화, 접근성 
 */
public class MovieDetailModel implements Model{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

}
