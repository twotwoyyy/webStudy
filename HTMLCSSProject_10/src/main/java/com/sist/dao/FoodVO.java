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
 */
@Data
public class FoodVO {
	private int fno;
	private String name,type,phone,address,theme,poster,content;
	private double score;
}
