package com.popcornbox.myapp.rv.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

//RVNUM   NUMBER(10,0)   No      1   리뷰 번호
//RVID   VARCHAR2(30 BYTE)   No      2   작성자 아이디
//RVNICKNAME   VARCHAR2(24 BYTE)   No      3   작성자 닉네임
//RVTITLE   VARCHAR2(100 BYTE)   Yes      4   리뷰 제목
//RVCONTENT   VARCHAR2(1000 BYTE)   No      5   리뷰 내용
//RVPOP   NUMBER(3,1)   Yes   NULL    6   리뷰 별점
//RVGOOD   NUMBER(10,0)   No   0    7   리뷰 좋아요
//RVBAD   NUMBER(10,0)   No   0    8   리뷰 싫어요
//RVCDATE   DATE   No   SYSDATE    9   리뷰 생성일
//RVUDATE   DATE   Yes      10   리뷰 수정일
//RVGROUP   NUMBER(10,0)   No      11   리뷰 그룹
//RVSTEP   NUMBER(10,0)   No   0    12   리뷰 단계
//RVINDENT   NUMBER(10,0)   No   0    13   리뷰 들여쓰기
//RVMOVIECD   VARCHAR2(10 BYTE)   No      14   리뷰 영화코드
//RVMOVIENM   VARCHAR2(100 BYTE)   No      15   리뷰 영화제목
//RVMOVIEOPENDT   VARCHAR2(20 BYTE)   No      16   리뷰 영화개봉일
//RVMOVIEGENRE   VARCHAR2(50 BYTE)   No      17   리뷰 영화장르

@Data
public class RvDTO {
	
	private int rvnum;            // 리뷰 번호 (PK)
  private String rvid;         // 작성자 아이디 (FK)
  private String rvnickname;      // 작성자 닉네임
  private String rvtitle;         // 리뷰 제목
  private String rvcontent;      // 리뷰 내용
  private double rvpop;         // 리뷰 별점
  
  private int rvgood;            // 리뷰 좋아요
  private int rvbad;            // 리뷰 싫어요
  
  @JsonFormat(pattern="yyyy.MM.dd a h:mm", timezone="Asia/Seoul")
  private Date rvcdate;         // 리뷰 생성일
  @JsonFormat(pattern="yyyy.MM.dd a h:mm", timezone="Asia/Seoul")
  private Date rvudate;         // 리뷰 수정일
  
  private int rvgroup;         // 리뷰 그룹
  private int rvstep;            // 리뷰 단계
  private int rvindent;         // 리뷰 들여쓰기
  
  private String rvmoviecd;      // 리뷰 영화코드
  private String rvmovienm;      // 리뷰 영화제목
  private String rvmovieopendt;   // 리뷰 영화개봉일
  private String rvmoviegenre;   // 리뷰 영화장르
	
}
