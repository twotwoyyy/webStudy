package com.sist.dao;
/*
 *  이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 NO                                        NOT NULL NUMBER
 NAME                                      NOT NULL VARCHAR2(50)
 SUBJCET                                   NOT NULL VARCHAR2(2000)
 CONTENT                                   NOT NULL CLOB
 PWD                                       NOT NULL VARCHAR2(10)
 REGDATE                                            DATE
 HIT                                                NUMBER
 GROUP_ID                                           NUMBER
 GROUP_STEP                                         NUMBER
 GROUP_TAB                                          NUMBER
 ========================= 출력 ========================================
 ROOT                                               NUMBER
 DEPTH                                              NUMBER
 ========================= 삭제 ========================================
 */

import java.util.Date;

import lombok.Data;
@Data
public class BoardVO {
	private int no;
	private String name,subject,content,pwd;
	private Date regdate;
	private int group_id; // 같은 답변을 모아서 관리
	private int group_step; // 답변의 순서를 지정 
	private int group_tab; // 공백 => (들여쓰기)
	private int root; // 어떤 게시물에 대한 ROOT(누구에 대한 답변인지 확인)
	private int depth; // 답변이 몇 개가 달렸는지 확인 
	// 관리자 / 사용자 => 묻고 답하기 (사이트 필수) => 실시간 채팅 
}
