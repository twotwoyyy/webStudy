package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
public class AllReplyVO {
	private int rno,cno,type;
	private String id,name,msg,dbday;
	private Date regdate;
}
