package com.sist.vo;

import lombok.Data;

/*
 *   이름        널?       유형            
	--------- -------- ------------- 
	CHEF      NOT NULL VARCHAR2(100) 
	POSTER             VARCHAR2(500) 
	MEM_CONT1          VARCHAR2(100) 
	MEM_CONT3          VARCHAR2(100) 
	MEM_CONT7          VARCHAR2(100) 
	MEM_CONT2          VARCHAR2(100) 
 */
@Data
public class ChefVO {
	private String chef,poster,mem_cont1,mem_cont3,mem_cont7,mem_cont2;
}
