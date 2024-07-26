package com.sist.manager;

import lombok.Data;

/*
 * {
 * "thumbUrl":"/common/mast/movie/2024/07/thumb/thn_8b6e20a95bc6477e88dc0d42f255539b.jpg",
 * "movieNm":"데드풀과 울버린",
 * "director":"숀 레비",
 * "genre":"액션,코미디,SF",
 * "watchGradeNm":"청소년관람불가",
 * "rank":1,
 * 
 * 1. 오라클 : DAO 
 * 2. Jsoup(크롤링), Open API => Manager 
 * ==================================== Service 
 */
@Data
public class MovieVO {
	private String poster,title,director,genre,grade,story;
	private int rank;
}
