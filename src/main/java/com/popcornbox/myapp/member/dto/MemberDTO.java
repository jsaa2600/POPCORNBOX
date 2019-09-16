package com.popcornbox.myapp.member.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberDTO {

	private String id; 				//아이디
	
	private String email; 				//이메일
	private String selectEmail; 	//이메일(주소)
	
	private String pw; 				//비밀번호
	private String nickname;  //닉네임
	
	private String tel1; 			//전화번호1
	private String tel2; 			//전화번호2
	private String tel3; 			//전화번호3
	
	private String region; 		//지역
	private String birth; 		//생년월일
	private String gender; 		//성별
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Timestamp cdate;  //가입일
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Timestamp udate;  //수정일
	private String grade;     //회원등급
	private int good; 				//좋아요
	private int bad;				  //싫어요
}
