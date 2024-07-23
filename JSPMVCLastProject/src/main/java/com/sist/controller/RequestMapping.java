package com.sist.controller;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME) // 객체 저장 기간 => 프로그램 종료시까지 유지
@Target(METHOD) // 구분자
/*
 *	TYPE : 클래스 구분자
 *	METHOD : 메소드 구분자
 *  PARAMETER : 매개변수 구분자
 *  FIELD : 멤버 변수, 멤버 객체
 *  
 *  위치
 *  public class ClassName{
 *     @ ==> Field
 *     A a;
 *     
 *     @ ==> METHOD
 *     public void display(){
 *     }
 *     public void setA(@ ==> PARAMETER A a){
 *     }
 *     @RequestMapping("구분내용")
 *      => 밑에 있는 메소드 제어 
 */
public @interface RequestMapping {
	public String value();
}
