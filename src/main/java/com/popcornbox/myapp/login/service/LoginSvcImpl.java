package com.popcornbox.myapp.login.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.popcornbox.myapp.login.dao.LoginDAO;
import com.popcornbox.myapp.member.dto.MemberDTO;

@Service
public class LoginSvcImpl implements LoginSvc {

	@Inject
	private LoginDAO loginDAO;
	
	@Override
	public int login(String id, String pw) {

		return loginDAO.login(id, pw);
	}

	@Override
	public MemberDTO getMember(String id, String pw) {

		return loginDAO.getMember(id, pw);
	}

}
