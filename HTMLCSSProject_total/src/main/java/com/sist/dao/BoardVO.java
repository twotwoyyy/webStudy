package com.sist.dao;
import java.util.*;

import lombok.Data;
/*
 *  NO                                        NOT NULL NUMBER
 	NAME                                      NOT NULL VARCHAR2(4000)
 	SUBJECT                                   NOT NULL VARCHAR2(4000)
 	CONTENT                                   NOT NULL CLOB
 	PWD                                       NOT NULL VARCHAR2(4000)
 	REGDATE                                            DATE
 	HIT                                                NUMBER
 */
@Data
public class BoardVO {
	private int no,hit;
	private String name,subject,content,pwd,db_day;
	private Date regdate;
}
