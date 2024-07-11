package com.sist.dao;
import java.util.*;

import lombok.Data;
@Data
public class ReplyVO {
	private int rno,fno,type,no;
	private String id,name,msg,dbday;
	private Date regdate;
}
