package com.sist.dao;

import lombok.Data;

/*
	  이름                                      널?      유형
	 ----------------------------------------- -------- ----------------------------
	 ID                                        NOT NULL VARCHAR2(20)
	 PWD                                       NOT NULL VARCHAR2(10)
	 NAME                                      NOT NULL VARCHAR2(51)
	 SEX                                                CHAR(6)
	 BIRTDAY                                            VARCHAR2(10)
	 POST                                      NOT NULL VARCHAR2(7)
	 ADDR1                                     NOT NULL VARCHAR2(150)
	 ADDR2                                              VARCHAR2(150)
	 PHONE                                              VARCHAR2(13)
	 EMAIL                                              VARCHAR2(100)
	 CONTENT                                            CLOB
	 REGDATE                                            DATE
	 ADMIN                                              CHAR(1)
 */
@Data
public class MemberVO {
	private String id, pwd, name, admin;
}
