package com.popcornbox.myapp.login.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.popcornbox.myapp.member.dto.MemberDTO;

@Repository
public class LoginDAOImplXML implements LoginDAO {

	private static final Logger logger=LoggerFactory.getLogger("MemberDAOImplXML.class");
	
	@Inject
	private SqlSession sqlSession;
	
	//로그인 체크
	@Override
	public int login(String id, String pw) {
		logger.info("LoginDAOImplXML.isMember 호출");
		
		Map<String,String> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);

		return sqlSession.selectOne("mappers.login-mapper.login", map);
	}

	//회원정보조회
	@Override
	public MemberDTO getMember(String id, String pw) {
		logger.info("LoginDAOImplXML.getMember 호출");
		 Map<String,String> map=new HashMap<>(); 
		 map.put("id", id); 
		 map.put("pw", pw);
		return sqlSession.selectOne("mappers.login-mapper.getMember", map);
	}

}
