package com.sist.vo;

import lombok.Data;

@Data
public class FoodVO {
	private int fno;
	private String name,type,phone,address,theme,poster,content;
	private double score;
	private int hit,jjimcount,likecount;
}
