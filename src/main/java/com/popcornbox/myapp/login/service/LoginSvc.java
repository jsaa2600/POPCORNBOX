package com.popcornbox.myapp.login.service;

import com.popcornbox.myapp.member.dto.MemberDTO;

public interface LoginSvc {
	//로그인 체크
	int login(String id, String pw);
	
	//회원정보 가져오기
	MemberDTO getMember(String id, String pw);
}
