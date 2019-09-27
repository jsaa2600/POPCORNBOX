package com.popcornbox.myapp.member.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class MemberDTO {

	@NotNull
	private String id; 				//아이디
	
	private String email; 				//이메일
	private String selectEmail; 	//이메일(주소)
	
	@NotNull
	@Size(min=6,max=10,message="비밀번호는 6~10자리로 입력하세요.")
	private String pw; 				//비밀번호
	@Size(min=2,max=10,message="닉네임은 2~10자리로 입력하세요.")
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
	private int grade;     //회원등급
	private int good; 				//좋아요
	private int bad;				  //싫어요
	private int review;				  //본인이 쓴 리뷰 수
	private String status;				  //상태
}
