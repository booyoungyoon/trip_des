package com.trip.domain;

import java.util.Date;

/*
 *   board_num number NOT NULL primary key,
   board_title varchar2(50) NOT NULL,
   board_content varchar2(4000) not null,
   board_date date default sysdate,
   hits number NOT NULL,
   board_image varchar2(4000) NULL,
   board_like number not null,
   --fk Ãß°¡
   usernum number not null,
 */
public class BoardVO {
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String hits;
	private String boardImage;
	private String boardLike;
}
