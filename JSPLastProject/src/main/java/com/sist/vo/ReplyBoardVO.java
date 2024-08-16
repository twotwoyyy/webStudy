package com.sist.vo;

/*
 *  이름         널?       유형             
	---------- -------- -------------- 
	NO         NOT NULL NUMBER         
	ID                  VARCHAR2(20)   
	NAME       NOT NULL VARCHAR2(50)   
	SUBJECT    NOT NULL VARCHAR2(2000) 
	CONTENT    NOT NULL CLOB           
	REGDATE             DATE           
	GROUP_ID            NUMBER         
	GROUP_STEP          NUMBER         
	ISREPLY             NUMBER     
	HIT                 NUMBER         
 */
import java.util.*;

import lombok.Data;
@Data
public class ReplyBoardVO {
	private int no,group_id,group_step,isreply,hit;
	private String id,name,subject,content,dbday;
	private Date regdate;
}
