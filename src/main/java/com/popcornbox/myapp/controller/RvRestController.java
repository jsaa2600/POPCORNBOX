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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.popcornbox.myapp.common.PageCriteria;
import com.popcornbox.myapp.common.RecordCriteria;
import com.popcornbox.myapp.rv.dto.GobDTO;
import com.popcornbox.myapp.rv.dto.RvDTO;
import com.popcornbox.myapp.rv.service.RvService;

@RestController
@RequestMapping("/rvrest")
public class RvRestController {

	private static final Logger logger = LoggerFactory.getLogger(RvRestController.class);
	
	final int NUM_PER_PAGE = 10;		// 한 페이지에 보여줄 레코드 수
	final int PAGENUM_PER_PAGE = 10;	// 한 페이지에 보여줄 페이지 수
	
	@Inject
	RvService rvService;
	
	// 리뷰 목록 가져오기
	@GetMapping(value= {"/{reqPage}", "/{reqPage}/{condition}", "/{reqPage}/{condition}/{data}"}, produces="application/json;charset=UTF-8")
	public ResponseEntity<Map<String, Object>> reviewList(@PathVariable(required=false)String reqPage, @PathVariable(required=false)String condition, @PathVariable(required=false)String data) {
		logger.info("ResponseEntity<Map<String, Object>> reviewList 호출");
		
		ResponseEntity<Map<String, Object>> response = null;
		Map<String, Object> map = new HashMap<String, Object>();
		List<RvDTO> list = null;
		
		// 파라메터 값이 넘어오지 않았을 경우 자동 설정
		if(reqPage == null || reqPage.equals("")) {
			reqPage = "1";
		}
		if(condition == null || condition.equals("")) {
			condition = "moviecd";
		}
		if(data == null || data.equals("")) {
			data = "";
		}

		logger.info("reqPage = " + reqPage + ", condition = " + condition + ", data = " + data);
		
		RecordCriteria rc = new RecordCriteria(Integer.parseInt(reqPage), NUM_PER_PAGE);
		PageCriteria pc = new PageCriteria(rc, rvService.rvTotalRec(condition, data), PAGENUM_PER_PAGE);

		list = rvService.list(condition, data, rc.getStartRecord(), rc.getEndRecord());
		
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
	
	// 리뷰 좋아요 싫어요 처리
	@PostMapping(value="/gob", produces="application/json;charset=UTF-8")
	public ResponseEntity<String> gob(@RequestBody(required=true) GobDTO gobDTO) {
		logger.info("ResponseEntity<String> gob(GobDTO) 호출됨");
		logger.info("gobDTO : " + gobDTO.toString());

		ResponseEntity<String> response = null;

		if(gobDTO.getGobidfrom() != null && gobDTO.getGobidto() != null && gobDTO.getGobrvnum() != 0 && gobDTO.getGobmoviecd() != null && gobDTO.getGobstatus() != null) {
			rvService.goodOrBad(gobDTO);
			response = new ResponseEntity<String>("success", HttpStatus.OK);
		}
		else {
			response = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);			
		}
		return null;
	}
}
