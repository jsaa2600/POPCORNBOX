package com.popcornbox.myapp.rv.service;

import java.util.List;

import com.popcornbox.myapp.rv.dto.GobDTO;
import com.popcornbox.myapp.rv.dto.RvDTO;

public interface RvService {

	// 리뷰 쓰기
		int write(RvDTO rvDTO);

		// 리뷰 수정
		int modify(RvDTO rvDTO);
		
		// 리뷰 삭제
		int delete(String rvnum);
		
		// 리뷰 좋아요 싫어요
		int goodOrBad(GobDTO gobDTO);
		
		// 리뷰 목록(전체 & 특정 영화)
		List<RvDTO> list(String rvmoviecd, int startRec, int endRec);
		
		// 리뷰 총계
		int rvTotalRec(String rvmoviecd);
}
