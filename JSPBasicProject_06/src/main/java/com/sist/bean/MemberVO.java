package com.sist.bean;

import lombok.Data;
// 	VO(value Object),DTO(Data Transfor Objcet),Bean => 같은 개념 
// Spring           MyBatis                    JSP => 데이터를 모아서 한번에 전송할 목적 
// 변수를 제어 => 읽기(getter) / 쓰기(setter)
// => 데이터를 해킹하는 것을 방지 => 숨겨서 보내준다 => 캡슐화 (데이터 보호 목적) 
@Data
public class MemberVO {
	private String name,sex,address,phone;
}
