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
	public int memberGrade(String id) {
		logger.info("MemberDAOImplXML.grade 호출");

		return sqlSession.delete("mappers.member-mapper.delete",id);
	}

	@Override
	public MemberDTO getMember(String id) {
		logger.info("MemberDAOImplXML.getMember 호출");
		return sqlSession.selectOne("mappers.member-mapper.getMember", id);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		logger.info("MemberDAOImplXML.getMemberList 호출");
		return sqlSession.selectList("mappers.member-mapper.getMemberList");
	}

	@Override
	public int changePw(PasswdDTO passwdDTO) {
		logger.info("MemberDAOImplXML.changePw 호출");
		return sqlSession.update("mappers.member-mapper.changePw", passwdDTO);
	}

	@Override
	public int goodOrBad(String id, String goodOrBad) {
		logger.info("MemberDAOImplXML.goodOrBad 호출");
		Map<String,String> map=new HashMap<>();
		map.put("id", id);
		map.put("goodOrBad", goodOrBad);
		return sqlSession.update("mappers.member-mapper.goodOrBad",map);
	}


}
