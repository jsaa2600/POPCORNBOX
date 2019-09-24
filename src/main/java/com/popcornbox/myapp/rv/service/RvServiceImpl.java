package com.popcornbox.myapp.rv.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.popcornbox.myapp.rv.dto.RvDTO;

@Service
public class RvServiceImpl implements RvService {

	// 리뷰 쓰기
	@Override
	public int write(RvDTO rvDTO) {
		return 0;
	}

	// 리뷰 수정
	@Override
	public int modify(RvDTO rvDTO) {
		return 0;
	}

	// 리뷰 삭제
	@Override
	public int delete(String rvnum) {
		return 0;
	}

	// 리뷰 좋아요 싫어요
	@Override
	public int goorOrBad(String rvnum, String goodOrBad) {
		return 0;
	}

	// 리뷰 목록(전체)
	@Override
	public List<RvDTO> list() {
		return null;
	}

	// 리뷰 목록(특정 영화)
	@Override
	public List<RvDTO> list(String rvmoviecd) {
		return null;
	}

	// 리뷰 총계
	@Override
	public int rvTotalRec(String rvmoviecd) {
		return 0;
	}
}
