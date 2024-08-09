package com.sist.vo;
import java.util.*;

import lombok.Data;
@Data
public class BoardReplyVO {
	private int rno,bno;
	private String id,name,msg,dbday;
	private Date regdate;
}
