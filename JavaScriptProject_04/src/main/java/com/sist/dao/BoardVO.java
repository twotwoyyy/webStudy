package com.sist.dao;
/*
 *    1. 목록 => 페이징 기법
 *    2. 상세보기 
 *    3. CRUD => 게시판
 *       = 댓글 
 *    4. 파일 업로드
 *    ===================
 *    MVC / Spring 
 *    
 *    => JSON => Ajax / Vue / React 
 *    => AWS : 호스팅 
 */
import java.util.*;
import lombok.Data;
@Data
public class BoardVO {
	private int no, hit, rownum, group_id, group_step, group_tab, root, depth;
	private String name, subject, content, pwd, dbday;
	private Date regdate;
}
