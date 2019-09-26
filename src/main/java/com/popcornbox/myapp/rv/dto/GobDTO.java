package com.popcornbox.myapp.rv.dto;

import lombok.Data;

//GOBNUM	NUMBER(10,0)	No		1	번호
//GOBIDFROM	VARCHAR2(30 BYTE)	No		2	송신 아이디
//GOBIDTO	VARCHAR2(30 BYTE)	No		3	수신 아이디
//GOBRVNUM	NUMBER(10,0)	No		4	리뷰 번호
//GODMOVIECD	VARCHAR2(20 BYTE)	No		5	영화 코드
//GOBSTATUS	VARCHAR2(20 BYTE)	No		6	상태

@Data
public class GobDTO {

	private int gobnum;				// 번호 (PK)
	private String gobidfrom;		// 송신 아이디 (FK)
	private String gobidto;			// 수신 아이디 (FK)
	private int gobrvnum;			// 리뷰 번호 (FK)
	private String gobmoviecd;		// 영화 코드
	private String gobstatus;		// 상태
}
