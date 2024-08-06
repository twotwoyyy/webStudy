package com.sist.dao;

import lombok.Data;

/*
 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 HNO                                       NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(2000)
 ADDR                                      NOT NULL VARCHAR2(2000)
 POINT                                     NOT NULL VARCHAR2(4000)
 TYPE                                      NOT NULL VARCHAR2(1000)
 MENU                                      NOT NULL VARCHAR2(2000)
 MEALCOST                                  NOT NULL VARCHAR2(2000)
 MAP                                       NOT NULL VARCHAR2(2000)
 HOMEPAGE                                  NOT NULL VARCHAR2(2000)
 IMAGE1                                             VARCHAR2(4000)
 IMAGE2                                             VARCHAR2(4000)
 */
@Data
public class HallVO {
	private int hno;
	private String name,addr,point,type,menu,mealcost,map,homepage,image;
}
