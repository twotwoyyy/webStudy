package com.sist.dao;

import java.util.Date;

import lombok.Data;

/*
   이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(50)
 SUBJECT                                   NOT NULL VARCHAR2(2000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER
 FILENAME                                           VARCHAR2(260)
 FILESIZE                                           NUMBER
 */
/*
 *	데이터베이스 연결 데이터 값을 저장한 후 한번에 브라우저로 전송할 목적 
 *	=> 데이터를 보호하는 목적 : 캡슐화
 *		=> private 변수 사용
 *	=> 사용이 가능하게 만든다
 *		=> 변수 : 읽기/쓰기 => 기능을 만들어서 처리
 *	            ======== getter/setter 
 *	=> JSP : Bean
 *	=> 생성시에 사용하는 태그
 *		<jsp:userBean>
 *		<jsp:setProperty> => MVC(Spring) 사용빈도가 없다
 *	=> 매칭 : 데이터베이스 컬럼
 *			 크롤링 데이터 매칭
 *	  데이터베이스
 *	  문자형 : CHAR, VARCHAR2, CLOB => String
 *	  숫자형 : NUMBER => NUMBER(8,2)
 *	
 */
/*
 * 
 * -- 파일 업로드 : => 답변형 게시판 => 홈페이지 => MV/MVC => EL / JSTL 
DROP TABLE databoard;
DROP SEQUENCE db_no_seq;

CREATE TABLE databoard(
	no NUMBER,
	name VARCHAR2(50) CONSTRAINT db_name_nn NOT NULL,
	subject VARCHAR2(2000) CONSTRAINT db_sub_nn NOT NULL,
	content CLOB CONSTRAINT db_cont_nn NOT NULL,
	pwd VARCHAR2(10) CONSTRAINT db_pwd_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	filename VARCHAR2(260),
	filesize NUMBER DEFAULT 0,
	CONSTRAINT db_no_pk PRIMARY KEY(no)
);


CREATE SEQUENCE db_no_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
 */
@Data
public class DataBoardVO {
	private int no,filesize,hit;
	private String name,subject,content,pwd,filename,dbday;
	private Date regdate;
}
