package com.sist.dao;

import lombok.Data;
// request/ response/ => session / => cookie
// application / pageContext/ out
// =========== getRealPath() 
@Data
public class MemberVO {
	private String id,name,pwd;
}
