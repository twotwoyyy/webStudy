package com.sist.vo;
import java.util.*;
import lombok.*;
@Data
public class DataboardVO {
	private int no,hit,filesize;
	private String name,subject, content,pwd,dbday,filename;
	private Date regdate;
}
