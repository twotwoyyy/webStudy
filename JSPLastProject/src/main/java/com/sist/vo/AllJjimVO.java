package com.sist.vo;
/*
 *  이름      널?       유형           
	------- -------- ------------ 
	JNO     NOT NULL NUMBER       
	CNO              NUMBER       
	TYPE             NUMBER       
	ID               VARCHAR2(20) 
	REGDATE          DATE         
 */
import java.util.*;

import lombok.Data;
@Data
public class AllJjimVO {
	private int jno,cno,type;
	private String id,dbday;
	private Date regdate;
	private FoodVO fvo=new FoodVO();
}	
