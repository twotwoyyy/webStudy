package com.sist.dao;

import lombok.Data;

/*
 *  
 NO                                        NOT NULL NUMBER(38)
 GOODS_NAME                                         VARCHAR2(4000)
 GOODS_SUB                                          VARCHAR2(4000)
 GOODS_PRICE                                        VARCHAR2(26)
 GOODS_DISCOUNT                                     NUMBER(38)
 GOODS_FIRST_PRICE                                  VARCHAR2(26)
 GOODS_DELIVERY                                     VARCHAR2(4000)
 GOODS_POSTER                                       VARCHAR2(4000)
 HIT                                                NUMBER(38)
 */
@Data
public class GoodsVO {
	private int no, discount, rprice;
	private String name, sub, price, first_price, delivery, poster; 
}
