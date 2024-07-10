package com.sist.dao;

import lombok.Data;

@Data
public class FoodVO {
	private int fno;
	private String name,type,phone,address,theme,poster,content;
	private double score;
}
