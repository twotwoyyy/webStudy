package com.sist.model;

import javax.servlet.http.HttpServletRequest;
// 처리하는 기능이 비슷한 경우 => 클래스를 통합 => 인터페이스 => 조건문 없이 찾을 수 있다  
public interface Model {
	public String execute(HttpServletRequest request);
}
