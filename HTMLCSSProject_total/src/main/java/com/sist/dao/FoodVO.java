package com.sist.dao;

import lombok.Data;

/*
		 FNO                                       NOT NULL NUMBER
		 NAME                                      NOT NULL VARCHAR2(200)
		 TYPE                                      NOT NULL VARCHAR2(200)
		 PHONE                                              VARCHAR2(30)
		 ADDRESS                                            VARCHAR2(700)
		 SCORE                                              NUMBER(2,1)
		 THEME                                              CLOB
		 POSTER                                    NOT NULL VARCHAR2(260)
		 CONTENT                                            CLOB
		 HIT                                                NUMBER
		 JJIMCOUNT                                          NUMBER
		 LIKECOUNT                                          NUMBER
		 
		 desc table_name; 확인 
		 
		 변수명 = 컬럼명 동일 
		 => 데이터를 브라우저로 전송할 목적 VO(~DTO) => JSP(Bean) => 자바 12장 
		    ===================== 해킹 가능성 
		     => 반드시 캡슐화 사용 => 데이터를 감추고 메소드를 통해 접근 private 
		 데이터형 일치 
		 ========= 테이블 한 개 => VO/DAO
		   오라클 데이터형 
		   ==========
		   CHAR, VARCHAR2, CLOB => String 
		   NUMBER => int / double (NUMBER(2,1))
		   DATE   => java.util.Date(java.sql.Date) 
		             => 오늘  : SYSDATE 
		             => 예약일 : YY/MM/DD => TO_DATE로 변환 후에 INSERT
		   VO => 한 개의 맛집 
		         ========= 상세 보기
		   목록 출력 => 여러 개의 맛집 (VO가 여러 개 => 묶어야 한다 => List)
		              ========= 리스트 
		   MyBatis / JPA => 컬럼이 다르면 변경
		   
 */
@Data
public class FoodVO {
	private int fno;
	private String name,type,phone,address,theme,poster,content;
	private double score;
}
