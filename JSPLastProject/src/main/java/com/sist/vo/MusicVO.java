package com.sist.vo;

import lombok.Data;

/*
 *  이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 MNO                                       NOT NULL NUMBER
 TITLE                                     NOT NULL VARCHAR2(2000)
 SINGER                                    NOT NULL VARCHAR2(2000)
 ALBUM                                              VARCHAR2(2000)
 POSTER                                    NOT NULL VARCHAR2(300)
 STATE                                              CHAR(12)
 IDCREMENT                                          NUMBER
 */
@Data
public class MusicVO {
	private int mno,idcrement;
	private String title,singer,album,state,poster;
}
