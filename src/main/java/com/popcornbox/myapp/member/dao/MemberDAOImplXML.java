package com.popcornbox.myapp.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		logger.info("MemberDAOImplXML.delete 호출");
		Map<String,String> map=new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.delete("mappers.member-mapper.delete",map);
	}

	@Override
	public int memberGrade(String id, int good) {

		return 0;
	}

	@Override
	public MemberDTO getMember(String id) {
		logger.info("MemberDAOImplXML.getMember 호출");
		return sqlSession.selectOne("mappers.member-mapper.getMember", id);
	}

	@Override
	public List<MemberDTO> getMemberList() {

		return null;
	}

	@Override
	public int changePw(PasswdDTO passwdDTO) {
		logger.info("MemberDAOImplXML.changePw 호출");
		return sqlSession.update("mappers.member-mapper.changePw", passwdDTO);
	}

	@Override
	public int good(String id, String good) {
		
		return sqlSession.update("mappers.member-mapper.good", id);
	}

	@Override
	public int bad(String id, String bad) {
		
		return sqlSession.update("mappers.member-mapper.bad", id);
	}

}
