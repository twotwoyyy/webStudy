package com.sist.change;

public class JspChange {
	private String[] jsp={"../food/home.jsp",
			"../food/detail.jsp","../goods/list.jsp","../goods/detail.jsp"};
	public String change(int no) {
	
		return jsp[no];
	}
}
