package com.popcornbox.myapp.member.service;

import java.util.List;

import com.popcornbox.myapp.member.dto.MemberDTO;
import com.popcornbox.myapp.member.dto.PasswdDTO;


public interface MemberSvc {

//회원 등록
	int join(MemberDTO memberDTO);
	
	//회원 수정
	int modify(MemberDTO memberDTO);
	
	//회원 탈퇴(회원용)
	int delete(String id,String pw);
	
	//회원 등급
	int memberGrade(String id, int good);
	
	//회원 조회(회원용)
	MemberDTO getMember(String id);
	
	//회원 목록 조회(관리자용)
	List<MemberDTO> getMemberList();
	
	//회원 비밀번호 변경
	int changePw(PasswdDTO passwdDTO);
	
	//댓글 호감 비호감
	int goodOrBad(String id, String goodOrBad);
}
