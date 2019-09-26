package com.popcornbox.myapp.rv.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.popcornbox.myapp.rv.dto.GobDTO;
import com.popcornbox.myapp.rv.dto.RvDTO;

@Repository
public class RvDAOImplXML implements RvDAO {

	private static final Logger logger = LoggerFactory.getLogger(RvDAOImplXML.class);
	
	@Inject
	SqlSession sqlSession;
	
	// 리뷰 쓰기
	@Override
	public int write(RvDTO rvDTO) {
		logger.info("int write(RvDTO) 호출됨"); 
		return sqlSession.insert("mappers.rv-mapper.write", rvDTO);
	}

	// 리뷰 수정
	@Override
	public int modify(RvDTO rvDTO) {
		logger.info("int modify(RvDTO) 호출됨"); 
		return sqlSession.update("mappers.rv-mapper.modify", rvDTO);
	}

	// 리뷰 삭제
	@Override
	public int delete(String rvnum) {
		logger.info("int delete(String) 호출됨");
		return sqlSession.delete("mappers.rv-mapper.delete", rvnum);
	}

	// 리뷰 좋아요 싫어요
	@Override
	public int goodOrBad(GobDTO gobDTO) {
		logger.info("int goodOrBad(GobDTO) 호출됨");
		
		int count = 0;
		String gobstatus = gobDTO.getGobstatus();
		
		// 기존 좋아요&싫어요 삭제
		count = sqlSession.delete("mappers.rv-mapper.deleteGoodOrBad",  gobDTO);
		
		// 새로운 좋아요&싫어요 반영
		if(gobstatus == "good" || gobstatus == "bad") {
			count = sqlSession.insert("mappers.rv-mapper.insertGoodOrBad", gobDTO);
			sqlSession.update("mappers.rv-mapper.updateGoodOrBadOnReview", gobDTO);
			sqlSession.update("mappers.rv-mapper.updateGoodOrBadOnMember", gobDTO);
		}
		
		return count;
	}
	
	// 리뷰 목록(전체 & 특정 영화)
	@Override
	public List<RvDTO> list(String rvmoviecd, int startRec, int endRec) {
		logger.info("List<RvDTO> list(String) 호출됨"); 
		return null;
	}

	// 리뷰 총계
	@Override
	public int rvTotalRec(String rvmoviecd) {
		logger.info("int rvTotalRec(String) 호출됨");
		return sqlSession.selectOne("mappers.rv-mapper.rvTotalRec", rvmoviecd);
	}

}
