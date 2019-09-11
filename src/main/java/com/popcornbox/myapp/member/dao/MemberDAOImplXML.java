package com.popcornbox.myapp.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.popcornbox.myapp.member.dto.MemberDTO;
import com.popcornbox.myapp.member.dto.PasswdDTO;

@Repository
public class MemberDAOImplXML implements MemberDAO {
	
	private static final Logger logger=LoggerFactory.getLogger("MemberDAOImplXML.class");

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int join(MemberDTO memberDTO) {
		logger.info("MemberDAOImplXML.join 호출");
		return sqlSession.insert("mappers.member-mapper.join",memberDTO);
	}

	@Override
	public int modify(MemberDTO memberDTO) {
		logger.info("MemberDAOImplXML.modify 호출");
		return sqlSession.update("mappers.member-mapper.modify", memberDTO);
	}

	@Override
	public int delete(String id, String pw) {

		return 0;
	}

	@Override
	public int memberGrade(String id, int good) {

		return 0;
	}

	@Override
	public MemberDTO getMember(String id) {

		return null;
	}

	@Override
	public List<MemberDTO> getMemberList() {

		return null;
	}

	@Override
	public int changePw(PasswdDTO passwdDTO) {

		return 0;
	}

}
