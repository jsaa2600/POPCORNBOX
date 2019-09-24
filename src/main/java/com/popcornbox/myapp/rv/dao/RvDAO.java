package com.popcornbox.myapp.rv.dao;

import java.util.List;

import com.popcornbox.myapp.rv.dto.RvDTO;

public interface RvDAO {

	// 리뷰 쓰기
	int write(RvDTO rvDTO);

	// 리뷰 수정
	int modify(RvDTO rvDTO);
	
	// 리뷰 삭제
	int delete(String rvnum);
	
	// 리뷰 좋아요 싫어요
	int goodOrBad(String rvnum, String goodOrBad);
	
	// 리뷰 목록
	List<RvDTO> list();						// 전체 목록
	List<RvDTO> list(String rvmoviecd);		// 특정 영화 리뷰 목록
	
	// 리뷰 총계
	int rvTotalRec(String rvmoviecd);
	
}
