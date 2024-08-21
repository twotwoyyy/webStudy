package com.sist.vo;

import lombok.Data;

/*
 *   이름     널?       유형             
	------ -------- -------------- 
	NO     NOT NULL NUMBER         
	TITLE  NOT NULL VARCHAR2(1000) 
	POSTER NOT NULL VARCHAR2(500)  
	CHEF   NOT NULL VARCHAR2(100)  
	LINK            VARCHAR2(500)  
	HIT             NUMBER         

 */
@Data
public class RecipeVO {
	private int no,hit;
	private String title,poster,chef,link;
}
