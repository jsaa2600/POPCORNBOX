package com.popcornbox.myapp.rv.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.popcornbox.myapp.common.PageCriteria;
import com.popcornbox.myapp.common.RecordCriteria;
import com.popcornbox.myapp.rv.dao.RvDAO;
import com.popcornbox.myapp.rv.dto.GobDTO;
import com.popcornbox.myapp.rv.dto.RvDTO;

@Service
public class RvServiceImpl implements RvService {

	private static final Logger logger = LoggerFactory.getLogger(RvServiceImpl.class);
	
	@Inject
	@Qualifier("rvDAOImplXML")
	RvDAO rvDAO;
	
	// 리뷰 쓰기
	@Override
	public int write(RvDTO rvDTO) {
		logger.info("int write(RvDTO) 호출됨"); 
		return rvDAO.write(rvDTO);
	}

	// 리뷰 수정
	@Override
	public int modify(RvDTO rvDTO) {
		logger.info("int modify(RvDTO) 호출됨"); 
		return rvDAO.modify(rvDTO);
	}

	// 리뷰 삭제
	@Override
	public int delete(String rvnum) {
		logger.info("int delete(String) 호출됨"); 
		return rvDAO.delete(rvnum);
	}

	// 리뷰 좋아요 싫어요
	@Override
	public int goodOrBad(GobDTO gobDTO) {
		logger.info("int goodOrBad(String, String) 호출됨"); 
		return rvDAO.goodOrBad(gobDTO);
	}

	// 리뷰 목록(전체 & 특정 영화)
	@Override
	public List<RvDTO> list(String rvmoviecd, int startRec, int endRec) {
		logger.info("List<RvDTO> list(String, int, int) 호출됨"); 

		return rvDAO.list(rvmoviecd, startRec, endRec);
	}

	// 리뷰 총계
	@Override
	public int rvTotalRec(String rvmoviecd) {
		logger.info("int rvTotalRec(String) 호출됨"); 
		return rvDAO.rvTotalRec(rvmoviecd);
	}
}
