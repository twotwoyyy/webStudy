package com.sist.dao;

import lombok.Data;
/*
 * CREATE TABLE food_house(
  fno NUMBER,
  name VARCHAR2(200) CONSTRAINT fh_name_nn NOT NULL,
  type VARCHAR2(200) CONSTRAINT fh_type_nn NOT NULL,
  phone VARCHAR2(30),
  address VARCHAR2(700),
  score NUMBER(2,1),
  theme CLOB,
  poster VARCHAR2(260) CONSTRAINT fh_poster_nn NOT NULL,
  content CLOB,
  CONSTRAINT fh_fno_pk PRIMARY KEY(fno)
);

CREATE SEQUENCE fh_fno_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

ALTER TABLE food_house ADD hit NUMBER DEFAULT 0;
ALTER TABLE food_house ADD jjimcount NUMBER DEFAULT 0;
ALTER TABLE food_house ADD likecount NUMBER DEFAULT 0;
 */
@Data
public class FoodVO {
	private int fno,hit,jjimcount,likecount;
	private double score;
	private String name,type,phone,address,theme,poster,content;
}
