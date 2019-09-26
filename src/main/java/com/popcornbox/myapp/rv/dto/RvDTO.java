package com.popcornbox.myapp.rv.dto;

import java.util.Date;

import lombok.Data;

//RVNUM	NUMBER(10,0)	No		1	리뷰 번호
//RVID	VARCHAR2(30 BYTE)	No		2	작성자 아이디
//RVNICKNAME	VARCHAR2(24 BYTE)	No		3	작성자 닉네임
//RVTITLE	VARCHAR2(100 BYTE)	Yes		4	리뷰 제목
//RVCONTENT	VARCHAR2(1000 BYTE)	No		5	리뷰 내용
//RVPOP	FLOAT	No	2.5 	6	리뷰 별점
//RVGOOD	NUMBER(10,0)	No	0 	7	리뷰 좋아요
//RVBAD	NUMBER(10,0)	No	0 	8	리뷰 싫어요
//RVCDATE	DATE	No	SYSDATE 	9	리뷰 생성일
//RVUDATE	DATE	Yes		10	리뷰 수정일
//RVGROUP	NUMBER(10,0)	No		11	리뷰 그룹
//RVSTEP	NUMBER(10,0)	No	0 	12	리뷰 단계
//RVINDENT	NUMBER(10,0)	No	0 	13	리뷰 들여쓰기
//RVMOVIECD	NUMBER(10,0)	No		14	리뷰 영화코드

@Data
public class RvDTO {
	
	private int rvnum;				// 리뷰 번호 (PK)
	private String rvid;			// 작성자 아이디 (FK)
	private String rvnickname;		// 작성자 닉네임
	private String rvtitle;			// 리뷰 제목
	private String rvcontent;		// 리뷰 내용
	private double rvpop;			// 리뷰 별점
	private int rvgood;				// 리뷰 좋아요
	private int rvbad;				// 리뷰 싫어요
	private Date rvcdate;			// 리뷰 생성일
	private Date rvudate;			// 리뷰 수정일
	private int rvgroup;			// 리뷰 그룹
	private int rvstep;				// 리뷰 단계
	private int rvindent;			// 리뷰 들여쓰기
	private String rvmoviecd;		// 리뷰 영화코드
	
}
