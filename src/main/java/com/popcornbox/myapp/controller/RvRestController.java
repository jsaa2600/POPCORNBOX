package com.popcornbox.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.popcornbox.myapp.common.PageCriteria;
import com.popcornbox.myapp.common.RecordCriteria;
import com.popcornbox.myapp.rv.dto.RvDTO;
import com.popcornbox.myapp.rv.service.RvService;

@RestController
@RequestMapping("/rvrest")
public class RvRestController {

	private static final Logger logger = LoggerFactory.getLogger(RvRestController.class);
	
	@Inject
	RvService rvService;
	
	// 리뷰 목록 가져오기
	@GetMapping(value= {"{reqPage}", "/{reqPage}/{rvmoviecd}", "/{reqPage}/{rvmoviecd}/{condition}"}, produces="application/json;charset=UTF-8")
	public ResponseEntity<Map<String, Object>> reviewList(@PathVariable(required=false)String reqPage, @PathVariable(required=false)String rvmoviecd, @PathVariable(required=false)String condition) {
		logger.info("ResponseEntity<Map<String, Object>> reviewList 호출");
		
		ResponseEntity<Map<String, Object>> response = null;
		Map<String, Object> map = new HashMap<String, Object>();
		List<RvDTO> list = null;
		
		final int NUM_PER_PAGE = 10;		// 한 페이지에 보여줄 레코드 수
		final int PAGENUM_PER_PAGE = 10;	// 한 페이지에 보여줄 페이지 수
		
		// 파라메터 값이 넘어오지 않았을 경우 자동 설정
		if(reqPage == null || reqPage == "") {
			reqPage = "1";
		}
		if(rvmoviecd == null || rvmoviecd == "") {
			rvmoviecd = "";
		}

		RecordCriteria rc = new RecordCriteria(Integer.parseInt(reqPage), NUM_PER_PAGE);
		PageCriteria pc = new PageCriteria(rc, rvService.rvTotalRec(rvmoviecd), PAGENUM_PER_PAGE);

		// 리뷰 목록 검색 종류
		if(condition == null || condition == "") {
			list = rvService.list(rvmoviecd, rc.getStartRecord(), rc.getEndRecord());
		}
//		else(condition == "best") {
//			list = rvService.listBest(rvmoviecd, rc.getStartRecord(), rc.)
//		}
		
		map.put("reviewList", list);
		map.put("pc", pc);
		
		if(list == null) {			
			response = new ResponseEntity<Map<String, Object>>(map, HttpStatus.BAD_REQUEST);
		}
		else {
			response = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		}
		
		return response;
	}
}
