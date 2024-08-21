package com.sist.vo;


/*
 *  이름      널?       유형           
	------- -------- ------------ 
	CNO     NOT NULL NUMBER       
	GNO              NUMBER       
	TYPE             NUMBER       
	ID               VARCHAR2(20) 
	ACCOUNT          NUMBER       
	PRICE            NUMBER       
	ISBUY            CHAR(1)      
 */
import java.util.*;
import lombok.Data;
@Data
public class CartVO {
	private int cno,gno,type,account,price;
	private String id,isbuy,dbday;
	private Date regdate;
}
